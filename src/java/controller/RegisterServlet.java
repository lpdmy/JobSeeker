/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.Date;
import java.text.SimpleDateFormat;
import model.Account;
import model.Profile;

/**
 *
 * @author lpdie
 */
public class RegisterServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet RegisterServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RegisterServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("register.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String fname = request.getParameter("fname");
        String lname = request.getParameter("lname");
        String pass = request.getParameter("pass");
        String cpass = request.getParameter("cpass");
        if (!pass.equals(cpass)) {
            request.setAttribute("error1", "Cannot confirm password");
            request.getRequestDispatcher("register.jsp").forward(request, response);
        }
        String year_raw = request.getParameter("year");
        String gender = request.getParameter("gender");
        String email = request.getParameter("email");
        String username = request.getParameter("user");
        String phone = request.getParameter("phone");
        String birthdate_raw = request.getParameter("birthdate");
        UserDAO dao = new UserDAO();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Date birthdate = null;
        String img = request.getParameter("img");
        try {
            int yearExp = Integer.parseInt(year_raw);
            birthdate = dateFormat.parse(birthdate_raw);
            java.sql.Date sqlDate = new java.sql.Date(birthdate.getTime());
            Profile p = new Profile(fname, lname, sqlDate, phone, gender.charAt(0), img, yearExp);
            //1 la nguoi tim viec
            Account a = dao.register(username, email, pass, 1, p);
            if (a == null) {
                request.setAttribute("error2", "Username or email have existed");
                request.getRequestDispatcher("register.jsp").forward(request, response);
            }
            HttpSession session = request.getSession();
            session.setAttribute("account", a);
            response.sendRedirect("index.jsp");
        } catch (Exception e) {
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
