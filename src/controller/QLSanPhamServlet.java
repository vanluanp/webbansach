package controller;

import Model.DanhMuc;
import Model.NhaXuatBan;
import Model.SanPham;
import Util.Util;
import dao.SanPhamDaoIMP;
import dao.UploadDAO;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

@WebServlet("/QLSanPhamServlet")
public class QLSanPhamServlet extends HttpServlet {
    SanPhamDaoIMP productGet = new SanPhamDaoIMP();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        doGet(request, response);
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
//        UploadDAO.uploadFile(request);


        String command = request.getParameter("command");

        String maSach = request.getParameter("maSach");
        String tenSach = request.getParameter("tenSach");
        String tacGia = request.getParameter("tacGia");
        String maNhaXuatBan = request.getParameter("maNhaXuatBan");
        NhaXuatBan nhaXuatBan = new NhaXuatBan();
        nhaXuatBan.setMaNhaXuatBan(maNhaXuatBan);
        String moTa = "txt/mota" + request.getParameter("moTa");
        String chiTietMoTa = "txt/chitietmota" + request.getParameter("chiTietMoTa");
        String hinhAnh1 = "images/books/" + request.getParameter("hinhAnh1");
        String hinhAnh2 = "images/books1/" + request.getParameter("hinhAnh2");
//        double giaGoc = Double.parseDouble(request.getParameter("giaGoc"));
//        double giaKhuyenMai = Double.parseDouble(request.getParameter("giaKhuyenMai"));
//        int soLuongNhap = Integer.parseInt(request.getParameter("soLuongNhap"));
//        int soLuongBan = Integer.parseInt(request.getParameter("soLuongBan"));
        String maDanhMuc = request.getParameter("maLoaiSach");
        DanhMuc dm = new DanhMuc();
        dm.setMaDanhMuc(maDanhMuc);
//        String status = request.getParameter("status");

        String url = "", error = "";
        double giaGoc = 0;
        double giaKhuyenMai = 0;
        int soLuongNhap = 0;
        int soLuongBan = 0;
        int status = 0;
        if (maSach.equals("")) {
            Date id = new Date();
            maSach = "" + id.getTime();
        }
        if (tenSach.equals("") || tacGia.equals("") || request.getParameter("giaGoc").equals("") || request.getParameter("giaKhuyenMai").equals("") || request.getParameter("soLuongNhap").equals("")) {
            error = "✖ Vui lòng nhập đầy đủ thông tin!";
        } else {
            giaGoc = Double.parseDouble(request.getParameter("giaGoc"));
            giaKhuyenMai = Double.parseDouble(request.getParameter("giaKhuyenMai"));
            soLuongNhap = Integer.parseInt(request.getParameter("soLuongNhap"));
            status = Integer.parseInt(request.getParameter("status"));
            if ((giaGoc < 1000) || (giaKhuyenMai < 1000) || (giaGoc < giaKhuyenMai)) {
                error = "✖ Vui lòng nhập đúng giá!";
            }
        }

        request.setAttribute("maSach", maSach);
        request.setAttribute("tenSach", tenSach);
        request.setAttribute("tacGia", tacGia);
        request.setAttribute("hinhAnh1", hinhAnh1);
//        String address = "E://IdeaProjects/PJ/web/images/books";
//        final int maxMemorySize = 1024 * 1024 * 3; //3mb
//        final int maxRequestSize = 1024 * 1024 * 15; //15mb

//        boolean isMultipart = ServletFileUpload.isMultipartContent(request);

//        DiskFileItemFactory factory = new DiskFileItemFactory();
//
//        // Set factory constraints
//        factory.setSizeThreshold(maxMemorySize);
//        factory.setRepository(new File(System.getProperty("java.io.tmpdir")));
//
//        // Create a new file upload handler
//        ServletFileUpload upload = new ServletFileUpload(factory);
//
//        // Set overall request size constraint
//        upload.setSizeMax(maxRequestSize);
//
//        // Parse the request
//        try {
//            List<FileItem> items = upload.parseRequest(request);
//
//            // Process the uploaded items
//            Iterator<FileItem> iter = items.iterator();
//            while (iter.hasNext()) {
//                FileItem item = iter.next();
//
//                if (!item.isFormField()) {
//                    String fileName = item.getName();
//                    String pathFile = address + File.separator + fileName;
//                    File uploadedFile = new File(pathFile);
//                    item.write(uploadedFile);
//                } else {
//
////                    request.setAttribute("message", "Error upload...");
//                }
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
        try {
            if (error.length() == 0) {
                switch (command) {
                    case "insert":
                        productGet.insertProduct(new SanPham(maSach, tenSach, tacGia, nhaXuatBan, moTa, chiTietMoTa,
                                hinhAnh1, hinhAnh2, giaGoc, giaKhuyenMai, soLuongNhap, dm, status));
                        url = "/admin/quanlisanpham.jsp";
                        break;
                    case "update":
                        if (request.getParameter("soLuongBan").equals("")) {
                            error = "✖ Vui lòng nhập đầy đủ thông tin!";
                            request.getRequestDispatcher("/admin/suasanpham.jsp").forward(request, response);
                        } else {
                            soLuongBan = Integer.parseInt(request.getParameter("soLuongBan"));
                        }
                        productGet.updateProduct(new SanPham(maSach, tenSach, tacGia, nhaXuatBan, moTa, chiTietMoTa,
                                hinhAnh1, hinhAnh2, giaGoc, giaKhuyenMai, soLuongNhap, soLuongBan, dm, status));
                        url = "/admin/quanlisanpham.jsp";
                        break;
                }
            } else {
                switch (command) {
                    case "insert":
                        url = "/admin/themsanpham.jsp";
                        break;
                    case "update":
                        url = "/admin/suasanpham.jsp";
                        break;
                }
            }
            request.setAttribute("error", error);
//            request.getRequestDispatcher(url).forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
        RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
        rd.forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");

        String command = request.getParameter("command");

        String maSach = request.getParameter("maSach");

        String url = "", error2 = "";

        try {
            if (error2.length() == 0) {
                switch (command) {
                    case "delete":
                        productGet.deleteProduct(maSach);
                        url = "/admin/quanlisanpham.jsp";
                        break;
                }
            } else {
                url = "/admin/quanlisanpham.jsp";
            }
//            request.getRequestDispatcher(url).forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
        RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
        rd.forward(request, response);
    }
}