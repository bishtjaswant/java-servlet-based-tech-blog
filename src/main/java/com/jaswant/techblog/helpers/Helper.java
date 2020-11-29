package com.jaswant.techblog.helpers;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

public class Helper {

    public static boolean deleteFile(String deleteFrom){
        boolean isDeleted= false;
        try {
            File file= new File(deleteFrom);;
           isDeleted= file.delete();
        }catch (Exception e){
            e.printStackTrace();
        }
        return isDeleted;
    }

    public static boolean saveFile(InputStream is, String filePath){
        boolean isSaved=false;
        try {
            byte[] data= new byte[is.available()];
            is.read(data);
            FileOutputStream fos= new FileOutputStream(filePath);
            fos.write(data);

            fos.close();
            is.close();

            isSaved=true;
        } catch (IOException e) {
            e.printStackTrace();
        }

        return isSaved;
    }
}
