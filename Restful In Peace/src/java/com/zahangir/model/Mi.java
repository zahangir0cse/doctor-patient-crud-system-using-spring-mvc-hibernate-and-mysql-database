package com.zahangir.model;
// Generated Jul 10, 2017 4:54:19 AM by Hibernate Tools 4.3.1



/**
 * Mi generated by hbm2java
 */
public class Mi  implements java.io.Serializable {


     private Integer miId;
     private Outdoor outdoor;
     private String miName;
     private String miQualification;
     private String miAddress;
     private String miGender;
     private String miContactNo;
     private String miEmail;

    public Mi() {
    }

    public Mi(Outdoor outdoor, String miName, String miQualification, String miAddress, String miGender, String miContactNo, String miEmail) {
       this.outdoor = outdoor;
       this.miName = miName;
       this.miQualification = miQualification;
       this.miAddress = miAddress;
       this.miGender = miGender;
       this.miContactNo = miContactNo;
       this.miEmail = miEmail;
    }
   
    public Integer getMiId() {
        return this.miId;
    }
    
    public void setMiId(Integer miId) {
        this.miId = miId;
    }
    public Outdoor getOutdoor() {
        return this.outdoor;
    }
    
    public void setOutdoor(Outdoor outdoor) {
        this.outdoor = outdoor;
    }
    public String getMiName() {
        return this.miName;
    }
    
    public void setMiName(String miName) {
        this.miName = miName;
    }
    public String getMiQualification() {
        return this.miQualification;
    }
    
    public void setMiQualification(String miQualification) {
        this.miQualification = miQualification;
    }
    public String getMiAddress() {
        return this.miAddress;
    }
    
    public void setMiAddress(String miAddress) {
        this.miAddress = miAddress;
    }
    public String getMiGender() {
        return this.miGender;
    }
    
    public void setMiGender(String miGender) {
        this.miGender = miGender;
    }
    public String getMiContactNo() {
        return this.miContactNo;
    }
    
    public void setMiContactNo(String miContactNo) {
        this.miContactNo = miContactNo;
    }
    public String getMiEmail() {
        return this.miEmail;
    }
    
    public void setMiEmail(String miEmail) {
        this.miEmail = miEmail;
    }




}


