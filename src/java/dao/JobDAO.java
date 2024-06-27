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
import model.Company;
import model.Job;

/**
 *
 * @author MINH TUAN
 */
public class JobDAO extends DBContext implements Serializable {

    private int applierId;
    private int jobTypeId;
    private int jobId;
    private int posterId;

    public JobDAO(int applierId, int jobTypeId, int jobId, int posterId) {
        this.applierId = applierId;
        this.jobTypeId = jobTypeId;
        this.jobId = jobId;
        this.posterId = posterId;
    }

    public int getPosterId() {
        return posterId;
    }

    public void setPosterId(int posterId) {
        this.posterId = posterId;
    }

    public int getJobId() {
        return jobId;
    }

    public JobDAO(int applierId, int jobTypeId, int jobId) {
        this.applierId = applierId;
        this.jobTypeId = jobTypeId;
        this.jobId = jobId;
    }

    public int getApplierId() {
        return applierId;
    }

    public void setApplierId(int applierId) {
        this.applierId = applierId;
    }

    public void setJobId(int jobId) {
        this.jobId = jobId;
    }

    public JobDAO() {
    }

    public JobDAO(int jobTypeId) {
        this.jobTypeId = jobTypeId;
    }

    public int getJobTypeId() {
        return jobTypeId;
    }

    public void setJobTypeId(int jobTypeId) {
        this.jobTypeId = jobTypeId;
    }

    static UserDAO accD = new UserDAO();
    static CompanyDAO comD = new CompanyDAO();

    public List<Job> getAll() {
        List<Job> jobList = new ArrayList<>();
        String sql = "Select * From jobs";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);

                int companyId = rs.getInt(2);
                Company com = comD.getCompanybyId(companyId);
                String des = rs.getString(3);
                String location = rs.getString(4);
                int yearExp = rs.getInt(5);
                double salary = rs.getDouble(6);
                int accountId = rs.getInt(7);
                Account acc = accD.getAccountById(accountId);
                int applyId = rs.getInt(8);
                String jobType = rs.getString(9);
                int majorId = rs.getInt(10);

