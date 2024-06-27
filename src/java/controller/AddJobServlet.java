/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.CompanyDAO;
import dao.JobDAO;
import dao.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Job;

/**
 *
 * @author lpdie
 */
public class AddJobServlet extends HttpServlet {

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
            out.println("<title>Servlet AddJobServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddJobServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request request
     * @param response response
     * @throws ServletException if a -specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
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
        JobDAO dao = new JobDAO();
        String jobType = request.getParameter("jobType");
        String location = request.getParameter("location");
        String salary_raw = request.getParameter("salary");
        String yearExp_raw = request.getParameter("yearExp");
        String des = request.getParameter("des");
        String companyId_raw = request.getParameter("companyId");
        String accountId_raw = request.getParameter("accountId");
        String majorId_raw = request.getParameter("majorId");

        try {
            double salary = Double.parseDouble(salary_raw);
            int yearExp = Integer.parseInt(yearExp_raw);
            int companyId = Integer.parseInt(companyId_raw);
            int accountId = Integer.parseInt(accountId_raw);
            int majorId = Integer.parseInt(majorId_raw);
            CompanyDAO companyDAO = new CompanyDAO();
            UserDAO userDAO = new UserDAO();
            Job j = new Job(jobType, companyDAO.getCompanybyId(companyId), des, location, yearExp, salary, userDAO.getAccountById(accountId), 0, majorId);
            JobDAO jobDAO = new JobDAO();
            if (jobDAO.insert(j)) {
                response.sendRedirect("jobs");

            }
            request.setAttribute("error4", "Cannot add this job");
            request.getRequestDispatcher("insertjob.jsp").forward(request, response);
        } catch (Exception e) {
            System.out.println(e);
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
