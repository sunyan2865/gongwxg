package com.seeyon.apps.gwxg;

import java.io.File;

public class fileRename {


    public static void main(String[] args) {
        File file = new File("D:/xgfilename");
        File[] list = file.listFiles();
        // 如果目录下文件存在
        if (file.exists() && file.isDirectory()) {
            for (int i = 0; i < list.length; i++) {
                //取文件名子存入name中
                String name = list[i].getName();

                String name2 = name+"_aa";
                //重命名并存入d:/photos
                File dest = new File("D:/xgfilename" + "/" + name2);
                list[i].renameTo(dest);
                System.out.println(dest.getName());
            }
        }

    }
}
