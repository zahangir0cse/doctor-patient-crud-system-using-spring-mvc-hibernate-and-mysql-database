/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.zahangir.dao;

import com.zahangir.model.Indoor;
import java.util.List;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Zahangir Alam
 */
@Repository
public class IndoorDaoImpl implements IndoorDao{
    
    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public void addIndoor(Indoor indoor) {
        sessionFactory.getCurrentSession().save(indoor);
    }

    @Override
    public void removeInoorById(int id) {
        Indoor indoor = (Indoor)sessionFactory.getCurrentSession().load(Indoor.class, id);
        if (indoor !=null) {
            sessionFactory.getCurrentSession().delete(indoor);
        }
    }

    @Override
    public List<Object[]> getIndoorPatientList() {
        List<Object[]> indoorPatientList = sessionFactory.getCurrentSession().createQuery("select i.indoorId, "
                + "i.indoorDepartment, p.patientName, p.patientAge, p.patientGender, p.patientContactNo from Indoor i, "
                + "Patient p where i.admission.patient.patientId = p.patientId").list();
        return indoorPatientList;
    }

    @Override
    public void deleteIndoorByPatientId(int id) {
        sessionFactory.getCurrentSession().createQuery("delete from Indoor i where i.admission.patient.patientId ='"+id+"'");
    }

    @Override
    public Indoor getIndoorByPatientId(int id) {
        Indoor indoor = (Indoor)sessionFactory.getCurrentSession().createQuery("FROM Indoor i where i.admission.patient.patientId='"+id+"'").uniqueResult();
        return indoor;
    }
    
}
