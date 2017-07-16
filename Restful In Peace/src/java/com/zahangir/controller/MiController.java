/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.zahangir.controller;

import com.zahangir.model.Mi;
import com.zahangir.service.MiService;
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
public class MiController {

    @Autowired
    MiService miService;

    @RequestMapping(value = "/mi/miinfo", method = RequestMethod.GET)
    public String addMiView(@ModelAttribute("mi") Mi mi, BindingResult result) {
        return "addmi";
    }

    @RequestMapping(value = "/mi/madd", method = RequestMethod.POST)
    public String addMi(@ModelAttribute("mi") Mi mi, BindingResult result) {
        if (result.hasErrors()) {
            return "addmi";
        } else {
            miService.addMi(mi);
            return "redirect:/mi/allmi";
        }
    }

    @RequestMapping(value = "/mi/medit", method = RequestMethod.POST)
    public String editMi(@Valid @ModelAttribute("mi") Mi mi, BindingResult result) {
        if (result.hasErrors()) {
            return "editmi";
        }else {
            System.out.println("Hello i am here");
            miService.updateMi(mi);
            System.out.println("Hello i am here");
            return "redirect:/mi/allmi";
        }
        
    }
    
    @RequestMapping(value = "/editmi", method = RequestMethod.POST)
    public String edit(@Valid @ModelAttribute("mi") Mi mi, BindingResult result) {
        if (result.hasErrors()) {
            return "miedit";
        }else {
            System.out.println("Hello i am here");
            miService.updateMi(mi);
            System.out.println("Hello i am here");
            return "misuccess";
        }
        
    }

    @ModelAttribute("timeList")
    public Map<String, String> getTimeList() {
        Map<String, String> timeList = new HashMap<>();
        timeList.put("10 to 12 am & 5 to 7 pm", "10 to 12 am & 5 to 7 pm");
        timeList.put("2 to 7 pm", "2 to 7 pm");
        timeList.put("5 to 7 pm", "5 to 7 pm");
        timeList.put("10 am to 12 noon", "10 am to 12 noon");
        return timeList;
    }

    @RequestMapping(value = "/mi/allmi", method = RequestMethod.GET)
    public String listMi(Map<String, Object> map) {
        map.put("mi", new Mi());
        map.put("miList", miService.getMiList());
        return "milist";
    }

    @RequestMapping(value = "/mi/delete/{mid}")
    public String deleteMi(@PathVariable("mid") Integer mid) {
        miService.removeMiById(mid);
        return "redirect:/mi/allmi";
    }

    @RequestMapping(value = "/mi/edit/{mid}")
    public String editMi(@PathVariable("mid") Integer mid, Map<String, Object> map) {
        map.put("mi", miService.getMiById(mid));
        map.put("miList", miService.getMiList());
        return "editmi";
    }
    
    @RequestMapping(value = "/miedit/{mid}")
    public String Miedit(@PathVariable("mid") Integer mid, Map<String, Object> map) {
        map.put("mi", miService.getMiById(mid));
        map.put("miList", miService.getMiList());
        return "miedit";
    }
    @ModelAttribute("qualificationList")
    public Map<String, String> geQualificationList() {
        Map<String, String> qualificationList = new HashMap<>();
        qualificationList.put("PhD", "PhD");
        qualificationList.put("MBBS", "MBBS");
        return qualificationList;
    }
}
