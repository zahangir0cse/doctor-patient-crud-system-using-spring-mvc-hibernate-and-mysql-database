/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.zahangir.dao;

import com.zahangir.model.Indoor;
import java.util.List;
import org.hibernate.Query;
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
        Query query = sessionFactory.getCurrentSession().createQuery("delete i from Indoor i where i.admission.patient.patientId =:pid");
        query.setParameter("pid", id);
        query.executeUpdate();
    }

    @Override
    public Indoor getIndoorByPatientId(int id) {
        Indoor indoor = (Indoor)sessionFactory.getCurrentSession().createQuery("FROM Indoor i where i.admission.patient.patientId='"+id+"'").uniqueResult();
        return indoor;
    }

    @Override
    public Indoor lastIndoor() {
        Indoor lastIndoor = (Indoor) sessionFactory.getCurrentSession().createQuery("FROM Indoor ORDER BY indoorId DESC").setMaxResults(1).uniqueResult();
        return lastIndoor;
    }

    @Override
    public List<Object[]> patientListBySpEmail(String email) {
        List<Object[]> patientList = sessionFactory.getCurrentSession().createQuery("select p.patientName, i.indoorId, i.indoorType, s  from Patient p, Indoor i ").list();
        patientList.toString();
        return patientList;
    }
    
}
