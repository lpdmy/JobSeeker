/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author MINH TUAN
 */
public class Job {

    private int id;
    private String jobType;
    private Company company;
    private String description;
    private String location;
    private int yearExp;
    private double salary;
    private Account account;
    private int applyId;
    int majorId;

    public Job(int id, String jobType, Company company, String description, String location, int yearExp, double salary, Account account, int applyId, int majorId) {
        this.id = id;
        this.jobType = jobType;
        this.company = company;
        this.description = description;
        this.location = location;
        this.yearExp = yearExp;
        this.salary = salary;
        this.account = account;
        this.applyId = applyId;
        this.majorId = majorId;
    }

    public Job() {
    }

    public Job(String jobType, Company company, String description, String location, int yearExp, double salary, Account account, int applyId, int majorId) {
        this.jobType = jobType;
        this.company = company;
        this.description = description;
        this.location = location;
        this.yearExp = yearExp;
        this.salary = salary;
        this.account = account;
        this.applyId = applyId;
        this.majorId = majorId;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getJobType() {
        return jobType;
    }

    public void setJobType(String jobType) {
        this.jobType = jobType;
    }

    public Company getCompany() {
        return company;
    }

    public void setCompany(Company company) {
        this.company = company;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public int getYearExp() {
        return yearExp;
    }

    public void setYearExp(int yearExp) {
        this.yearExp = yearExp;
    }

    public double getSalary() {
        return salary;
    }

    public void setSalary(double salary) {
        this.salary = salary;
    }

    public Account getAccount() {
        return account;
    }

    public void setAccount(Account account) {
        this.account = account;
    }

    public int getApplyId() {
        return applyId;
    }

    public void setApplyId(int applyId) {
        this.applyId = applyId;
    }

    public int getMajorId() {
        return majorId;
    }

    public void setMajorId(int majorId) {
        this.majorId = majorId;
    }

    @Override
    public String toString() {
        return "Job{" + "id=" + id + ", jobType=" + jobType + ", company=" + company + ", description=" + description + ", location=" + location + ", yearExp=" + yearExp + ", salary=" + salary + ", account=" + account + ", applyId=" + applyId + ", majorId=" + majorId + '}';
    }

   

}
