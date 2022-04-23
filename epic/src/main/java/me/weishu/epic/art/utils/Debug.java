/*
 * Original work Copyright (c) 2014-2015, Marvin Wißfeld
 * Modified work Copyright (c) 2016, Alibaba Mobile Infrastructure (Android) Team
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package me.weishu.epic.art.utils;

import me.weishu.epic.BuildConfig;

public final class Debug {

    public static final boolean DEBUG = BuildConfig.DEBUG;

    private static final String RELASE_WRAN_STRING = "none in release mode.";

    private Debug() {
    }

    public static String addrHex(long i) {
        if (!DEBUG) {
            return RELASE_WRAN_STRING;
        }

        if (Runtime.is64Bit()) {
            return longHex(i);
        } else {
            return intHex((int) i);
        }
    }

    public static String longHex(long i) {
        return String.format("0x%016X", i);
    }

    public static String intHex(int i) {
        return String.format("0x%08X", i);
    }

    public static String byteHex(byte b) {
        return String.format("%02X", b);
    }

    public static String hexdump(byte[] bytes, long start) {
        if (!DEBUG) {
            return RELASE_WRAN_STRING;
        }
        StringBuffer sb = new StringBuffer();
        for (int i = 0; i < bytes.length; i++) {
            if (i % 8 == 0) {
                sb.append(addrHex(start + i)).append(":");
            }
            sb.append(byteHex(bytes[i])).append(" ");
            if (i % 8 == 7) {
                sb.append("\n");
            }
        }
        return sb.toString();
    }

}
