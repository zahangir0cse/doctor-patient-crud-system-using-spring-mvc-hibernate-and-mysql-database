/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.zahangir.service;

import com.zahangir.model.Outdoor;
import java.util.List;

/**
 *
 * @author Zahangir Alam
 */
public interface OutdoorService {
    void addOutdoor(Outdoor outdoor);
    void removeOutoorById(int id);
    List<Object[]> getOutdoorPatientList();
    void deleteOutdoorByPatientId(int id);
    Outdoor lastOutdoor();
    List<Outdoor> getPatientByMiId(int id);
}
