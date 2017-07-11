/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.zahangir.controller;

import com.zahangir.model.Mi;
import com.zahangir.service.MiService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author Zahangir Alam
 */
@Controller("mi")
public class MiController {
    
    @Autowired
    MiService miService;
    
    @RequestMapping(value="/miinfo", method = RequestMethod.GET)
    public  String addPatient(@ModelAttribute("mi") Mi mi, BindingResult result){
        return "addmi";
    }
    
    @RequestMapping(value = "/madd", method = RequestMethod.POST)
    public String addAdmission(@ModelAttribute("mi") Mi mi, BindingResult result){
        if (mi.getMiId()== null) {
            miService.addMi(mi);
        }
        return "milist";
        
    }
    
    
}
