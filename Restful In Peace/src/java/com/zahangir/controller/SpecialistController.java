/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.zahangir.controller;

import com.zahangir.model.Specialist;
import com.zahangir.service.SpecialistService;
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
@Controller("specialist")
public class SpecialistController {
    @Autowired
    SpecialistService specialistService;
    
    @RequestMapping(value="/specialistinfo", method = RequestMethod.GET)
    public  String addspecialist(@ModelAttribute("specialist") Specialist specialist, BindingResult result){
        return "addspecialist";
    }
    
    @RequestMapping(value = "/sadd", method = RequestMethod.POST)
    public String addAdmission(@ModelAttribute("mi") Specialist specialist, BindingResult result){
        if (specialist.getSpecialistId()== null) {
            specialistService.addSpecialist(specialist);
        }
        return "specialistlist";
        
    }
}
