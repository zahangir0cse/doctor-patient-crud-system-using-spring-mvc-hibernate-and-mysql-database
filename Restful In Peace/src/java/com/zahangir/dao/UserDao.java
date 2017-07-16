/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.zahangir.dao;

import com.zahangir.model.User;
import java.util.List;

/**
 *
 * @author Zahangir Alam
 */
public interface UserDao {
    void addUser(User user);
    List<User> userList();
    void removeUser(User user);
    void updateUser(User user);
    boolean getUserByEmailAndPass(String email, String pass);
    User getUserByEmail(String email);
}
