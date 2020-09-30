package com.seeyon.apps.gwxg.controller;

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

public class FileController  extends BaseController {
    /***
     * 下载附件
     */
    public ModelAndView fileDownload_zdy(HttpServletRequest request, HttpServletResponse response){
        //获取网站部 00+署路径(通过ServletContext对象)，用于确定下载文件位置，从而实现下载
        try {
            String filename = request.getParameter("filename");//真实文件名且有后缀
            String fileurl=request.getParameter("fileurl");//服务器中的文件名
            String createDate=request.getParameter("createDate");
            String[] datearr=createDate.split("-");
            String pathstr=datearr[0]+"/"+datearr[1]+"/"+datearr[2]+"/";

            //1.设置文件ContentType类型，这样设置，会自动判断下载文件类型
            response.setContentType("multipart/form-data");
            //2.设置文件头：最后一个参数是设置下载文件名
            response.setHeader("Content-Disposition", "attachment;filename="+ URLEncoder.encode(filename, "UTF-8"));
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
                while (b != -1){
                    b = inputStream.read(buffer);
                    //4.写到输出流(out)中
                    out.write(buffer,0,b);
                }
                inputStream.close();
                out.close();
                out.flush();

        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }


}