/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.zahangir.dao;

import com.zahangir.model.Indoor;
import java.util.List;

/**
 *
 * @author Zahangir Alam
 */
public interface IndoorDao {
    void addIndoor(Indoor indoor);
    void removeInoorById(int id);
    List<Object[]> getIndoorPatientList();
    void deleteIndoorByPatientId(int id);
    Indoor getIndoorByPatientId(int id);
    Indoor lastIndoor();
}
