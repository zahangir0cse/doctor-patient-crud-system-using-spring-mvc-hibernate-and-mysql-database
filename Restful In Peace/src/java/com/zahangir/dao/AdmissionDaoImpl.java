/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.zahangir.dao;

import com.zahangir.model.Admission;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Zahangir Alam
 */
@Repository
public class AdmissionDaoImpl implements AdmissionDao{
    
    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public void addAdmission(Admission admission) {
        sessionFactory.getCurrentSession().save(admission);
    }

    @Override
    public void removeAdmissionById(int id) {
        Admission admission = (Admission)sessionFactory.getCurrentSession().load(Admission.class, id);
        if (admission != null) {
            sessionFactory.getCurrentSession().delete(admission);
        }
    }
    
}
