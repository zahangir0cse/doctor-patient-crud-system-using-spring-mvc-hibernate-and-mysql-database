package com.zahangir.model;
// Generated Jul 10, 2017 4:54:19 AM by Hibernate Tools 4.3.1


import java.util.Date;

/**
 * ReleasedPatient generated by hbm2java
 */
public class ReleasedPatient  implements java.io.Serializable {


     private Integer releasedPatientId;
     private Date releasedDate;
     private int oldPatientId;
     private String oldPatientName;
     private String oldPatientAddress;
     private int oldPatientAge;
     private String oldPatientContactNo;
     private String oldPatientEmail;
     private String oldPatientGender;
     private String action;

    public ReleasedPatient() {
    }

    public ReleasedPatient(Date releasedDate, int oldPatientId, String oldPatientName, String oldPatientAddress, int oldPatientAge, String oldPatientContactNo, String oldPatientEmail, String oldPatientGender, String action) {
       this.releasedDate = releasedDate;
       this.oldPatientId = oldPatientId;
       this.oldPatientName = oldPatientName;
       this.oldPatientAddress = oldPatientAddress;
       this.oldPatientAge = oldPatientAge;
       this.oldPatientContactNo = oldPatientContactNo;
       this.oldPatientEmail = oldPatientEmail;
       this.oldPatientGender = oldPatientGender;
       this.action = action;
    }
   
    public Integer getReleasedPatientId() {
        return this.releasedPatientId;
    }
    
    public void setReleasedPatientId(Integer releasedPatientId) {
        this.releasedPatientId = releasedPatientId;
    }
    public Date getReleasedDate() {
        return this.releasedDate;
    }
    
    public void setReleasedDate(Date releasedDate) {
        this.releasedDate = releasedDate;
    }
    public int getOldPatientId() {
        return this.oldPatientId;
    }
    
    public void setOldPatientId(int oldPatientId) {
        this.oldPatientId = oldPatientId;
    }
    public String getOldPatientName() {
        return this.oldPatientName;
    }
    
    public void setOldPatientName(String oldPatientName) {
        this.oldPatientName = oldPatientName;
    }
    public String getOldPatientAddress() {
        return this.oldPatientAddress;
    }
    
    public void setOldPatientAddress(String oldPatientAddress) {
        this.oldPatientAddress = oldPatientAddress;
    }
    public int getOldPatientAge() {
        return this.oldPatientAge;
    }
    
    public void setOldPatientAge(int oldPatientAge) {
        this.oldPatientAge = oldPatientAge;
    }
    public String getOldPatientContactNo() {
        return this.oldPatientContactNo;
    }
    
    public void setOldPatientContactNo(String oldPatientContactNo) {
        this.oldPatientContactNo = oldPatientContactNo;
    }
    public String getOldPatientEmail() {
        return this.oldPatientEmail;
    }
    
    public void setOldPatientEmail(String oldPatientEmail) {
        this.oldPatientEmail = oldPatientEmail;
    }
    public String getOldPatientGender() {
        return this.oldPatientGender;
    }
    
    public void setOldPatientGender(String oldPatientGender) {
        this.oldPatientGender = oldPatientGender;
    }
    public String getAction() {
        return this.action;
    }
    
    public void setAction(String action) {
        this.action = action;
    }




}