                Job job = new Job(id, jobType, com, des, location, yearExp, salary, acc, applyId, majorId);
                jobList.add(job);
            }
        } catch (Exception ex) {
            Logger.getLogger(JobDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return jobList;
    }

    public Job getJobbyId(int id) {
        String sql = "Select * from jobs where id=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Job job = new Job();
                job.setId(rs.getInt(1));
                job.setCompany(comD.getCompanybyId(rs.getInt(2)));
                job.setDescription(rs.getString(3));
                job.setLocation(rs.getString(4));
                job.setYearExp(rs.getInt(5));
                job.setSalary(rs.getDouble(6));
                job.setAccount(accD.getAccountById(rs.getInt(7)));
                job.setApplyId(rs.getInt(8));
                job.setJobType(rs.getString(9));
                job.setMajorId(rs.getInt(10));

                return job;
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        } catch (Exception ex) {
            Logger.getLogger(JobDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public boolean insert(Job newJob) {
        String sql = "insert into jobs (job_type, company_id, des, location, year_exp, salary, poster_id, apply_id, majorId) values (?,?,?,?,?,?,?,?,?)";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, newJob.getJobType());
            ps.setInt(2, newJob.getCompany().getCompanyId());
            ps.setString(3, newJob.getDescription());
            ps.setString(4, newJob.getLocation());
            ps.setInt(5, newJob.getYearExp());
            ps.setDouble(6, newJob.getSalary());
            ps.setInt(7, newJob.getAccount().getAccountId());
            ps.setInt(8, newJob.getApplyId());
            ps.setInt(9, newJob.getMajorId());
            int rowAffected = ps.executeUpdate();
            if (rowAffected > 0) {
                return true;
            }
        } catch (Exception ex) {
            Logger.getLogger(JobDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public boolean update(Job updateJob) {
        String sql = "UPDATE jobs SET job_type = ?, company_id = ?, des = ?, location = ?, year_exp = ?,"
                + "salary = ?, poster_id = ?, apply_id = ?, majorId=? WHERE id = ?";

        try {
            PreparedStatement ps = connection.prepareCall(sql);
            ps.setString(1, updateJob.getJobType());
            ps.setInt(2, updateJob.getCompany().getCompanyId());
            ps.setString(3, updateJob.getDescription());
            ps.setString(4, updateJob.getLocation());
            ps.setInt(5, updateJob.getYearExp());
            ps.setDouble(6, updateJob.getSalary());
            ps.setInt(7, updateJob.getAccount().getAccountId());
            ps.setInt(8, updateJob.getApplyId());
            ps.setInt(9, updateJob.getMajorId());
            ps.setInt(10, updateJob.getId());

            int rowAffect = ps.executeUpdate();
            if (rowAffect > 0) {
                return true;
            }
        } catch (Exception ex) {
            Logger.getLogger(JobDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public boolean delete(int id) {
        String sql = "Delete from jobs where id =?";

        try {
            PreparedStatement ps = connection.prepareCall(sql);
            ps.setInt(1, id);

            int rowAffected = ps.executeUpdate();
            if (rowAffected > 0) {
                return true;
            }
        } catch (Exception ex) {
            Logger.getLogger(JobDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public Company getCompanyByJobId() {
        String sql = "select * from companies where id = (select company_id from jobs where id=?)";
        CompanyDAO companyDAO = new CompanyDAO();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(01, jobId);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return companyDAO.getCompanybyId(rs.getInt(01));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public Company getCompanyByJobId(int id) {
        String sql = "select * from companies where id = (select company_id from jobs where id=?)";
        CompanyDAO companyDAO = new CompanyDAO();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(01, jobId);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return companyDAO.getCompanybyId(rs.getInt(01));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public Account getPosterByJobId() {
        String sql = "select * from account where account_id=(select poster_id from jobs where id=?)";
        UserDAO userDAO = new UserDAO();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(01, jobId);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return userDAO.getAccountById(rs.getInt(01));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public List<Job> getTop3() {
        List<Job> jobList = new ArrayList<>();
        String sql = "select top 3 * from jobs order by salary desc";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);

                int companyId = rs.getInt(2);
                Company com = comD.getCompanybyId(companyId);
                String des = rs.getString(3);
                String location = rs.getString(4);
                int yearExp = rs.getInt(5);
                double salary = rs.getDouble(6);
                int accountId = rs.getInt(7);
                Account acc = accD.getAccountById(accountId);
                int applyId = rs.getInt(8);
                String jobType = rs.getString(9);
                int majorId = rs.getInt(10);
                Job job = new Job(id, jobType, com, des, location, yearExp, salary, acc, applyId, majorId);
                jobList.add(job);
            }
        } catch (Exception ex) {
            Logger.getLogger(JobDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return jobList;
    }

    public List<Job> search(String name, String companyId, String salaryF, String salaryT, String[] locations, String[] yearsOfExperience, String majorId) {
        List<Job> jobList = new ArrayList<>();
        boolean flag = false;
        // SQL query to search jobs based on provided parameters
        String sql = "SELECT * FROM jobs WHERE 1=1";

        if (name != null && !name.isEmpty()) {
            sql += " AND job_type LIKE '%" + name + "%'";
        }
        if (companyId != null && !companyId.isEmpty()) {
            sql += " AND company_id = " + companyId;
        }
        if (salaryF != null && !salaryF.isEmpty() && salaryT != null && !salaryT.isEmpty()) {
            sql += " AND salary BETWEEN " + salaryF + " AND " + salaryT;
        }
        if (locations != null && locations.length > 0) {
            sql += " AND location IN (";
            for (String location : locations) {
                sql += "'" + location + "',";
            }
            sql = sql.substring(0, sql.length() - 1); // Remove trailing comma
            sql += ")";
        }
        if (yearsOfExperience != null && yearsOfExperience.length > 0) {
            if (!(yearsOfExperience.length == 1 && yearsOfExperience[0].equals("-1"))) {
                sql += " AND year_exp IN (";
            }
            for (String years : yearsOfExperience) {
                if (years.equals("-1")) {
                    flag = true;
                    continue;
                }
                sql += years + ",";
            }
            if (!(yearsOfExperience.length == 1 && yearsOfExperience[0].equals("-1"))) {
                sql = sql.substring(0, sql.length() - 1); // Remove trailing comma
                sql += ")";
            }
            if (flag == true) {
                sql += " AND year_exp > 4";
            }
        }
        if (majorId != null && !majorId.isEmpty()) {
            sql += " AND majorId = " + majorId;
        }
        System.out.println(sql);
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                int companyId1 = rs.getInt(2);
                Company com = comD.getCompanybyId(companyId1);
                String des = rs.getString(3);
                String location = rs.getString(4);
                int yearExp = rs.getInt(5);
                double salary = rs.getDouble(6);
                int accountId = rs.getInt(7);
                Account acc = accD.getAccountById(accountId);
                int applyId = rs.getInt(8);
                String jobType = rs.getString(9);
                int majorId1 = rs.getInt(10);
                Job job = new Job(id, jobType, com, des, location, yearExp, salary, acc, applyId, majorId1);
                jobList.add(job);
            }
        } catch (Exception ex) {
            Logger.getLogger(JobDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return jobList;
    }
    public List<Job> getJobByApplierId() {
        List<Job> list = new ArrayList<>();
        String sql = " select * from jobs where id in (select jobId from apply where applierId = ?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, applierId);
            ResultSet rs = st.executeQuery();
            CompanyDAO cdao = new CompanyDAO();
            UserDAO adao = new UserDAO();
            while (rs.next()) {
                Job j = new Job(rs.getInt(01), rs.getString(9), cdao.getCompanybyId(rs.getInt(2)), rs.getString(3), rs.getString(4), rs.getInt(5), rs.getDouble(6), adao.getAccountById(rs.getInt(7)), rs.getInt(8),rs.getInt(10));
                list.add(j);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Job> search(String name, String companyId, String salaryF, String salaryT, String[] locations, String[] yearsOfExperience, int index, String majorId) {
        List<Job> jobList = new ArrayList<>();
        boolean flag = false;
        // SQL query to search jobs based on provided parameters
        String sql = "SELECT * FROM jobs WHERE 1=1";

        if (name != null && !name.isEmpty()) {
            sql += " AND job_type LIKE '%" + name + "%'";
        }
        if (companyId != null && !companyId.isEmpty()) {
            sql += " AND company_id = " + companyId;
        }
        if (salaryF != null && !salaryF.isEmpty() && salaryT != null && !salaryT.isEmpty()) {
            sql += " AND salary BETWEEN " + salaryF + " AND " + salaryT;
        }
        if (locations != null && locations.length > 0) {
            sql += " AND location IN (";
            for (String location : locations) {
                sql += "'" + location + "',";
            }
            sql = sql.substring(0, sql.length() - 1); // Remove trailing comma
            sql += ")";
        }
        if (yearsOfExperience != null && yearsOfExperience.length > 0) {
            if (!(yearsOfExperience.length == 1 && yearsOfExperience[0].equals("-1"))) {
                sql += " AND year_exp IN (";
            }
            for (String years : yearsOfExperience) {
                if (years.equals("-1")) {
                    flag = true;
                    continue;
                }
                sql += years + ",";
            }
            if (!(yearsOfExperience.length == 1 && yearsOfExperience[0].equals("-1"))) {
                sql = sql.substring(0, sql.length() - 1); // Remove trailing comma
                sql += ")";
            }
            if (flag == true) {
                sql += " AND year_exp > 4";
            }
        }
        if (majorId != null && !majorId.isEmpty()) {
            sql += " AND majorId = " + majorId;
        }
        sql += " order by id offset ? rows fetch next 4 rows only";
        System.out.println(sql);
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, (index - 1) * 4);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                int id = rs.getInt(1);
                int companyId1 = rs.getInt(2);
                Company com = comD.getCompanybyId(companyId1);
                String des = rs.getString(3);
                String location = rs.getString(4);
                int yearExp = rs.getInt(5);
                double salary = rs.getDouble(6);
                int accountId = rs.getInt(7);
                Account acc = accD.getAccountById(accountId);
                int applyId = rs.getInt(8);
                String jobType = rs.getString(9);
                int majorId1 = rs.getInt(10);
                Job job = new Job(id, jobType, com, des, location, yearExp, salary, acc, applyId, majorId1);
                jobList.add(job);
            }
        } catch (Exception ex) {
            Logger.getLogger(JobDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return jobList;
    }

    public boolean apply(int applierId, int jobId, String cv_link) {
        String sql = "insert into apply(applierId,jobId,cv_link)\n"
                + " values (?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, applierId);
            st.setInt(2, jobId);
            st.setString(3, cv_link);
            int soLuong = st.executeUpdate();
            if (soLuong > 0) {
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(JobDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public List<Job> getRecommendJobs(int accountId) {
        List<Job> list = new ArrayList<>();
        String sql = "	select * from jobs where year_exp <= (select year_exp from profiles \n"
                + "	where id = (select profile_id from account where account_id = ?)) \n"
                + "	and majorId in (select majorId from education where account_id =  ?)\n"
                + "	order by salary desc";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, accountId);
            st.setInt(2, accountId);
            ResultSet rs = st.executeQuery();
            CompanyDAO cdao = new CompanyDAO();
            UserDAO adao = new UserDAO();
            while (rs.next()) {
                Job j = new Job(rs.getInt(01), rs.getString(9), cdao.getCompanybyId(rs.getInt(2)), rs.getString(3), rs.getString(4), rs.getInt(5), rs.getDouble(6), adao.getAccountById(rs.getInt(7)), rs.getInt(8), rs.getInt(10));
                list.add(j);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Job> getJobByPosterId() {
        List<Job> list = new ArrayList<>();
        String sql = "select * from jobs where poster_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, posterId);
            ResultSet rs = st.executeQuery();
            CompanyDAO cdao = new CompanyDAO();
            UserDAO adao = new UserDAO();
            while (rs.next()) {
                Job j = new Job(rs.getInt(01), rs.getString(9), cdao.getCompanybyId(rs.getInt(2)), rs.getString(3), rs.getString(4), rs.getInt(5), rs.getDouble(6), adao.getAccountById(rs.getInt(7)), rs.getInt(8), rs.getInt(10));
                list.add(j);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public String getCV() {
        String sql = " select * from apply where jobId = " + jobId + " AND applierId = " + applierId;
        System.out.println(sql);
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getString(3);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public int getTotalJobs() {
        String sql = "SELECT COUNT(*) AS TotalJobs\n"
                + "FROM jobs";
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

    public int getTotalLocations() {
        String sql = "select count(distinct location) from jobs ";
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
    public int getDays() {
     String sql = "SELECT DATEDIFF(day, '2024-03-08', GETDATE()) AS SoNgay ";
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
//        System.out.println(new JobDAO().getJobbyId(2));
        JobDAO dao = new JobDAO();
        dao.setJobId(1);
        dao.setApplierId(1);
        String[] locations = {"Korea", "FPT University"};
        String[] yearsExp = {"-1"};
        List<Job> data = dao.search("", "", "", "", null, null, "2");
        for (Job job : dao.getRecommendJobs(1)) {
            System.out.println(job);
        }
//        System.out.println(dao.getTotalJobs());
//        System.out.println(dao.getTotalLocations());
        System.out.println(dao.getDays());
    }

}
