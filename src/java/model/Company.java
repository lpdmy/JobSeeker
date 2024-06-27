/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.List;

/**
 *
 * @author MINH TUAN
 */
public class Company {

    private int companyId;
    private String companyName;
    private String description;
    private String companyUrl;
    private String img;
    private String code;

    public Company(int companyId, String companyName, String description, String companyUrl, String img) {
        this.companyId = companyId;
        this.companyName = companyName;
        this.description = description;
        this.companyUrl = companyUrl;
        this.img = img;
    }

    public Company(int companyId, String companyName, String description, String companyUrl, String img, String code) {
        this.companyId = companyId;
        this.companyName = companyName;
        this.description = description;
        this.companyUrl = companyUrl;
        this.img = img;
        this.code = code;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }


    public int getCompanyId() {
        return companyId;
    }

    public void setCompanyId(int companyId) {
        this.companyId = companyId;
    }

    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getCompanyUrl() {
        return companyUrl;
    }

    public void setCompanyUrl(String companyUrl) {
        this.companyUrl = companyUrl;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    @Override
    public String toString() {
        return "Company{" + "companyId=" + companyId + ", companyName=" + companyName + ", description=" + description + ", companyUrl=" + companyUrl + ", img=" + img + '}';
    }

}
