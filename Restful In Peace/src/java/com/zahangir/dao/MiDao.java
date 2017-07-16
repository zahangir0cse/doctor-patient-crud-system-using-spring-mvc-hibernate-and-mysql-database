/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.zahangir.dao;

import com.zahangir.model.Mi;
import java.util.List;

/**
 *
 * @author Zahangir Alam
 */
public interface MiDao {
    void addMi(Mi mi);
    void removeMiById(int id);
    void updateMi(Mi mi);
    List<Mi> getMiList();
    Mi getMiByTime(String time);
    Mi getMiById(int id);
    Mi getMiByEmail(String email);
}
