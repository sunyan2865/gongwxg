package com.seeyon.apps.gwxg.controller;

import com.seeyon.apps.gwxg.util.CommonUtil;
import com.seeyon.ctp.common.controller.BaseController;
import com.seeyon.ctp.common.filemanager.event.FileDownloadEvent;
import com.seeyon.ctp.common.po.filemanager.V3XFile;
import com.seeyon.ctp.util.annotation.ListenEvent;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.ServletContextAware;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletContext;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;

public class FileController  extends BaseController {
    /***
     * 下载附件
     */
    public ModelAndView fileDownload_zdy(HttpServletRequest request, HttpServletResponse response) {
        //获取网站部 00+署路径(通过ServletContext对象)，用于确定下载文件位置，从而实现下载
        try {
            String filename = request.getParameter("filename");//真实文件名且有后缀
            String fileurl = request.getParameter("fileurl");//服务器中的文件名
            String createDate = request.getParameter("createDate");
            String[] datearr = createDate.split("-");

            String pathstr = datearr[0] + "/" + datearr[1] + "/" + datearr[2] + "/";

            //1.设置文件ContentType类型，这样设置，会自动判断下载文件类型
            response.setContentType("multipart/form-data");
            //2.设置文件头：最后一个参数是设置下载文件名
            response.setHeader("Content-Disposition", "attachment;filename=" + URLEncoder.encode(filename, "UTF-8"));
            ServletOutputStream out;
            //通过文件路径获得File对象
            // File file = new File(path + pathstr + filename);
            /*        File file = new File("D:/upload/" + pathstr + filename);*/
            // File file = new File("D:/upload/" + pathstr + fileurl);
            File file = new File("/upload/" + pathstr + fileurl);//linux
            // File file = new File("D:/upload/" + pathstr + fileurl);//windows

            FileInputStream inputStream = new FileInputStream(file);
            //3.通过response获取ServletOutputStream对象(out)
            out = response.getOutputStream();
            int b = 0;
            byte[] buffer = new byte[512];
            while (b != -1) {
                b = inputStream.read(buffer);
                //4.写到输出流(out)中
                out.write(buffer, 0, b);
            }
            inputStream.close();
            out.close();
            out.flush();

        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }


    /***
     * 删除文件，重命名文件
     * @param request
     * @param response
     * @return
     */
    public ModelAndView toDelAndReNameFile(HttpServletRequest request, HttpServletResponse response) {
        try {
            String oldfilename = request.getParameter("oldfilename");//原文件删除
            String newfilename = request.getParameter("newfilename");//新文件被重命名为原文件名
            String oldzwdate = request.getParameter("oldzwdate");//源文件所在位置
            String newzwdate = request.getParameter("newzwdate");//新文件所在位置
            if (!("".equals(oldzwdate)) && !("".equals(newzwdate))) {
                String[] olddatearr = oldzwdate.split("-");
                String oldpathstr = olddatearr[0] + "/" + olddatearr[1] + "/" + olddatearr[2] + "/";

                String subnewzwdate = newzwdate.substring(0, 10);
                String[] newdatearr = subnewzwdate.split("-");
                String newpathstr = newdatearr[0] + "/" + newdatearr[1] + "/" + newdatearr[2] + "/";

                /***测试服务器***/
                File newfile = new File("D:/upload/" + newpathstr + newfilename);
                File newfilerename = new File("D:/upload/" + newpathstr + oldfilename);//不在同一个目录下，先重命名再移动
                File oldfile = new File("D:/upload/" + oldpathstr + oldfilename);
                File oldfilebak = new File("D:/upload/" + oldpathstr + (oldfilename + "_" + CommonUtil.generateID()));

                /***真实服务器***/
              /*  File oldfile = new File("/upload/" + oldpathstr + oldfilename);
                File oldfilebak=new File("/upload/" + oldpathstr + (oldfilename+"_"+ CommonUtil.generateID()));
                File newfile = new File("/upload/" + newpathstr + newfilename);
                File newfilerename=new File("/upload/" + newpathstr + oldfilename);*/
                //删除缓存中文件
                String zwdate=oldzwdate.replaceAll("-","");

                /***真实服务器***/
               /* String viewpath1 = "/oa/Seeyon/A8/base/officetrans/" + zwdate + "/" + oldfilename;
                String viewpath2 = "/oa/A8/base/officetrans/" + zwdate + "/" + oldfilename;*/

                /***测试服务器***/
                String viewpath1 = "D:/software/setup/Business_A8_7.1SP1/Seeyon/A8/base/officetrans/" + zwdate + "/" + oldfilename;
                String viewpath2 = "D:/software/setup/Business_A8_7.1SP1/Seeyon/A8/base/officetrans/test/" + zwdate + "/" + oldfilename;
                // 判断目录或文件是否存在
                if (!oldfile.exists()) {
                    return null;
                } else {
                    oldfile.renameTo(oldfilebak);//原文件重命名
                }
                DeleteFolder(viewpath1);
                DeleteFolder(viewpath2);

                if (subnewzwdate.equals(oldzwdate)) {//原文件与新文件路径相同  直接修改文件名
                    newfile.renameTo(oldfile);
                } else {//路径不同，先重命名再移动到原路径
                    newfile.renameTo(newfilerename);
                    newfilerename.renameTo(oldfile);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }


    public void DeleteFolder(String sPath) {
        File file = new File(sPath);
        // 判断目录或文件是否存在
        if (!file.exists()) {  // 不存在返回 false
            return;
        } else {
            // 判断是否为文件
            if (file.isFile()) {  // 为文件时调用删除文件方法
                deleteFile(sPath);
            } else {  // 为目录时调用删除目录方法
                deleteDirectory(sPath);
            }
        }
    }


    /**
     * 删除目录（文件夹）以及目录下的文件
     *
     * @param sPath 被删除目录的文件路径
     * @return 目录删除成功返回true，否则返回false
     */
    public void deleteDirectory(String sPath) {
        //如果sPath不以文件分隔符结尾，自动添加文件分隔符
        if (!sPath.endsWith(File.separator)) {
            sPath = sPath + File.separator;
        }
        File dirFile = new File(sPath);
        //如果dir对应的文件不存在，或者不是一个目录，则退出
        if (!dirFile.exists() || !dirFile.isDirectory()) {
            return;
        }
        //删除文件夹下的所有文件(包括子目录)
        File[] files = dirFile.listFiles();
        for (int i = 0; i < files.length; i++) {
            //删除子文件
            if (files[i].isFile()) {
                deleteFile(files[i].getAbsolutePath());
            } //删除子目录
            else {
                deleteDirectory(files[i].getAbsolutePath());
            }
        }
        //删除当前目录
        if (dirFile.delete()) {
            return;
        } else {
            return;
        }
    }


    /**
     * 删除单个文件
     *
     * @param sPath 被删除文件的文件名
     * @return 单个文件删除成功返回true，否则返回false
     */
    public void deleteFile(String sPath) {
        File file = new File(sPath);
        // 路径为文件且不为空则进行删除
        if (file.isFile() && file.exists()) {
            file.delete();
        }
        return;
    }
}