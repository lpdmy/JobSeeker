/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.io.Serializable;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Account;
import model.Education;
import model.Profile;

/**
 *
 * @author MINH TUAN
 */
public class EducationDAO extends DBContext implements Serializable {

    private int id;

    public EducationDAO() {
    }

    public EducationDAO(int id) {
        this.id = id;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
    static UserDAO accD = new UserDAO();

    public List<Education> getAllEducation() {
        List<Education> educationList = new ArrayList<>();
        String sql = "Select * From education";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                String uniName = rs.getString(2);
                String rank = rs.getString(3);
                Account a = accD.getAccountById(rs.getInt(4));
                int majorId = rs.getInt(5);
                Education edu = new Education(id, majorId, uniName, rank, a);
                educationList.add(edu);
            }
        } catch (Exception ex) {
            Logger.getLogger(EducationDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return educationList;
    }

    public List<Education> getEducationbyId() {
        List<Education> list = new ArrayList<>();
        String sql = "Select * from education where account_id=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Education edu = new Education();
                edu.setId(rs.getInt(1));
                edu.setMajorId(rs.getInt(5));
                edu.setUniName(rs.getString(2));
                edu.setRank(rs.getString(3));
                edu.setAccount(accD.getAccountById(id));
                list.add(edu);

            }
        } catch (SQLException ex) {
            System.out.println(ex);
        } catch (Exception ex) {
            Logger.getLogger(EducationDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public boolean insert(Education edu) {
        String sql = "INSERT INTO education (majorId, uni_name, rank,account_id)\n"
                + "VALUES (?, ?, ? ,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, edu.getMajorId());
            st.setString(2, edu.getUniName());
            st.setString(3, edu.getRank());
            st.setInt(4, edu.getAccount().getAccountId());

            int soLuong = st.executeUpdate();
            if (soLuong > 0) {
                return true;
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return false;
    }

    public boolean update(Education updateObject) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public boolean delete(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public static void main(String[] args) {
//        UserDAO uDAO = new UserDAO();
//        Account a;
//        try {
//            a = uDAO.getAccountById(1);
//            System.out.println(new EducationDAO().insert(new Education("Computer International", "Harvard University", "Top 1 Server", a)));
//
//        } catch (Exception ex) {
//            Logger.getLogger(EducationDAO.class.getName()).log(Level.SEVERE, null, ex);
//        }
        System.out.println(new EducationDAO(1).getEducationbyId());
    }

}
