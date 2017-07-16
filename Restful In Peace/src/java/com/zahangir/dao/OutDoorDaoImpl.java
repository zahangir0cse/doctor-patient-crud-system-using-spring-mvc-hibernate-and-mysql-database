/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.zahangir.dao;

import com.zahangir.model.Outdoor;
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

    @Override
    public void deleteOutdoorByPatientId(int id) {
        Query query = sessionFactory.getCurrentSession().createQuery("DELETE from Outdoor o where o.admission.admissionId in "
                + "(select a from Admission a where a.patient.patientId in (select p from Patient p where p.patientId =:pid))");
        query.setParameter("pid", id);
        query.executeUpdate();
    }

    @Override
    public Outdoor lastOutdoor() {
        Outdoor lastOutdoor = (Outdoor) sessionFactory.getCurrentSession().createQuery("FROM Outdoor ORDER BY outdoorId DESC").setMaxResults(1).uniqueResult();
        return lastOutdoor;
    }

    @Override
    public List<Outdoor> getPatientByMiId(int id) {
        List<Outdoor> list = sessionFactory.getCurrentSession().createQuery("from Outdoor o where o.mi.miId = :mid").setParameter("mid", id).list();
        return list;
    }

}
