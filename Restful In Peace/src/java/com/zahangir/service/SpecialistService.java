/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.zahangir.service;

import com.zahangir.model.Specialist;
import java.util.List;

/**
 *
 * @author Zahangir Alam
 */
public interface SpecialistService {
    void addSpecialist(Specialist specialist);
    void removeSpecialistById(int id);
    void updateSpecialist(Specialist specialist);
    List<Specialist> getSpecialistList();
    Specialist getSpecialistByDepartment(String department);
    Specialist getSpecialistById(int id);
}
