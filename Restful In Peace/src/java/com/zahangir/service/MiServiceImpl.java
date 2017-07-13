/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.zahangir.service;

import com.zahangir.dao.MiDao;
import com.zahangir.model.Mi;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author Zahangir Alam
 */
@Service
public class MiServiceImpl implements MiService{
    
    @Autowired
    private MiDao miDao;

    @Override
    @Transactional
    public void addMi(Mi mi) {
        miDao.addMi(mi);
    }

    @Override
    @Transactional
    public void removeMiById(int id) {
        miDao.removeMiById(id);
    }

    @Override
    @Transactional
    public void updateMi(Mi mi) {
        miDao.updateMi(mi);
    }

    @Override
    @Transactional
    public List<Mi> getMiList() {
        return miDao.getMiList();
    }

    @Override
    @Transactional
    public Mi getMiByTime(String time) {
        return miDao.getMiByTime(time);
    }

    @Override
    @Transactional
    public Mi getMiById(int id) {
        return miDao.getMiById(id);
    }
    
}
