/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.zahangir.service;

import com.zahangir.dao.OutDoorDao;
import com.zahangir.model.Outdoor;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author Zahangir Alam
 */
@Service
public class OutdoorServiceImpl implements OutdoorService{
    
    @Autowired
    private OutDoorDao outDoorDao;

    @Override
    @Transactional
    public void addOutdoor(Outdoor outdoor) {
        outDoorDao.addOutdoor(outdoor);
    }

    @Override
    @Transactional
    public void removeOutoorById(int id) {
        outDoorDao.removeOutoorById(id);
    }

    @Override
    @Transactional
    public List<Object[]> getOutdoorPatientList() {
        return outDoorDao.getOutdoorPatientList();
    }
    
}
