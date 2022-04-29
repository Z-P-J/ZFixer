/*
 * Original Copyright 2014-2015 Marvin Wißfeld
 * Modified work Copyright (c) 2017, weishu
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include <jni.h>
#include <android/log.h>
#include <sys/mman.h>
#include <errno.h>
#include <unistd.h>
#include <dlfcn.h>
#include <cstdlib>
#include <sys/system_properties.h>
#include <fcntl.h>
#include "fake_dlfcn.h"
#include "art.h"

#undef NDEBUG
#ifdef NDEBUG
#define LOGV(...)  ((void)__android_log_print(ANDROID_LOG_INFO, "epic.Native", __VA_ARGS__))
#else
#define LOGV(...)
#endif

#define JNIHOOK_CLASS "me/weishu/epic/art/EpicNative"

jobject (*addWeakGloablReference)(JavaVM *, void *, void *) = nullptr;

void *(*jit_load_)(bool *) = nullptr;

void *jit_compiler_handle_ = nullptr;

bool (*jit_compile_method_)(void *, void *, void *, bool) = nullptr;

void *(*JitCodeCache_GetCurrentRegion)(void *) = nullptr;

typedef bool (*JIT_COMPILE_METHOD1)(void *, void *, void *, bool);

typedef bool (*JIT_COMPILE_METHOD2)(void *, void *, void *, bool, bool); // Android Q
typedef bool (*JIT_COMPILE_METHOD3)(void *, void *, void *, void *, bool, bool); // Android R
typedef bool (*JIT_COMPILE_METHOD4)(void *, void *, void *, void *, int); // Android S

void (*jit_unload_)(void *) = nullptr;

class ScopedSuspendAll {
};

void (*suspendAll)(ScopedSuspendAll *, char *) = nullptr;

void (*resumeAll)(ScopedSuspendAll *) = nullptr;

class ScopedJitSuspend {
};

void (*startJit)(ScopedJitSuspend *) = nullptr;

void (*stopJit)(ScopedJitSuspend *) = nullptr;

void (*DisableMovingGc)(void *) = nullptr;

void *(*JniIdManager_DecodeMethodId_)(void *, jlong) = nullptr;

void *(*ClassLinker_MakeInitializedClassesVisiblyInitialized_)(void *, void *, bool) = nullptr;

void *__self() {

#ifdef __arm__
    register uint32_t r9 asm("r9");
    return (void*) r9;
#elif defined(__aarch64__)
    register uint64_t x19 asm("x19");
    return (void*) x19;
#else
#endif

};

static int api_level;

static jmethodID method_id_int;
static jmethodID method_id_long;
static jmethodID method_id_double;
static jmethodID method_id_float;
static jmethodID method_id_boolean;
static jmethodID method_id_char;
static jmethodID method_id_byte;
static jmethodID method_id_short;

static jclass class_exception;

void init_entries(JNIEnv *env) {

    class_exception = env->FindClass("java/lang/Exception");

    jclass clazz = env->FindClass("java/lang/Integer");
    method_id_int = env->GetMethodID(clazz, "intValue", "()I");

    clazz = env->FindClass("java/lang/Long");
    method_id_long = env->GetMethodID(clazz, "longValue", "()J");

    clazz = env->FindClass("java/lang/Double");
    method_id_double = env->GetMethodID(clazz, "doubleValue", "()D");

    clazz = env->FindClass("java/lang/Float");
    method_id_float = env->GetMethodID(clazz, "floatValue", "()F");

    clazz = env->FindClass("java/lang/Boolean");
    method_id_boolean = env->GetMethodID(clazz, "booleanValue", "()Z");

    clazz = env->FindClass("java/lang/Character");
    method_id_char = env->GetMethodID(clazz, "charValue", "()C");

    clazz = env->FindClass("java/lang/Byte");
    method_id_byte = env->GetMethodID(clazz, "byteValue", "()B");

    clazz = env->FindClass("java/lang/Short");
    method_id_short = env->GetMethodID(clazz, "shortValue", "()S");


    char api_level_str[5];
    __system_property_get("ro.build.version.sdk", api_level_str);
    api_level = atoi(api_level_str);
    LOGV("api level: %d", api_level);
    ArtHelper::init(env, api_level);
    if (api_level < 23) {
        // Android L, art::JavaVMExt::AddWeakGlobalReference(art::Thread*, art::mirror::Object*)
        void *handle = dlopen("libart.so", RTLD_LAZY | RTLD_GLOBAL);
        addWeakGloablReference = (jobject (*)(JavaVM *, void *, void *)) dlsym(handle,
                                                                               "_ZN3art9JavaVMExt22AddWeakGlobalReferenceEPNS_6ThreadEPNS_6mirror6ObjectE");
    } else if (api_level < 24) {
        // Android M, art::JavaVMExt::AddWeakGlobalRef(art::Thread*, art::mirror::Object*)
        void *handle = dlopen("libart.so", RTLD_LAZY | RTLD_GLOBAL);
        addWeakGloablReference = (jobject (*)(JavaVM *, void *, void *)) dlsym(handle,
                                                                               "_ZN3art9JavaVMExt16AddWeakGlobalRefEPNS_6ThreadEPNS_6mirror6ObjectE");
    } else {
        // Android N and O, Google disallow us use dlsym;
        void *handle = dlopen_ex("libart.so", RTLD_NOW);
        void *jit_lib = dlopen_ex("libart-compiler.so", RTLD_NOW);
        LOGV("fake dlopen install: %p", handle);
        const char *addWeakGloablReferenceSymbol = api_level <= 25
                                                   ? "_ZN3art9JavaVMExt16AddWeakGlobalRefEPNS_6ThreadEPNS_6mirror6ObjectE"
                                                   : "_ZN3art9JavaVMExt16AddWeakGlobalRefEPNS_6ThreadENS_6ObjPtrINS_6mirror6ObjectEEE";
        addWeakGloablReference = (jobject (*)(JavaVM *, void *, void *)) dlsym_ex(handle,
                                                                                  addWeakGloablReferenceSymbol);

        jit_compile_method_ = (bool (*)(void *, void *, void *, bool)) dlsym_ex(jit_lib,
                                                                                "jit_compile_method");
        jit_load_ = reinterpret_cast<void *(*)(bool *)>(dlsym_ex(jit_lib, "jit_load"));
        bool generate_debug_info = false;
        jit_compiler_handle_ = (jit_load_)(&generate_debug_info);
        LOGV("jit compile_method: %p", jit_compile_method_);

        suspendAll = reinterpret_cast<void (*)(ScopedSuspendAll *, char *)>(dlsym_ex(handle,
                                                                                     "_ZN3art16ScopedSuspendAllC1EPKcb"));
        resumeAll = reinterpret_cast<void (*)(ScopedSuspendAll *)>(dlsym_ex(handle,
                                                                            "_ZN3art16ScopedSuspendAllD1Ev"));

        if (api_level >= 30) {
            // Android R would not directly return ArtMethod address but an internal id
            ClassLinker_MakeInitializedClassesVisiblyInitialized_ = reinterpret_cast<void *(*)(
                    void *, void *, bool)>(dlsym_ex(handle,
                                                    "_ZN3art11ClassLinker40MakeInitializedClassesVisiblyInitializedEPNS_6ThreadEb"));
            JniIdManager_DecodeMethodId_ = reinterpret_cast<void *(*)(void *, jlong)>(dlsym_ex(
                    handle, "_ZN3art3jni12JniIdManager14DecodeMethodIdEP10_jmethodID"));
            if (api_level >= 31) {
                // Android S CompileMethod accepts a CompilationKind enum instead of two booleans
                // source: https://android.googlesource.com/platform/art/+/refs/heads/android12-release/compiler/jit/jit_compiler.cc
                jit_compile_method_ = (bool (*)(void *, void *, void *, bool)) dlsym_ex(jit_lib,
                                                                                        "_ZN3art3jit11JitCompiler13CompileMethodEPNS_6ThreadEPNS0_15JitMemoryRegionEPNS_9ArtMethodENS_15CompilationKindE");
            } else {
                jit_compile_method_ = (bool (*)(void *, void *, void *, bool)) dlsym_ex(jit_lib,
                                                                                        "_ZN3art3jit11JitCompiler13CompileMethodEPNS_6ThreadEPNS0_15JitMemoryRegionEPNS_9ArtMethodEbb");
            }
            JitCodeCache_GetCurrentRegion = (void *(*)(void *)) dlsym_ex(handle,
                                                                         "_ZN3art3jit12JitCodeCache16GetCurrentRegionEv");
        }
        // Disable this now.
        // startJit = reinterpret_cast<void(*)(ScopedJitSuspend*)>(dlsym_ex(handle, "_ZN3art3jit16ScopedJitSuspendD1Ev"));
        // stopJit = reinterpret_cast<void(*)(ScopedJitSuspend*)>(dlsym_ex(handle, "_ZN3art3jit16ScopedJitSuspendC1Ev"));

        // DisableMovingGc = reinterpret_cast<void(*)(void*)>(dlsym_ex(handle, "_ZN3art2gc4Heap15DisableMovingGcEv"));
    }

    LOGV("addWeakGloablReference: %p", addWeakGloablReference);
}

jboolean epic_compile(JNIEnv *env, jclass, jobject method, jlong self) {
    LOGV("self from native peer: %p, from register: %p", reinterpret_cast<void *>(self), __self());
    jlong art_method = (jlong) env->FromReflectedMethod(method);
    if (art_method % 2 == 1) {
        art_method = reinterpret_cast<jlong>(JniIdManager_DecodeMethodId_(
                ArtHelper::getJniIdManager(), art_method));
    }
    bool ret;
    if (api_level >= 30) {
        void *current_region = JitCodeCache_GetCurrentRegion(ArtHelper::getJitCodeCache());
        if (api_level >= 31) {
            ret = ((JIT_COMPILE_METHOD4) jit_compile_method_)(jit_compiler_handle_,
                                                              reinterpret_cast<void *>(self),
                                                              reinterpret_cast<void *>(current_region),
                                                              reinterpret_cast<void *>(art_method),
                                                              1);
        } else {
            ret = ((JIT_COMPILE_METHOD3) jit_compile_method_)(jit_compiler_handle_,
                                                              reinterpret_cast<void *>(self),
                                                              reinterpret_cast<void *>(current_region),
                                                              reinterpret_cast<void *>(art_method),
                                                              false, false);
        }
    } else if (api_level >= 29) {
        ret = ((JIT_COMPILE_METHOD2) jit_compile_method_)(jit_compiler_handle_,
                                                          reinterpret_cast<void *>(art_method),
                                                          reinterpret_cast<void *>(self), false,
                                                          false);
    } else {
        ret = ((JIT_COMPILE_METHOD1) jit_compile_method_)(jit_compiler_handle_,
                                                          reinterpret_cast<void *>(art_method),
                                                          reinterpret_cast<void *>(self), false);
    }
    return (jboolean) ret;
}

jlong epic_suspendAll(JNIEnv *, jclass) {
    ScopedSuspendAll *scopedSuspendAll = (ScopedSuspendAll *) malloc(sizeof(ScopedSuspendAll));
    suspendAll(scopedSuspendAll, "stop_jit");
    return reinterpret_cast<jlong >(scopedSuspendAll);
}

void epic_resumeAll(JNIEnv *env, jclass, jlong obj) {
    ScopedSuspendAll *scopedSuspendAll = reinterpret_cast<ScopedSuspendAll *>(obj);
    resumeAll(scopedSuspendAll);
}

jlong epic_stopJit(JNIEnv *, jclass) {
    ScopedJitSuspend *scopedJitSuspend = (ScopedJitSuspend *) malloc(sizeof(ScopedJitSuspend));
    stopJit(scopedJitSuspend);
    return reinterpret_cast<jlong >(scopedJitSuspend);
}

void epic_startJit(JNIEnv *, jclass, jlong obj) {
    ScopedJitSuspend *scopedJitSuspend = reinterpret_cast<ScopedJitSuspend *>(obj);
    startJit(scopedJitSuspend);
}

void epic_disableMovingGc(JNIEnv *env, jclass, jint api) {
    void *heap = ArtHelper::getHeap();
    DisableMovingGc(heap);
}

jboolean epic_munprotect(JNIEnv *env, jclass, jlong addr, jlong len) {
    long pagesize = sysconf(_SC_PAGESIZE);
    unsigned alignment = (unsigned) ((unsigned long long) addr % pagesize);
    LOGV("munprotect page size: %d, alignment: %d", pagesize, alignment);

    int i = mprotect((void *) (addr - alignment), (size_t) (alignment + len),
                     PROT_READ | PROT_WRITE | PROT_EXEC);
    if (i == -1) {
        LOGV("mprotect failed: %s (%d)", strerror(errno), errno);
        return JNI_FALSE;
    }
    return JNI_TRUE;
}

jboolean epic_cacheflush(JNIEnv *env, jclass, jlong addr, jlong len) {
#if defined(__arm__)
    int i = cacheflush(addr, addr + len, 0);
    LOGV("arm cacheflush for, %ul", addr);
    if (i == -1) {
        LOGV("cache flush failed: %s (%d)", strerror(errno), errno);
        return JNI_FALSE;
    }
#elif defined(__aarch64__)
    char* begin = reinterpret_cast<char*>(addr);
    __builtin___clear_cache(begin, begin + len);
    LOGV("aarch64 __builtin___clear_cache, %p", (void*)begin);
#endif
    return JNI_TRUE;
}

void epic_MakeInitializedClassVisibilyInitialized(JNIEnv *env, jclass, jlong self) {
    if (api_level >= 30 && ClassLinker_MakeInitializedClassesVisiblyInitialized_ &&
        ArtHelper::getClassLinker()) {
        ClassLinker_MakeInitializedClassesVisiblyInitialized_(ArtHelper::getClassLinker(),
                                                              reinterpret_cast<void *>(self), true);
    }
}

void epic_memcpy(JNIEnv *env, jclass, jlong src, jlong dest, jint length) {
    char *srcPnt = (char *) src;
    char *destPnt = (char *) dest;
    for (int i = 0; i < length; ++i) {
        destPnt[i] = srcPnt[i];
    }
}

void epic_memput(JNIEnv *env, jclass, jbyteArray src, jlong dest) {

    jbyte *srcPnt = env->GetByteArrayElements(src, 0);
    jsize length = env->GetArrayLength(src);
    unsigned char *destPnt = (unsigned char *) dest;
    for (int i = 0; i < length; ++i) {
        // LOGV("put %d with %d", i, *(srcPnt + i));
        destPnt[i] = (unsigned char) srcPnt[i];
    }
    env->ReleaseByteArrayElements(src, srcPnt, 0);
}

jbyteArray epic_memget(JNIEnv *env, jclass, jlong src, jint length) {

    jbyteArray dest = env->NewByteArray(length);
    if (dest == NULL) {
        return NULL;
    }
    unsigned char *destPnt = (unsigned char *) env->GetByteArrayElements(dest, 0);
    unsigned char *srcPnt = (unsigned char *) src;
    for (int i = 0; i < length; ++i) {
        destPnt[i] = srcPnt[i];
    }
    env->ReleaseByteArrayElements(dest, (jbyte *) destPnt, 0);

    return dest;
}

jlong epic_mmap(JNIEnv *env, jclass, jint length) {
    void *space = mmap(0, (size_t) length, PROT_READ | PROT_WRITE | PROT_EXEC,
                       MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
    if (space == MAP_FAILED) {
        LOGV("mmap failed: %d", errno);
        return 0;
    }
    return (jlong) space;
}

void epic_munmap(JNIEnv *env, jclass, jlong addr, jint length) {
    int r = munmap((void *) addr, (size_t) length);
    if (r == -1) {
        LOGV("munmap failed: %d", errno);
    }
}

jlong epic_malloc(JNIEnv *env, jclass, jint size) {
    size_t length = sizeof(void *) * size;
    void *ptr = malloc(length);
    LOGV("malloc :%d of memory at: %p", (int) length, ptr);
    return (jlong) ptr;
}


jobject epic_getobject(JNIEnv *env, jclass clazz, jlong self, jlong address) {
    JavaVM *vm;
    env->GetJavaVM(&vm);
    LOGV("java vm: %p, self: %p, address: %p", vm, (void *) self, (void *) address);
    jobject object = addWeakGloablReference(vm, (void *) self, (void *) address);

    return object;
}

jlong epic_getMethodAddress(JNIEnv *env, jclass clazz, jobject method) {
    jlong art_method = (jlong) env->FromReflectedMethod(method);
    if (art_method % 2 == 1) {
        art_method = reinterpret_cast<jlong>(JniIdManager_DecodeMethodId_(
                ArtHelper::getJniIdManager(), art_method));
    }
    return art_method;
}

jboolean epic_isGetObjectAvaliable(JNIEnv *, jclass) {
    return (jboolean) (addWeakGloablReference != nullptr);
}

jboolean
epic_activate(JNIEnv *env, jclass jclazz, jlong jumpToAddress, jlong pc, jlong sizeOfDirectJump,
              jlong sizeOfBridgeJump, jbyteArray code) {

    // fetch the array, we can not call this when thread suspend(may lead deadlock)
    jbyte *srcPnt = env->GetByteArrayElements(code, 0);
    jsize length = env->GetArrayLength(code);

    jlong cookie = 0;
    bool isNougat = api_level >= 24;
    if (isNougat) {
        // We do thus things:
        // 1. modify the code mprotect
        // 2. modify the code

        // Ideal, this two operation must be atomic. Below N, this is safe, because no one
        // modify the code except ourselves;
        // But in Android N, When the jit is working, between our step 1 and step 2,
        // if we modity the mprotect of the code, and planning to write the code,
        // the jit thread may modify the mprotect of the code meanwhile
        // we must suspend all thread to ensure the atomic operation.

        LOGV("suspend all thread.");
        cookie = epic_suspendAll(env, jclazz);
    }

    jboolean result = epic_munprotect(env, jclazz, jumpToAddress, sizeOfDirectJump);
    if (result) {
        unsigned char *destPnt = (unsigned char *) jumpToAddress;
        for (int i = 0; i < length; ++i) {
            destPnt[i] = (unsigned char) srcPnt[i];
        }
        jboolean ret = epic_cacheflush(env, jclazz, pc, sizeOfBridgeJump);
        if (!ret) {
            LOGV("cache flush failed!!");
        }
    } else {
        LOGV("Writing hook failed: Unable to unprotect memory at %d", jumpToAddress);
    }

    if (cookie != 0) {
        LOGV("resume all thread.");
        epic_resumeAll(env, jclazz, cookie);
    }

    env->ReleaseByteArrayElements(code, srcPnt, 0);
    return result;
}

/**
 * 将参数中的包装类对象进行拆箱操作
 * @param env JNI环境
 * @param desc 方法签名描述
 * @param args 原有参数数据
 * @param parameters jvalue参数数组
 */
