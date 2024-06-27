/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import com.oracle.wls.shaded.org.apache.bcel.classfile.Code;
import java.io.Serializable;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Company;

/**
 *
 * @author MINH TUAN
 */
public class CompanyDAO extends DBContext implements Serializable {

    private int id;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Connection getConnection() {
        return connection;
    }

    public void setConnection(Connection connection) {
        this.connection = connection;
    }

    public CompanyDAO(int id) {
        this.id = id;
    }

    public CompanyDAO() {
    }

    public List<Company> getAllCompanies() {
        List<Company> list = new ArrayList<>();
        String sql = "select *\n"
                + "from companies\n";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2);
                String des = rs.getString(3);
                String url = rs.getString(4);
                String img = rs.getString(5);
                
                // Assuming Company constructor accepts account details as well
                Company c = new Company(id, name, des, url, img);
                list.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        } catch (Exception ex) {
            Logger.getLogger(CompanyDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public Company getCompanybyId(int id) {
        String sql = "Select * from companies where id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Company c = new Company(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5));
                c.setCode(rs.getString(6));
                return c;
            }
        } catch (Exception ex) {
            Logger.getLogger(CompanyDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public boolean insert(Company c) {
        String sql = "INSERT INTO Companies(company_name ,des ,company_url ,img)\n"
                + "     VALUES (?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, c.getCompanyName());
            st.setString(2, c.getCompanyUrl());
            st.setString(3, c.getCompanyUrl());
            st.setString(4, c.getImg());
            int soLuong = st.executeUpdate();
            if (soLuong > 0) {
                return true;
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return false;
    }

    public Company getCompanyByAccountId() {
        String sql = "select * from companies where id = (select company_id from accounts_companies where account_id=?)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Company c = new Company(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5));
                c.setCode(rs.getString(6));
                return c;
            }
        } catch (Exception ex) {
            Logger.getLogger(CompanyDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public List<Company> searchCompanyByName(String textSearch) throws Exception {
        List<Company> list = new ArrayList<>();
        String sql = "select * from companies \n"
                + "where company_name Like ?";
        try {
            PreparedStatement ps = getConnection().prepareStatement(sql);
            ps.setString(1, "%" + textSearch + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int idC = rs.getInt(1);
                String name = rs.getString(2);
                String des = rs.getString(3);
                String url = rs.getString(4);
                String img = rs.getString(5);
                String code = rs.getString(6);
                Company c = new Company(idC, name, des, url, img, code);
                list.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        } catch (Exception ex) {
            Logger.getLogger(CompanyDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public List<Company> searchTopCompany() {

        List<Company> list = new ArrayList<>();
        String sql = "Select top 10 * from companies\n"
                + "order by company_name asc";
        try {
            PreparedStatement st = getConnection().prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int idC = rs.getInt(1);
                String name = rs.getString(2);
                String des = rs.getString(3);
                String url = rs.getString(4);
                String img = rs.getString(5);
                String code = rs.getString(6);
                Company c = new Company(idC, name, des, url, img, code);
                list.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        } catch (Exception ex) {
            Logger.getLogger(CompanyDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public int getTotalCompanies() {
        String sql = "select count(*) from companies ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return 0;

    }

    public boolean update(Company updateObject) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public boolean delete(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public static void main(String[] args) {
        CompanyDAO dao = new CompanyDAO();
        for (Company allCompany : dao.getAllCompanies()) {
            System.out.println(allCompany);
        }
    }

}
