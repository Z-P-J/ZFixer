//package com.zpj.hotfix.demo;
//
//import android.util.Log;
//
//import com.zpj.hotfix.FixObjectManager;
//import com.zpj.hotfix.annotation.FixClass;
//
//import java.lang.reflect.InvocationTargetException;
//
//public class NewClass {
//
//    private static final String TAG = "NewClass";
//
//    private final BugClass bugClass;
//
//    public NewClass(BugClass bugClass, String text) {
//        this.bugClass = bugClass;
//    }
//
//    public void test() {
//        Log.d(TAG, "test----->bugClass=" + bugClass);
//        // 调用新增普通方法
//        this.bugClass.test(0, 0, 0, 0,0 , 0, bugClass);
//        // 调用新增静态方法
//        BugClass.testNewStaticMethod(bugClass, 0, 0, 0,0 , 0, bugClass);
//    }
//
////    public void test1() throws Exception {
////        Log.d(TAG, "test----->bugClass=" + bugClass);
////        // 调用新增普通方法
////        bugClass.test(0, 0, 0, 0,0 , 0, bugClass);
////        // 调用新增静态方法
////        BugClass.testNewStaticMethod(bugClass, 0, 0, 0,0 , 0, bugClass);
////    }
//
////    private static BugClass getBugClass(BugClass bugClass) throws Exception {
////        return FixObjectManager.get(bugClass, BugClass.class);
////    }
//}