char
parseArgs(JNIEnv *env, const char *desc, jobjectArray args, jvalue *parameters) {

    int index = 0;

    // 0:normal, 1:object, 2:array
    int type = 0;

    int start = 0;
    for (int i = 0; i < strlen(desc); i++) {
        char c = desc[i];


        if (c == '(') {
            continue;
        }
        if (c == ')') {
            return desc[i + 1];
        }

        if (type == 1) {
            if (c == ';') {
                type = 0;
                parameters[index].l = env->GetObjectArrayElement(args, index);
                index++;
            }
            continue;
        } else if (type == 2) {
            if (c == '[') {
                start = i;
            } else if (i - start == 1 && (c == 'I' || c == 'J' || c == 'D' || c == 'F'
                                          || c == 'Z' || c == 'C' || c == 'B' || c == 'S')) {
                type = 0;
                parameters[index].l = env->GetObjectArrayElement(args, index);
                index++;
            } else if (c == ';') {
                type = 0;
                parameters[index].l = env->GetObjectArrayElement(args, index);
                index++;
            }

            continue;
        }


        if (c == 'L') {
            type = 1;
            continue;
        } else if (c == '[') {
            type = 2;
            start = i;
            continue;
        }


        jobject obj = env->GetObjectArrayElement(args, index);
        switch (c) {
            case 'I':
                parameters[index].i = env->CallIntMethod(obj, method_id_int);
                break;
            case 'J':
                parameters[index].j = env->CallLongMethod(obj, method_id_long);
                break;
            case 'D':
                parameters[index].d = env->CallDoubleMethod(obj, method_id_double);
                break;
            case 'F':
                parameters[index].f = env->CallFloatMethod(obj, method_id_float);
                break;
            case 'Z':
                parameters[index].z = env->CallBooleanMethod(obj, method_id_boolean);
                break;
            case 'C':
                parameters[index].c = env->CallCharMethod(obj, method_id_char);
                break;
            case 'B':
                parameters[index].b = env->CallByteMethod(obj, method_id_byte);
                break;
            case 'S':
                parameters[index].s = env->CallShortMethod(obj, method_id_short);
                break;
            default:
                env->ThrowNew(class_exception, "signature error!");
        }
        index++;
    }
    return '\0';
}

