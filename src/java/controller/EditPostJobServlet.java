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
import model.Account;
import model.Job;

/**
 *
 * @author lpdie
 */
public class EditPostJobServlet extends HttpServlet {

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
            out.println("<title>Servlet EditPostJobServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EditPostJobServlet at " + request.getContextPath() + "</h1>");
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
        String sjid = request.getParameter("jid");
        String said = request.getParameter("aid");
        try {
            int jid = Integer.parseInt(sjid);
            JobDAO dao = new JobDAO();
            Job job = dao.getJobbyId(jid);
            request.setAttribute("job", job);
            request.setAttribute("jid", jid);
            request.setAttribute("aid", said);
        } catch (Exception e) {
        }

        request.getRequestDispatcher("editpostjob.jsp").forward(request, response);
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
        String s_jid = request.getParameter("jid");
        String s_cid = request.getParameter("companyId");
        String s_aid = request.getParameter("aid");
        String jobType = request.getParameter("jobType");
        String location = request.getParameter("location");
        String ssalary = request.getParameter("salary");
        String syearExp = request.getParameter("yearExp");
        String des = request.getParameter("des");
        String majorId_raw = request.getParameter("majorId");
        try {
            double salary = Double.parseDouble(ssalary);
            int yearExp = Integer.parseInt(syearExp);
            int majorId = Integer.parseInt(majorId_raw);
            int c_id = Integer.parseInt(s_cid);
            int j_id = Integer.parseInt(s_jid);
            int a_id = Integer.parseInt(s_aid);
            CompanyDAO cDAO = new CompanyDAO();
            UserDAO aDAO = new UserDAO();
            JobDAO dao = new JobDAO();
            Job job = new Job(j_id, jobType, cDAO.getCompanybyId(c_id), des, location, yearExp, salary, aDAO.getAccountById(a_id), yearExp, majorId);
            if (job != null) {
                dao.update(job);
                request.setAttribute("valid", "Edit jobs successfully!");
                request.getRequestDispatcher("editpostjob.jsp").forward(request, response);
            } else {
                request.setAttribute("error5", "Edit not successfully!");
            }
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
