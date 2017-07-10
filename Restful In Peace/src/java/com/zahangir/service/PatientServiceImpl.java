/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.zahangir.service;

import com.zahangir.dao.PatientDao;
import com.zahangir.model.Patient;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author Zahangir Alam
 */
@Service
public class PatientServiceImpl implements PatientService{
    
    @Autowired
    PatientDao patientDao;

    @Override
    @Transactional
    public void addPatient(Patient p) {
        patientDao.addPatient(p);
    }

    @Override
    @Transactional
    public void removePatientById(int id) {
        patientDao.removePatientById(id);
    }

    @Override
    @Transactional
    public List<Patient> patientList() {
        return patientDao.patientList();
    }
    
}
