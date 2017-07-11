/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.zahangir.service;

import com.zahangir.dao.AdmissionDao;
import com.zahangir.model.Admission;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author Zahangir Alam
 */
@Service
public class AdmissionServiceImpl implements AdmissionService{
    
    @Autowired
    AdmissionDao admissionDao;

    @Override
    @Transactional
    public void addAdmission(Admission admission) {
        admissionDao.addAdmission(admission);
    }

    @Override
    @Transactional
    public void removeAdmissionById(int id) {
        admissionDao.removeAdmissionById(id);
    }

    @Override
    @Transactional
    public Admission lastAdmission() {
        return admissionDao.lastAdmission();
    }

    @Override
    @Transactional
    public void deleteAdmissionByPatientId(int id) {
        admissionDao.deleteAdmissionByPatientId(id);
    }
    
}
