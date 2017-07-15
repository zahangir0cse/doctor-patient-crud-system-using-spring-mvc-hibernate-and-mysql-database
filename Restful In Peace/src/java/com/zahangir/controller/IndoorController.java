
package com.zahangir.controller;

import com.zahangir.model.Admission;
import com.zahangir.model.Indoor;
import com.zahangir.service.AdmissionService;
import com.zahangir.service.IndoorService;
import com.zahangir.service.PatientService;
import com.zahangir.service.SpecialistService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("indoor")
public class IndoorController {
    
    @Autowired
    IndoorService indoorService;
    
    @Autowired
    SpecialistService specialistService;
    
    @Autowired
    PatientService patientService;
    
    @Autowired
    AdmissionService admissionService;
    
    @RequestMapping("/your_info")
    public String showIndoorPatientInfo(ModelMap map){
        Indoor indoor = indoorService.lastIndoor();
        Admission admission = admissionService.getAdmissionById(indoor.getAdmission().getAdmissionId());
        String patientName = patientService.getPatientById(admission.getPatient().getPatientId()).getPatientName();
        String specialistName = specialistService.getSpecialistById(indoor.getSpecialist().getSpecialistId()).getSpecialistName();
        String specialty = specialistService.getSpecialistById(indoor.getSpecialist().getSpecialistId()).getSpecialistSpeialty();
        Integer serialNo = indoor.getIndoorId();
        String indoorType = indoor.getIndoorType();
        
        map.addAttribute("pname", patientName);
        map.addAttribute("sname", specialistName);
        map.addAttribute("specialty", specialty);
        map.addAttribute("serial", serialNo);
        map.addAttribute("type", indoorType);
        
        return "indoorinfo";
    }
}
