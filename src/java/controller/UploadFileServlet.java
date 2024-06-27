package controller;


import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.IOException;

@WebServlet("/UploadFileServlet")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50) // 50MB

public class UploadFileServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String pathEx = "";
        String fileName="";
        for (Part part : request.getParts()) {
            fileName = extractFileName(part);
            // refines the fileName in case it is an absolute path
            fileName = new File(fileName).getName();

            part.write(this.getFolderUpload().getAbsolutePath() + File.separator + fileName);
            pathEx = pathEx + this.getFolderUpload().getAbsolutePath() + File.separator + fileName;
        }
        request.setAttribute("img_link","assets/uploads/" + fileName);
        request.setAttribute("mes", "Successful up images");

        request.getRequestDispatcher("register.jsp").forward(request, response);
    }

    /**
     * Extracts file name from HTTP header content-disposition
     */
    private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length() - 1);
            }
        }
        return "";
    }

    public File getFolderUpload() {
        // Lấy đường dẫn tương đối đến thư mục "uploads" trong ứng dụng web của bạn
        ServletContext context = getServletContext();
        String uploadsPath = context.getRealPath("/assets/uploads");

        // Tạo một đối tượng File từ đường dẫn
        File folderUpload = new File(uploadsPath);

        // Kiểm tra xem thư mục tồn tại chưa, nếu không thì tạo mới
        if (!folderUpload.exists()) {
            folderUpload.mkdirs(); // Tạo thư mục nếu nó chưa tồn tại
        }

        // Trả về thư mục "uploads"
        return folderUpload;
    }
}
