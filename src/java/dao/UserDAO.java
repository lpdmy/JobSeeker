package dao;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Account;
import model.Company;
import model.Profile;

public class UserDAO extends DBContext {

    public Account login(String email_username, String password) throws Exception {
        String sql = "select * from account where ((email = ? or username = ?) and password = ?) ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email_username);
            st.setString(2, email_username);
            st.setString(3, password);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Account a = new Account();
                a.setAccountId(rs.getInt(1));
                a.setUsername(rs.getString(2));
                a.setEmail(rs.getString(3));
                a.setPassword(rs.getString(4));
                a.setRole(rs.getInt(5));
                a.setProfile(getProfileById(rs.getInt(6)));
                return a;
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return null;
    }

    public Account register(String username, String email, String password, int role, Profile profile) throws Exception {
        if (!insertNewProfile(profile)) {
            return null;
        }
        int profile_id = getLatestProfile().getId();
        String sql = "INSERT INTO account (username, email, password, role,profile_id)\n"
                + "VALUES (?,?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            st.setString(2, email);
            st.setString(3, password);
            st.setInt(4, role);
            st.setInt(5, profile_id);
            int rs = st.executeUpdate();
            if (rs > 0) {
                return getLatestAccount();
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return null;
    }

    public Account registerHirer(String code, int companyId, String username, String email, String password, int role, Profile profile) throws Exception {
        if (!insertNewProfile(profile)) {
            return null;
        }
        CompanyDAO companyDAO = new CompanyDAO();
        Company c = companyDAO.getCompanybyId(companyId);
        if (!c.getCode().equalsIgnoreCase(code)) {
            return null;
        }
        int profile_id = getLatestProfile().getId();
        String sql = "INSERT INTO account (username, email, password, role,profile_id)\n"
                + "VALUES (?,?,?,?,?)";
        String sql1 = "INSERT INTO accounts_companies(account_id,company_id) VALUES (?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            PreparedStatement st1 = connection.prepareStatement(sql1);

            st.setString(1, username);
            st.setString(2, email);
            st.setString(3, password);
            st.setInt(4, role);
            st.setInt(5, profile_id);
            int rs = st.executeUpdate();
            if (rs > 0) {
                st1.setInt(01, getLatestAccount().getAccountId());
                st1.setInt(02, companyId);
                st1.executeUpdate();
                return getLatestAccount();
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return null;
    }

    public Account getAccountById(int id) throws Exception {
        String sql = "Select * from account where account_id=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Account a = new Account();
                a.setAccountId(rs.getInt(1));
                a.setUsername(rs.getString(2));
                a.setEmail(rs.getString(3));
                a.setPassword(rs.getString(4));
                a.setRole(rs.getInt(5));
                a.setProfile(getProfileById(rs.getInt(6)));
                return a;
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return null;
    }

    public Profile getProfileById(int id) throws Exception {
        String sql = "Select * from profiles where id=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Profile p = new Profile();
                p.setId(rs.getInt(1));
                p.setFirstName(rs.getString(2));
                p.setLastName(rs.getString(3));
                p.setBirthdate(rs.getDate(4));
                p.setPhone(rs.getString(5));
                p.setGender(rs.getString(6).charAt(0));
                p.setImg(rs.getString(7));
                p.setYearExp(rs.getInt(8));
                return p;
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return null;
    }

    public Profile getLatestProfile() throws Exception {
        String sql = "select top 1 * from profiles order by id desc";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Profile p = new Profile();
                p.setId(rs.getInt(1));
                p.setFirstName(rs.getString(2));
                p.setLastName(rs.getString(3));
                p.setBirthdate(rs.getDate(4));
                p.setPhone(rs.getString(5));
                p.setGender(rs.getString(6).charAt(0));
                p.setImg(rs.getString(7));
                p.setYearExp(rs.getInt(8));
                return p;
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return null;
    }

    public Account getLatestAccount() throws Exception {
        String sql = "select top 1* from account order by account_id desc";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Account a = new Account();
                a.setAccountId(rs.getInt(1));
                a.setUsername(rs.getString(2));
                a.setEmail(rs.getString(3));
                a.setPassword(rs.getString(4));
                a.setRole(rs.getInt(5));
                a.setProfile(getProfileById(rs.getInt(6)));
                return a;
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return null;
    }

    public boolean insertNewProfile(Profile p) throws Exception {
        String sql = "INSERT INTO profiles (first_name, last_name, birthdate, phone, gender, img, year_exp)\n"
                + "VALUES (?, ?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, p.getFirstName());
            st.setString(2, p.getLastName());
            st.setDate(3, p.getBirthdate());
            st.setString(4, p.getPhone());
            st.setString(5, "" + p.getGender());
            st.setString(6, p.getImg());
            st.setInt(7, p.getYearExp());
            int rs = st.executeUpdate();
            if (rs > 0) {
                return true;
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return false;
    }

    public List<Account> getApplierIdByJobId(int jobId) {
        List<Account> list = new ArrayList<>();
        String sql = "select * from account where account_id in (select applierId from apply where jobid = ?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(01, jobId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Account a = new Account(rs.getInt(01), rs.getString(02), rs.getString(03), rs.getString(04), rs.getInt(05), getProfileById(rs.getInt(06)));
                list.add(a);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public int getTotalUser() {
        String sql = "select count(*) from account where role = 1 or role = 2";
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

    public static void main(String[] args) throws Exception {
        UserDAO dao = new UserDAO();
//        Profile p = new Profile("Son", "Tung", null, "0922010136", 'M', null, -1);
//        System.out.println(dao.registerHirer("HAHA",2, "sontungmtp", "abdfdhh@gmail.com", "123", 2, p));
        for (Account account : dao.getApplierIdByJobId(1)) {
            System.out.println(account);
        }
        System.out.println(dao.getTotalUser());
    }

}
