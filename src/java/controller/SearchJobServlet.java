/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.JobDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Job;

/**
 *
 * @author lpdie
 */
public class SearchJobServlet extends HttpServlet {

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
            out.println("<title>Servlet SearchServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SearchServlet at " + request.getContextPath() + "</h1>");
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
        String index_raw = request.getParameter("index");
        int endPage;
        try {
            if (index_raw == null || index_raw.isEmpty()) {
                index_raw = "1";
            };
            int index = Integer.parseInt(index_raw);
            String name = request.getParameter("name");
            String companyId_raw = request.getParameter("companyId");
            if (companyId_raw != null && !companyId_raw.isEmpty()) {
                int companyId = Integer.parseInt(companyId_raw);
                request.setAttribute("companyId", companyId);

            }
            String majorId_raw = request.getParameter("majorId");

            if (majorId_raw != null && !majorId_raw.isEmpty()) {
                int majorId = Integer.parseInt(majorId_raw);
                request.setAttribute("majorId", majorId);
            }
            String salaryF_raw = request.getParameter("salaryF");
            String salaryT_raw = request.getParameter("salaryT");
            String[] locations = request.getParameterValues("locations");
            String[] yearExp = request.getParameterValues("yearsExp");
            JobDAO dao = new JobDAO();
            List<Job> data = dao.search(name, companyId_raw, salaryF_raw, salaryT_raw, locations, yearExp, index, majorId_raw);
            List<Job> data1 = dao.search(name, companyId_raw, salaryF_raw, salaryT_raw, locations, yearExp, majorId_raw);
            if (data1.size() % 4 == 0) {
                endPage = data1.size() / 4;
            } else {
                endPage = data1.size() / 4 + 1;
            }
            request.setAttribute("name", name);
            request.setAttribute("salaryF", salaryF_raw);
            request.setAttribute("salaryT", salaryT_raw);
            request.setAttribute("locations", locations);
            request.setAttribute("yearsExp", yearExp);
            request.setAttribute("data", data);
            request.setAttribute("endPage", endPage);
            request.setAttribute("test", true);
            request.setAttribute("tag", index);

            request.getRequestDispatcher("jobs.jsp").forward(request, response);
        } catch (Exception e) {
            System.out.println(e);
        }
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
        String index_raw = request.getParameter("index");
        int endPage;
        try {
            if (index_raw == null || index_raw.isEmpty()) {
                index_raw = "1";
            };
            int index = Integer.parseInt(index_raw);
            String name = request.getParameter("name");
            String companyId_raw = request.getParameter("companyId");
            if (companyId_raw != null && !companyId_raw.isEmpty()) {
                int companyId = Integer.parseInt(companyId_raw);
                request.setAttribute("companyId", companyId);
            }
            String majorId_raw = request.getParameter("majorId");

            if (majorId_raw != null && !majorId_raw.isEmpty()) {
                int majorId = Integer.parseInt(companyId_raw);
                request.setAttribute("majorId", majorId);
            }

            String salaryF_raw = request.getParameter("salaryF");
            String salaryT_raw = request.getParameter("salaryT");
            String[] locations = request.getParameterValues("locations");
            String[] yearExp = request.getParameterValues("yearsExp");
            JobDAO dao = new JobDAO();
            List<Job> data = dao.search(name, companyId_raw, salaryF_raw, salaryT_raw, locations, yearExp, index, majorId_raw);
            List<Job> data1 = dao.search(name, companyId_raw, salaryF_raw, salaryT_raw, locations, yearExp, majorId_raw);
            if (data1.size() % 4 == 0) {
                endPage = data1.size() / 4;
            } else {
                endPage = data1.size() / 4 + 1;
            }
            request.setAttribute("name", name);
            request.setAttribute("salaryF", salaryF_raw);
            request.setAttribute("salaryT", salaryT_raw);
            request.setAttribute("locations", locations);
            request.setAttribute("yearsExp", yearExp);
            request.setAttribute("data", data);
            request.setAttribute("endPage", endPage);
            request.setAttribute("test", true);
            request.getRequestDispatcher("jobs.jsp").forward(request, response);
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
