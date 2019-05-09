package com.app.utils;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;

public class UploadFile {

    public String upload(HttpServletRequest request, HttpServletResponse response)
    {
        String savePath = "";


        // �ڽ�������֮ǰ���ж����������Ƿ�Ϊ�ļ��ϴ�����
        boolean isMultipart = ServletFileUpload.isMultipartContent(request);
        // �ļ��ϴ�������
        FileItemFactory factory = new DiskFileItemFactory();
        // �����ļ��ϴ�������
        ServletFileUpload upload = new ServletFileUpload(factory);
        // ��ʼ����������Ϣ
        List items = null;
        try {
            items = upload.parseRequest(request);
        }
        catch (FileUploadException e) {
            e.printStackTrace();
        }

        // ������������Ϣ�����ж�
        Iterator iter = items.iterator();
        while (iter.hasNext()) {
            FileItem item = (FileItem) iter.next();
            // ��ϢΪ��ͨ�ĸ�ʽ
            if (item.isFormField()) {
                String fieldName = item.getFieldName();
                String value = item.getString();
                request.setAttribute(fieldName, value);
            }
            // ��ϢΪ�ļ���ʽ
            else {
                String fileName = item.getName();

                String suffix = fileName.substring(fileName.lastIndexOf(".") + 1);
                fileName =  UUID.randomUUID()+"."+suffix;
                savePath = "UploadFile/"+fileName;
                //  int index = fileName.lastIndexOf("\\");
                //fileName = fileName.substring(index + 1);
                request.setAttribute("realFileName", fileName);

                // ���ļ�д��
//              String path = req.getContextPath();
//              String directory = "UploadFile";
//              String basePath = req.getScheme() + "://" + req.getServerName() + ":" + req.getServerPort() + path + "/" + directory;
                String basePath = request.getRealPath("/UploadFile");
                File file = new File(basePath, fileName);
                try {
                    item.write(file);
                }
                catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }

        return savePath;

    }
}
