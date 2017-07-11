/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.zahangir.service;

import com.zahangir.dao.IndoorDao;
import com.zahangir.model.Indoor;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author Zahangir Alam
 */
@Service
public class IndoorServiceImpl implements IndoorService{
    
    @Autowired
    private IndoorDao indoorDao;

    @Override
    @Transactional
    public void addIndoor(Indoor indoor) {
        indoorDao.addIndoor(indoor);
    }

    @Override
    @Transactional
    public void removeInoorById(int id) {
        indoorDao.removeInoorById(id);
    }

    @Override
    @Transactional
    public List<Object[]> getIndoorPatientList() {
        return indoorDao.getIndoorPatientList();
    }

    @Override
    @Transactional
    public void deleteIndoorByPatientId(int id) {
        indoorDao.deleteIndoorByPatientId(id);
    }
    
}
