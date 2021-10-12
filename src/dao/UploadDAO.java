package dao;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.Iterator;
import java.util.List;

public class UploadDAO {
    public static void uploadFile(HttpServletRequest request) {
        String address = "E://IdeaProjects/PJ/web/images/books";
        final int maxMemorySize = 1024 * 1024 * 3; //3mb
        final int maxRequestSize = 1024 * 1024 * 15; //15mb

//        boolean isMultipart = ServletFileUpload.isMultipartContent(request);

        DiskFileItemFactory factory = new DiskFileItemFactory();

        // Set factory constraints
        factory.setSizeThreshold(maxMemorySize);
        factory.setRepository(new File(System.getProperty("java.io.tmpdir")));

        // Create a new file upload handler
        ServletFileUpload upload = new ServletFileUpload(factory);

        // Set overall request size constraint
        upload.setSizeMax(maxRequestSize);

        // Parse the request
        try {
            List<FileItem> items = upload.parseRequest(request);

            // Process the uploaded items
            Iterator<FileItem> iter = items.iterator();
            while (iter.hasNext()) {
                FileItem item = iter.next();

                if (!item.isFormField()) {
                    String fileName = item.getName();
                    String pathFile = address + File.separator + fileName;
                    File uploadedFile = new File(pathFile);
                        item.write(uploadedFile);
                } else {

//                    request.setAttribute("message", "Error upload...");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
