package com.zahangir.controller;

import com.zahangir.model.Admission;
import com.zahangir.model.Patient;
import com.zahangir.service.AdmissionService;
import com.zahangir.service.IndoorService;
import com.zahangir.service.OutdoorService;
import com.zahangir.service.PatientService;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class PatientController {

    @Autowired
    PatientService patientService;

    @Autowired
    AdmissionService admissionService;

    @Autowired
    IndoorService indoorService;

    @Autowired
    OutdoorService outdoorService;

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String addPatient(@ModelAttribute("patient") Patient patient, BindingResult result) {
        return "addpatient";
    }

    @RequestMapping(value = "/admit", method = RequestMethod.POST)
    public String addAdmission(@Valid @ModelAttribute("patient") Patient patient, BindingResult result, ModelMap map) {
        if (result.hasErrors()) {
            return "addpatient";

        } else {
            patientService.addPatient(patient);
            patient.setPatientId(patient.getPatientId());
            Admission admission = new Admission();
            admission.setPatient(patient);
            admission.setAdmissionDate(new Date());
            admissionService.addAdmission(admission);
            return "admission";
        }
    }

    @RequestMapping(value = "/allpatient", method = RequestMethod.GET)
    public String listPatient(Map<String, Object> map) {
        map.put("patient", new Patient());
        map.put("patientList", patientService.patientList());
        return "listpatient";
    }

    @RequestMapping(value = "/delete/{pid}")
    public String deleteProduct(@PathVariable("pid") Integer pid) {
        if (indoorService.getIndoorByPatientId(pid) != null) {
            System.out.println("Hello i am here");
            indoorService.deleteIndoorByPatientId(pid);
        } else {
            System.out.println("Hello i am here");
            outdoorService.deleteOutdoorByPatientId(pid);
        }
        admissionService.deleteAdmissionByPatientId(pid);
        patientService.removePatientById(pid);
        return "redirect:/allpatient";
    }

    @ModelAttribute("ageList")
    public Map<Integer, Integer> getRoleList() {
        Map<Integer, Integer> ageList = new HashMap<>();
        for (int i = 1; i < 81; i++) {
            ageList.put(i, i);
        }

        return ageList;
    }
}