jvalue *invokeSuperMethod(JNIEnv *env, jobject obj, jstring name, jstring sig,
                          jobjectArray args, bool isVoid) {
    jclass clazz = env->GetObjectClass(obj);
    jclass parentClass = env->GetSuperclass(clazz);
    const char *desc = env->GetStringUTFChars(sig, nullptr);
    jmethodID methodId = env->GetMethodID(parentClass,
                                          env->GetStringUTFChars(name, nullptr),
                                          desc);
    jthrowable th = env->ExceptionOccurred();
    if (th) {
        env->ExceptionClear();
        env->Throw(th);
    }

    int len = env->GetArrayLength(args);
    jvalue parameters[len];
//    for (int i = 0; i < len; i++) {
//        parameters[i].l = env->GetObjectArrayElement(args, i);
//    }
    char returnType = parseArgs(env, desc, args, parameters);


    auto *result = new jvalue();
    switch (returnType) {
        case 'V':
            env->CallNonvirtualVoidMethodA(obj, parentClass, methodId, parameters);
            break;
        case 'I':
            result->i = env->CallNonvirtualIntMethodA(obj, parentClass, methodId, parameters);
            break;
        case 'J':
            result->j = env->CallNonvirtualLongMethodA(obj, parentClass, methodId, parameters);
            break;
        case 'D':
            result->d = env->CallNonvirtualDoubleMethodA(obj, parentClass, methodId, parameters);
            break;
        case 'F':
            result->f = env->CallNonvirtualFloatMethodA(obj, parentClass, methodId, parameters);
            break;
        case 'Z':
            result->z = env->CallNonvirtualBooleanMethodA(obj, parentClass, methodId, parameters);
            break;
        case 'C':
            result->c = env->CallNonvirtualCharMethodA(obj, parentClass, methodId, parameters);
            break;
        case 'B':
            result->b = env->CallNonvirtualByteMethodA(obj, parentClass, methodId, parameters);
            break;
        case 'S':
            result->s = env->CallNonvirtualShortMethodA(obj, parentClass, methodId, parameters);
            break;
        default:
            result->l = env->CallNonvirtualObjectMethodA(obj, parentClass, methodId, parameters);
            break;
    }

//    jobject result = nullptr;
//    if (isVoid) {
//        env->CallNonvirtualVoidMethodA(obj, parentClass, methodId, parameters);
//    } else  {
//        result =
//    }
    th = env->ExceptionOccurred();
    if (th) {
        env->ExceptionClear();
        env->Throw(th);
    }
    return result;
}

