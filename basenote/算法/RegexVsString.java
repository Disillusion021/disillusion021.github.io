package com.hstech.web.service.gvinterface.impl;

import java.util.ArrayList;

public class RegexVsString {
    // 正则与字符串操作效率比较
    // 结论:字符串操作快
    public static void main(String[] args) {
        ArrayList<String> ss = new ArrayList<>();
        String str1 = "131.341[.content";
        String str2 = "131.341].content";
        String str3 = "131.341.content";
        String str4 = "[131].[341].content";
        String str5 = "[].[341].content";
        String str6 = "[].[0].content";
        String str7 = "[131].[341.content";
        String str8 = "131].[341].content";
        String str9 = "]131.[341].content[";
        ss.add(str1);
        ss.add(str2);
        ss.add(str3);
        ss.add(str4);
        ss.add(str5);
        ss.add(str6);
        ss.add(str7);
        ss.add(str8);
        ss.add(str9);
        long l1 = System.currentTimeMillis();
        String reg = "\\[[0-9]{1,3}]";
        for (String str : ss) {
            String[] split = str.split(reg);
            for (String s : split) {
                System.out.println(s);
            }
        }
        long l2 = System.currentTimeMillis();
        System.out.println(l2 - l1 + "fdafadfadsfadfadsfadf");

        // 查询开始到结束之间的字符
        long l3 = System.currentTimeMillis();
        String startStr = "]"; // 开始之后的我要 有开始没结束我要
        String endStr = "["; // 结束之前的我要 没开始就结束的我要
        for (String str : ss) {
            int endIdx = str.indexOf(endStr);
            int startIdx = str.indexOf(startStr);
            if (startIdx == -1 ) {
                startIdx = -1;
            }
            if (endIdx == -1) {
                endIdx = str.length();
            }
            if (startIdx > endIdx) {
                startIdx = -1;
            }
            while (true) {
                endIdx = str.indexOf(endStr, startIdx);
                if (endIdx == -1) {
                    endIdx = str.length();
                    System.out.println(str.substring(startIdx + 1, endIdx));
                    break;
                } else {
                    System.out.println(str.substring(startIdx + 1, endIdx));
                    startIdx = str.indexOf(startStr, endIdx);
                    if (startIdx == -1) break;
                }
            }
        }
        long l4 = System.currentTimeMillis();
        System.out.println(l4 - l3 + "fdafadfadsfadfadsfadf");
    }
}
