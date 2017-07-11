/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.zahangir.dao;

import com.zahangir.model.Outdoor;
import java.util.List;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Zahangir Alam
 */
@Repository
public class OutDoorDaoImpl implements OutDoorDao {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public void addOutdoor(Outdoor outdoor) {
        sessionFactory.getCurrentSession().save(outdoor);
    }

    @Override
    public void removeOutoorById(int id) {
        Outdoor outdoor = (Outdoor) sessionFactory.getCurrentSession().load(Outdoor.class, id);
        if (outdoor != null) {
            sessionFactory.getCurrentSession().delete(outdoor);
        }
    }

    @Override
    public List<Object[]> getOutdoorPatientList() {
        List<Object[]> outdoorPatientList = sessionFactory.getCurrentSession().createQuery("select o.outdoorId, "
                + "p.patientName, p.patientAge, p.patientGender, p.patientContactNo from Outdoor o, "
                + "Patient p where o.admission.patient.patientId = p.patientId").list();
        return outdoorPatientList;
    }

}
