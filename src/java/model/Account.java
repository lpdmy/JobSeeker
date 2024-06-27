/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;


public class Account {
    private int accountId;
    private String username;
    private String email;
    private String password;
    private int role;
    private Profile profile;

    // Constructor
    public Account(int accountId, String username, String email, String password, int role, Profile profile) {   
        this.accountId = accountId;
        this.username = username;
        this.email = email;
        this.password = password;
        this.role = role;
        this.profile = profile;
    }

    public Account(String username, String email, String password, int role, Profile profile) {
        this.username = username;
        this.email = email;
        this.password = password;
        this.role = role;
        this.profile = profile;
    }

    public Account() {
    }

    // Getters and Setters
    public int getAccountId() {
        return accountId;
    }

    public void setAccountId(int accountId) {
        this.accountId = accountId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getRole() {
        return role;
    }

    public void setRole(int role) {
        this.role = role;
    }

    public Profile getProfile() {
        return profile;
    }

    public void setProfile(Profile profile) {
        this.profile = profile;
    }


    @Override
    public String toString() {
        return "Account{" + "accountId=" + accountId + ", username=" + username + ", email=" + email + ", password=" + password + ", role=" + role + ", profile=" + profile + '}';
    }
  
}
