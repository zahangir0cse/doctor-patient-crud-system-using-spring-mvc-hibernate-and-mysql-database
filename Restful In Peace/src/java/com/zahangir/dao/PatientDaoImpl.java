/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.zahangir.dao;

import com.zahangir.model.Patient;
import java.util.List;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Zahangir Alam
 */
@Repository
public class PatientDaoImpl implements PatientDao{
    
    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public void addPatient(Patient p) {
        sessionFactory.getCurrentSession().save(p);
    }

    @Override
    public void removePatientById(int id) {
        Patient patient = (Patient)sessionFactory.getCurrentSession().load(Patient.class, id);
        
        if (patient != null) {
            sessionFactory.getCurrentSession().delete(patient);
        }
    }

    @Override
    public List<Patient> patientList() {
        return sessionFactory.getCurrentSession().createQuery("from Patient").list();
    }

    @Override
    public Patient getPatientById(int id) {
        List<Patient> list = sessionFactory.getCurrentSession().createQuery("from Patient p where p.patientId=:pid").setParameter("pid", id).list();
        return list.size()>0?(Patient) list.get(0): null;
    }
    
}
