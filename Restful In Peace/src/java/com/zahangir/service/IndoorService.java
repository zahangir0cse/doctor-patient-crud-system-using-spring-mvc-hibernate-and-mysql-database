/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.zahangir.service;

import com.zahangir.model.Indoor;

/**
 *
 * @author Zahangir Alam
 */
public interface IndoorService {
    void addIndoor(Indoor indoor);
    void removeInoorById(int id);
    
}