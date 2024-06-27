/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import model.Major;
import java.sql.*;
/**
 *
 * @author lpdie
 */
public class MajorDAO extends DBContext implements Serializable{
    private int mid;

    public int getMid() {
        return mid;
    }

    public void setMid(int mid) {
        this.mid = mid;
    }

    public MajorDAO(int mid) {
        this.mid = mid;
    }

    public MajorDAO() {
    }
    
    public List<Major> getAll() {
        List<Major> list = new ArrayList<>();
        String sql = "Select * from Majors";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {                
                Major m = new Major(rs.getInt(1), rs.getString(2));
                list.add(m);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }
    public Major getMajorById() {
        String sql = "Select * from Majors where id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, mid);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {                
                Major m = new Major(rs.getInt(1), rs.getString(2));
                return m;
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }
    public static void main(String[] args) {
        MajorDAO dao = new MajorDAO(1);
//        for (Major major : dao.getAll()) {
//            System.out.println(major);
//        }
        System.out.println(dao.getMajorById());
    }
}
