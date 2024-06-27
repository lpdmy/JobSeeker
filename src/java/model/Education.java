/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author lpdie
 */
public class Education {

    private int id;
    private int majorId;
    private String uniName;
    private String rank;
    private Account account;

    public Education(int id, int majorId, String uniName, String rank, Account account) {
        this.id = id;
        this.majorId = majorId;
        this.uniName = uniName;
        this.rank = rank;
        this.account = account;
    }

    public Education(int majorId, String uniName, String rank, Account account) {
        this.majorId = majorId;
        this.uniName = uniName;
        this.rank = rank;
        this.account = account;
    }

    public Education() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getMajorId() {
        return majorId;
    }

    public void setMajorId(int majorId) {
        this.majorId = majorId;
    }

    public String getUniName() {
        return uniName;
    }

    public void setUniName(String uniName) {
        this.uniName = uniName;
    }

    public String getRank() {
        return rank;
    }

    public void setRank(String rank) {
        this.rank = rank;
    }

    public Account getAccount() {
        return account;
    }

    public void setAccount(Account account) {
        this.account = account;
    }

    @Override
    public String toString() {
        return "Education{" + "id=" + id + ", majorId=" + majorId + ", uniName=" + uniName + ", rank=" + rank + ", account=" + account + '}';
    }

    
}
