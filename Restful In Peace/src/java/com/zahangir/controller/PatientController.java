
package com.zahangir.controller;

import com.zahangir.model.Patient;
import com.zahangir.service.PatientService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class PatientController {
    
    @Autowired
    PatientService patientService;
    
    @RequestMapping(value = "/patient/add", method = RequestMethod.POST)
    public String addPatient(@ModelAttribute("patient") Patient patient, BindingResult result){
        if (patient.getPatientId() == null) {
            patientService.addPatient(patient);
        }
        return "";
        
    }
}
