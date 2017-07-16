/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.zahangir.dao;

import com.zahangir.model.Mi;
import java.util.List;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Zahangir Alam
 */
@Repository
public class MiDaoImpl implements MiDao{
    
    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public void addMi(Mi mi) {
        sessionFactory.getCurrentSession().save(mi);
    }

    @Override
    public void removeMiById(int id) {
        Mi mi = (Mi)sessionFactory.getCurrentSession().load(Mi.class, id);
        if(mi != null){
            sessionFactory.getCurrentSession().delete(mi);
        }
    }

    @Override
    public void updateMi(Mi mi) {
        System.out.println("Hello i am here dao");
        sessionFactory.getCurrentSession().saveOrUpdate(mi);
        System.out.println("Hello i am here dao 2");
    }

    @Override
    public List<Mi> getMiList() {
        List<Mi> miList = sessionFactory.getCurrentSession().createQuery("from Mi").list();
        return miList;
    }

    @Override
    public Mi getMiByTime(String time) {
        Mi mi = (Mi)sessionFactory.getCurrentSession().createQuery("from Mi m where m.miTime='"+time+"'").uniqueResult();
        return mi;
    }

    @Override
    public Mi getMiById(int id) {
        List<Mi> list = sessionFactory.getCurrentSession().createQuery("from Mi m where m.miId=:mid").setParameter("mid", id).list();
        return list.size()>0?(Mi) list.get(0): null;
    }

    @Override
    public Mi getMiByEmail(String email) {
        List<Mi> list = sessionFactory.getCurrentSession().createQuery("from Mi m where m.miEmail=:memail").setParameter("memail", email).list();
        if (list.size()>0) {
            return (Mi)list.get(0);
        }else{
            return null;
        }
    }
    
}
