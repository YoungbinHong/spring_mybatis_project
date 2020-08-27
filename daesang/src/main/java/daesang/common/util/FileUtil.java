package daesang.common.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.channels.FileChannel;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
import org.springframework.web.multipart.MultipartFile;

/***************************************************
* @FileName   : FileUtil.java
* @Description:
* @Author     : joon
* @Version    : 2016. 01. 14.
* @Copyright  : ⓒ ADUP. All Right Reserved
***************************************************/
public class FileUtil {

    private static final Logger logger = LoggerFactory.getLogger(FileUtil.class);

    /***************************************************
    * @MethodName : createDirectory
    * @Description: create Directory
    * @param      : String directoryName
    * @return     : void
    * @Author     : joon
    * @Version    : 2016. 01. 14.
    ***************************************************/
    public void createDirectory(String directoryName) {

        File theDir = new File(directoryName);

        if (!theDir.exists()) {
            if (theDir.mkdirs() == false) {
                logger.info("Create Directory Fail!!");
            }
        }
    }

    /***************************************************
    * @MethodName : writeFile
    * @Description: file save
    * @param      : MultipartFile upload, String pathNm, String saveNm
    * @return     : void
    * @Author     : joon
    * @Version    : 2016. 01. 14.
    ***************************************************/
    public void writeFile(MultipartFile upload, String pathNm, String saveNm) throws Exception {

        createDirectory(pathNm);

        File file = new File(pathNm + "/" + saveNm);

        upload.transferTo(file);
    }

    /***************************************************
    * @MethodName : deleteFile
    * @Description: file delete
    * @param      : String pathNm, String saveNm
    * @return     : void
    * @Author     : joon
    * @Version    : 2016. 01. 14.
    ***************************************************/
    public void deleteFile(String pathNm, String saveNm) throws Exception {

        File file = new File(pathNm + "/" + saveNm);

        if (!file.delete()) {
            //logger.info("File Delete Fail!!");
        }
    }

    /***************************************************
    * @MethodName : delelteAll
    * @Description: Delete all the files in the destination directory, the lower
    * @param      : String path
    * @return     : void
    * @Author     : joon
    * @Version    : 2016. 01. 14.
    ***************************************************/
    public void delelteAll(String path) throws IOException {
        File file = new File(path);
        if (file.exists()) {
            if (file.isDirectory()) {
                String[] list = file.list();
                if (list.length != 0) {
                    for (int i = 0; i < list.length; i++) {
                        File delFile = new File(path + File.separator + list[i]);
                        if (delFile.isDirectory()) {

                            delelteAll(path + File.separator + list[i]);
                        } else {
                            delFile.delete();
                        }
                    }
                }
            }
            file.delete();
        }
    }

    /***************************************************
    * @MethodName : fileCopy
    * @Description: file Copy
    * @param      : String inFileName, String outFileName
    * @return     : void
    * @Author     : joon
    * @Version    : 2016. 01. 14.
    ***************************************************/
    @SuppressWarnings("resource")
    public static void fileCopy(String inFileName, String outFileName) {
        FileChannel inChannel = null;
        FileChannel outChannel = null;
        try {
            inChannel = new FileInputStream(inFileName).getChannel();
            outChannel = new FileOutputStream(outFileName).getChannel();
            int maxCount = (64 * 1024 * 1024) - (32 * 1024);
            long size = inChannel.size();
            long position = 0;
            while (position < size) {
                position += inChannel.transferTo(position, maxCount, outChannel);
            }
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (inChannel != null) {
                try {
                    inChannel.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }

            if (outChannel != null) {
                try {
                    outChannel.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }

        }
    }

    /***************************************************
    * @MethodName : delFile
    * @Description: File delete
    * @param      : String fileName
    * @return     : boolean
    * @Author     : joon
    * @Version    : 2016. 01. 14.
    ***************************************************/
    public static boolean delFile(String fileName) {
        boolean flag = false;
        File file = new File(fileName);
        try {
            if (file.exists()) {
                flag = file.delete();
                if (!flag)
                    new Exception("Info File Delete Fail : " + fileName);
            } else
                new Exception("Info File Or Directory Not Found");
        } catch (Exception e) {
            e.printStackTrace();
        }

        return flag;
    }

    /***************************************************
    * @MethodName : renameFile
    * @Description: file rename
    * @param      : String saveDirectory, String filename, String newFileName
    * @return     : boolean
    * @Author     : joon
    * @Version    : 2016. 01. 14.
    ***************************************************/
    public static boolean renameFile(String saveDirectory, String filename, String newFileName) {
        boolean flag = false;
        File file = new File(saveDirectory + java.io.File.separator + filename);
        File file2 = new File(saveDirectory + java.io.File.separator + newFileName);
        try {
            flag = file.renameTo(file2);
        } catch (Exception e) {

            e.printStackTrace();
        }

        return flag;
    }


    /***************************************************
    * @MethodName : makeDir
    * @Description: make dir
    * @param      : String dirPath
    * @return     : void
    * @Author     : joon
    * @Version    : 2016. 01. 14.
    ***************************************************/
    public static void makeDir(String dirPath){
        File f = new File(dirPath);
        if(!f.isDirectory()){
            f.mkdir();
        }
    }


    /***************************************************
    * @MethodName : oldTempFileDelete
    * @Description: Temporary file is deleted, the last day
    * @param      : String path
    * @return     : void
    * @Author     : joon
    * @Version    : 2016. 01. 14.
    ***************************************************/
    public static void oldTempFileDelete(String path){
        File dirFile = new File(path);
        File []fileList = dirFile.listFiles();
        String fileName = null;
        if(fileList != null && fileList.length > 0){
            for(File tempFile : fileList){
                if(tempFile.isFile()){
                    fileName  = tempFile.getName();
                    if(fileName.length() > 8){
                        fileName = fileName.substring(0, 8);
                        if(StringUtil.isNumber(fileName)){
                            if(Integer.parseInt(fileName) < Integer.parseInt(DateConvertUtil.getGapDateString("D", -2))){
                                tempFile.delete();
                            }
                        }
                    }
                }
            }
        }

    }
}