jobject
epic_invokeSuperObject(JNIEnv *env, jclass jclazz, jobject obj, jstring name, jstring sig,
                       jobjectArray args) {
    return invokeSuperMethod(env, obj, name, sig, args, false)->l;
}

void
epic_invokeSuperVoid(JNIEnv *env, jclass jclazz, jobject obj, jstring name, jstring sig,
                     jobjectArray args) {
    invokeSuperMethod(env, obj, name, sig, args, true);
}

jint
epic_invokeSuperInt(JNIEnv *env, jclass jclazz, jobject obj, jstring name, jstring sig,
                    jobjectArray args) {
    return invokeSuperMethod(env, obj, name, sig, args, false)->i;
}

jlong
epic_invokeSuperLong(JNIEnv *env, jclass jclazz, jobject obj, jstring name, jstring sig,
                     jobjectArray args) {
    return invokeSuperMethod(env, obj, name, sig, args, false)->j;
}

jdouble
epic_invokeSuperDouble(JNIEnv *env, jclass jclazz, jobject obj, jstring name, jstring sig,
                       jobjectArray args) {
    return invokeSuperMethod(env, obj, name, sig, args, false)->d;
}

jfloat
epic_invokeSuperFloat(JNIEnv *env, jclass jclazz, jobject obj, jstring name, jstring sig,
                      jobjectArray args) {
    return invokeSuperMethod(env, obj, name, sig, args, false)->f;
}

