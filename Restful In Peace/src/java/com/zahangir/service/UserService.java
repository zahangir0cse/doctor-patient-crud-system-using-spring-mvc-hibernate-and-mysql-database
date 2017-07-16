/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.zahangir.service;

import com.zahangir.model.User;
import java.util.List;

/**
 *
 * @author Zahangir Alam
 */
public interface UserService {
    public void addUser(User user);
    public List<User> userList();
    public void removeUser(Integer userId);
    public void updateUser(User user);
    boolean getUserByEmailAndPass(String email, String pass);
    User getUserByEmail(String email);
}
