/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.zahangir.dao;

import com.zahangir.model.Outdoor;

/**
 *
 * @author Zahangir Alam
 */
public interface OutDoorDao {
    void addOutdoor(Outdoor outdoor);
    void removeOutoorById(int id);
}
