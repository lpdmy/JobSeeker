/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author lpdie
 */
import java.sql.Date;

public class Profile {
    private int id;
    private String firstName;
    private String lastName;
    private Date birthdate;
    private String phone;
    private char gender;
    private String img;
    private int yearExp;


    // Constructor
    public Profile(int id, String firstName, String lastName, Date birthdate, String phone, char gender, String img, int yearExp) {
        this.id = id;
        this.firstName = firstName;
        this.lastName = lastName;
        this.birthdate = birthdate;
        this.phone = phone;
        this.gender = gender;
        this.img = img;
        this.yearExp = yearExp;

    }

    public Profile(String firstName, String lastName, Date birthdate, String phone, char gender, String img, int yearExp) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.birthdate = birthdate;
        this.phone = phone;
        this.gender = gender;
        this.img = img;
        this.yearExp = yearExp;
    }

    public Profile() {
    }

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public Date getBirthdate() {
        return birthdate;
    }

    public void setBirthdate(Date birthdate) {
        this.birthdate = birthdate;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public char getGender() {
        return gender;
    }

    public void setGender(char gender) {
        this.gender = gender;
    }



    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public int getYearExp() {
        return yearExp;
    }

    public void setYearExp(int yearExp) {
        this.yearExp = yearExp;
    }


    // Override toString method for easy printing
    @Override
    public String toString() {
        return "Profile{" +
                "id=" + id +
                ", firstName='" + firstName + '\'' +
                ", lastName='" + lastName + '\'' +
                ", birthdate=" + birthdate +
                ", phone='" + phone + '\'' +
                ", gender=" + gender +
                ", img='" + img + '\'' +
                ", yearExp=" + yearExp +
                '}';
    }
}

