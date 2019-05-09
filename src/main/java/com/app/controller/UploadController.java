package com.app.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;

@Controller
public class UploadController {

    @RequestMapping("/upload")
    @ResponseBody
    private String uploadFile(HttpServletRequest request, @RequestParam("file") MultipartFile file) throws IOException {
        if(!file.isEmpty()) {
            //�ϴ��ļ�·��
            String path = request.getServletContext().getRealPath("uploadFile/");
            //�ϴ��ļ���
            String filename = file.getOriginalFilename();
            File filepath = new File(path,filename);
            //���ϴ��ļ����浽һ��Ŀ���ļ�����
            String pathName = path + File.separator + filename;
            file.transferTo(new File(pathName));
            return "uploadFile/" + filename;
        } else {
            return "error";
        }
    }

    @RequestMapping("/upload3D")
    @ResponseBody
    private String uploadFile3D(HttpServletRequest request, @RequestParam("file") MultipartFile file) throws IOException {
        if(!file.isEmpty()) {
            //�ϴ��ļ�·��
            String path = request.getServletContext().getRealPath("file/");
            //�ϴ��ļ���
            String filename = file.getOriginalFilename();
            File filepath = new File(path,filename);
            //���ϴ��ļ����浽һ��Ŀ���ļ�����
            String pathName = path + File.separator + filename;
            file.transferTo(new File(pathName));
            return filename;
        } else {
            return "error";
        }
    }


}