jboolean
epic_invokeSuperBoolean(JNIEnv *env, jclass jclazz, jobject obj, jstring name, jstring sig,
                        jobjectArray args) {
    return invokeSuperMethod(env, obj, name, sig, args, false)->z;
}

jchar
epic_invokeSuperChar(JNIEnv *env, jclass jclazz, jobject obj, jstring name, jstring sig,
                     jobjectArray args) {
    return invokeSuperMethod(env, obj, name, sig, args, false)->c;
}

jbyte
epic_invokeSuperByte(JNIEnv *env, jclass jclazz, jobject obj, jstring name, jstring sig,
                     jobjectArray args) {
    return invokeSuperMethod(env, obj, name, sig, args, false)->b;
}

jshort
epic_invokeSuperShort(JNIEnv *env, jclass jclazz, jobject obj, jstring name, jstring sig,
                      jobjectArray args) {
    return invokeSuperMethod(env, obj, name, sig, args, false)->s;
}

static JNINativeMethod dexposedMethods[] = {

        {"mmap", "(I)J", (void *) epic_mmap},
        {"munmap", "(JI)Z", (void *) epic_munmap},
        {"memcpy", "(JJI)V", (void *) epic_memcpy},
        {"memput", "([BJ)V", (void *) epic_memput},
        {"memget", "(JI)[B", (void *) epic_memget},
        {"munprotect", "(JJ)Z", (void *) epic_munprotect},
        {"getMethodAddress", "(Ljava/lang/reflect/Member;)J", (void *) epic_getMethodAddress},
        {"cacheflush", "(JJ)Z", (void *) epic_cacheflush},
        {"MakeInitializedClassVisibilyInitialized", "(J)V",
         (void *) epic_MakeInitializedClassVisibilyInitialized},
        {"malloc", "(I)J", (void *) epic_malloc},
        {"getObjectNative", "(JJ)Ljava/lang/Object;", (void *) epic_getobject},
        {"compileMethod", "(Ljava/lang/reflect/Member;J)Z", (void *) epic_compile},
        {"suspendAll", "()J", (void *) epic_suspendAll},
        {"resumeAll", "(J)V", (void *) epic_resumeAll},
        {"stopJit", "()J", (void *) epic_stopJit},
        {"startJit", "(J)V", (void *) epic_startJit},
        {"disableMovingGc", "(I)V", (void *) epic_disableMovingGc},
        {"activateNative", "(JJJJ[B)Z", (void *) epic_activate},
        {"isGetObjectAvailable", "()Z", (void *) epic_isGetObjectAvaliable},
        {"invokeSuperObject",
         "(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;",
         (void *) epic_invokeSuperObject},
        {"invokeSuperVoid",
         "(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V",
         (void *) epic_invokeSuperVoid},
        {"invokeSuperInt",
         "(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)I",
         (void *) epic_invokeSuperInt},
        {"invokeSuperLong",
         "(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)J",
         (void *) epic_invokeSuperLong},
        {"invokeSuperDouble",
         "(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)D",
         (void *) epic_invokeSuperDouble},
        {"invokeSuperFloat",
         "(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)F",
         (void *) epic_invokeSuperFloat},
        {"invokeSuperBoolean",
         "(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)Z",
         (void *) epic_invokeSuperBoolean},
        {"invokeSuperChar",
         "(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)C",
         (void *) epic_invokeSuperChar},
        {"invokeSuperByte",
         "(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)B",
         (void *) epic_invokeSuperByte},
        {"invokeSuperShort",
         "(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)S",
         (void *) epic_invokeSuperShort},
};

static int registerNativeMethods(JNIEnv *env, const char *className,
                                 JNINativeMethod *gMethods, int numMethods) {

    jclass clazz = env->FindClass(className);
    if (clazz == NULL) {
        return JNI_FALSE;
    }

    if (env->RegisterNatives(clazz, gMethods, numMethods) < 0) {
        return JNI_FALSE;
    }

    return JNI_TRUE;
}

JNIEXPORT jint JNICALL JNI_OnLoad(JavaVM *vm, void *reserved) {

    JNIEnv *env = NULL;

    LOGV("JNI_OnLoad");

    if (vm->GetEnv((void **) &env, JNI_VERSION_1_6) != JNI_OK) {
        return -1;
    }

    if (!registerNativeMethods(env, JNIHOOK_CLASS, dexposedMethods,
                               sizeof(dexposedMethods) / sizeof(dexposedMethods[0]))) {
        return -1;
    }

    init_entries(env);
    return JNI_VERSION_1_6;
}
