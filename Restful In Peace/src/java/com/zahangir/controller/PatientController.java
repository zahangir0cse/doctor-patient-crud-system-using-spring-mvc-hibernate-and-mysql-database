
package com.zahangir.controller;

import com.zahangir.model.Admission;
import com.zahangir.model.Patient;
import com.zahangir.service.AdmissionService;
import com.zahangir.service.PatientService;
import java.util.Date;
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
    
    @Autowired
    AdmissionService admissionService;
    
    @RequestMapping(value="/", method = RequestMethod.GET)
    public  String addPatient(@ModelAttribute("patient") Patient patient, BindingResult result){
        return "addpatient";
    }
    
    @RequestMapping(value = "/admit", method = RequestMethod.POST)
    public String addAdmission(@ModelAttribute("patient") Patient patient, BindingResult result){
        if (patient.getPatientId() == null) {
            patientService.addPatient(patient);
            patient.setPatientId(patient.getPatientId());
            Admission admission = new Admission();
            admission.setPatient(patient);
            admission.setAdmissionDate(new Date());
            admissionService.addAdmission(admission);
        }
        return "admission";
        
    }
}
