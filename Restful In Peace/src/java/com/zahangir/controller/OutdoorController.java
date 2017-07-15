package com.zahangir.controller;

import com.zahangir.model.Admission;
import com.zahangir.model.Mi;
import com.zahangir.model.Outdoor;
import com.zahangir.service.AdmissionService;
import com.zahangir.service.MiService;
import com.zahangir.service.OutdoorService;
import com.zahangir.service.PatientService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("outdoor")
public class OutdoorController {

    @Autowired
    OutdoorService outdoorService;

    @Autowired
    MiService miService;

    @Autowired
    PatientService patientService;

    @Autowired
    AdmissionService admissionService;

    @RequestMapping("/your_info")
    public String showOutdoorPatientInfo(ModelMap map) {
        Outdoor outdoor = outdoorService.lastOutdoor();
        Admission admission = admissionService.getAdmissionById(outdoor.getAdmission().getAdmissionId());
        String patientName = patientService.getPatientById(admission.getPatient().getPatientId()).getPatientName();
        Mi mi = miService.getMiById(outdoor.getMi().getMiId());
        String miName = mi.getMiName();
        String time = mi.getMiTime();
        Integer serialNo = outdoor.getOutdoorId();

        map.addAttribute("pname", patientName);
        map.addAttribute("mname", miName);
        map.addAttribute("time", time);
        map.addAttribute("serial", serialNo);
        return "outdoorinfo";
    }
}
