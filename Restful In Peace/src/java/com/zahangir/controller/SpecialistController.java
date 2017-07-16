/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.zahangir.controller;

import com.zahangir.model.Specialist;
import com.zahangir.service.SpecialistService;
import java.util.HashMap;
import java.util.Map;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author Zahangir Alam
 */
@Controller
public class SpecialistController {

    @Autowired
    SpecialistService specialistService;

    @RequestMapping(value = "/specialist/specialistinfo", method = RequestMethod.GET)
    public String addspecialistView(@ModelAttribute("specialist") Specialist specialist, BindingResult result) {
        return "addspecialist";
    }

    @RequestMapping(value = "specialist/sadd", method = RequestMethod.POST)
    public String addSpecialist(@Valid @ModelAttribute("specialist") Specialist specialist, BindingResult result) {
        if (result.hasErrors()) {
            return "addspecialist";
        } else {
            specialistService.addSpecialist(specialist);
            return "redirect:/specialist/allsp";
        }

    }
    
    @ModelAttribute("specialtyList")
    public Map<String, String> getSpecialtyList() {
        Map<String, String> specialtyList = new HashMap<>();
        specialtyList.put("Abdominal Radiology", "Abdominal Radiology");
        specialtyList.put("Pain Medicine", "Pain Medicine");
        specialtyList.put("Dermatology", "Dermatology");
        specialtyList.put("Radiation Oncology", "Radiation Oncology");
        specialtyList.put("Surgery-General", "Surgery-General");
        return specialtyList;
    }
    
    @ModelAttribute("qualificationList")
    public Map<String, String> geQualificationList() {
        Map<String, String> qualificationList = new HashMap<>();
        qualificationList.put("PhD", "PhD");
        qualificationList.put("MBBS", "MBBS");
        return qualificationList;
    }

    @RequestMapping(value = "/specialist/sedit", method = RequestMethod.POST)
    public String editSpecialist(@ModelAttribute("specialist") Specialist specialist, BindingResult result) {
        specialistService.updateSpecialist(specialist);
        return "redirect:/specialist/allsp";
    }

    @RequestMapping(value = "/specialist/delete/{sid}")
    public String deleteSpecialist(@PathVariable("sid") Integer sid) {
        specialistService.removeSpecialistById(sid);
        return "redirect:/specialist/allsp";
    }

    @RequestMapping(value = "/specialist/edit/{sid}")
    public String editProduct(@PathVariable("sid") Integer sid, Map<String, Object> map) {
        map.put("specialist", specialistService.getSpecialistById(sid));
        map.put("specialistList", specialistService.getSpecialistList());
        return "editspecialist";
    }

    @RequestMapping(value = "/specialist/allsp", method = RequestMethod.GET)
    public String listSpecialist(Map<String, Object> map) {
        map.put("specialist", new Specialist());
        map.put("specialistList", specialistService.getSpecialistList());
        return "specialistlist";
    }

}
