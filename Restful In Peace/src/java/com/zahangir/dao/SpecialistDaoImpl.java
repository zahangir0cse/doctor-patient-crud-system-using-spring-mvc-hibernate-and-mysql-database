/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.zahangir.dao;

import com.zahangir.model.Specialist;
import java.util.List;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Zahangir Alam
 */
@Repository
public class SpecialistDaoImpl implements SpecialistDao{
    
    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public void addSpecialist(Specialist specialist) {
        sessionFactory.getCurrentSession().save(specialist);
    }

    @Override
    public void removeSpecialistById(int id) {
        Specialist specialist =(Specialist)sessionFactory.getCurrentSession().load(Specialist.class, id);
        if (specialist != null) {
            sessionFactory.getCurrentSession().delete(specialist);
        }
    }

    @Override
    public void updateSpecialist(Specialist specialist) {
        sessionFactory.getCurrentSession().update(specialist);
    }

    @Override
    public List<Specialist> getSpecialistList() {
        List<Specialist> specialistList = sessionFactory.getCurrentSession().createQuery("from Specialist").list();
        return specialistList;
    }

    @Override
    public Specialist getSpecialistByDepartment(String department) {
        Specialist specialist = (Specialist) sessionFactory.getCurrentSession().createQuery("from Specialist s where s.specialistSpeialty ='"+ department +"'").uniqueResult();
        return specialist;
    }

    @Override
    public Specialist getSpecialistById(int id) {
        List<Specialist> list = sessionFactory.getCurrentSession().createQuery("from Specialist s where s.specialistId=:sid").setParameter("sid", id).list();
        return list.size()>0?(Specialist) list.get(0): null;
    }

    @Override
    public Specialist getSpecialistByEmail(String email) {
        List<Specialist> list = sessionFactory.getCurrentSession().createQuery("from Specialist s where s.specialistEmail=:semail").setParameter("semail", email).list();
        if (list.size()>0) {
            return (Specialist)list.get(0);
        }else{
            return null;
        }
        
    }
    
}
