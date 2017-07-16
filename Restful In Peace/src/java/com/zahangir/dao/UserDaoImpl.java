/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.zahangir.dao;

import com.zahangir.model.User;
import java.util.List;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Zahangir Alam
 */
@Repository
public class UserDaoImpl implements UserDao{
    
    @Autowired
    SessionFactory sessionFactory;

    @Override
    public void addUser(User user) {
        sessionFactory.getCurrentSession().save(user);
    }

    @Override
    public List<User> userList() {
        List<User> uList = sessionFactory.getCurrentSession().createQuery("FROM User").list();
        return uList;
    }

    @Override
    public void removeUser(Integer userId) {
        User user = (User) sessionFactory.getCurrentSession().load(User.class, userId);
        if (user != null) {
            sessionFactory.getCurrentSession().delete(user);
        }
    }

    @Override
    public void updateUser(User user) {
        sessionFactory.getCurrentSession().update(user);
    }

    @Override
    public boolean getUserByEmailAndPass(String email, String pass) {
        List<User> userList = sessionFactory.getCurrentSession().createQuery("FROM User u where u.userEmail='"+email+"' and u.userPassword = '"+pass+"'").list();
        return userList.size()>0;
        
    }

    @Override
    public User getUserByEmail(String email) {
        List<User> userList = sessionFactory.getCurrentSession().createQuery("FROM User u where u.userEmail='"+email+"'").list();
        if (userList.size()>0) {
            return (User)userList.get(0);
        }else{
            return null;
        }
    }
    
}
