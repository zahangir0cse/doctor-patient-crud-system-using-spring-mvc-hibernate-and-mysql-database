/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.zahangir.service;

import com.zahangir.dao.SpecialistDao;
import com.zahangir.model.Specialist;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author Zahangir Alam
 */
@Service
public class SpecialistServiceImpl implements SpecialistService{
    
    @Autowired
    private SpecialistDao specialistDao;

    @Override
    @Transactional
    public void addSpecialist(Specialist specialist) {
        specialistDao.addSpecialist(specialist);
    }

    @Override
    @Transactional
    public void removeSpecialistById(int id) {
        specialistDao.removeSpecialistById(id);
    }

    @Override
    @Transactional
    public void updateSpecialist(Specialist specialist) {
        specialistDao.updateSpecialist(specialist);
    }

    @Override
    @Transactional
    public List<Specialist> getMiList() {
        return specialistDao.getMiList();
    }
    
}
