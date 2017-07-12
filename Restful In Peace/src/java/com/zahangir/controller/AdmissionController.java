package com.zahangir.controller;

import com.zahangir.model.Admission;
import com.zahangir.model.Indoor;
import com.zahangir.model.Outdoor;
import com.zahangir.service.AdmissionService;
import com.zahangir.service.IndoorService;
import com.zahangir.service.MiService;
import com.zahangir.service.OutdoorService;
import com.zahangir.service.SpecialistService;
import java.util.HashMap;
import java.util.Map;
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
@Controller
@RequestMapping("admission")
public class AdmissionController {

    @Autowired
    IndoorService indoorService;

    @Autowired
    OutdoorService outdoorService;

    @Autowired
    AdmissionService admissionService;

    @Autowired
    SpecialistService specialistService;

    @Autowired
    MiService miService;

    @RequestMapping(value = "/indoor", method = RequestMethod.GET)
    public String indoor(@ModelAttribute("indoor") Indoor indoor, BindingResult result) {
        return "indoor";
    }

    @RequestMapping(value = "/outdoor", method = RequestMethod.GET)
    public String Outdoor(@ModelAttribute("outdoor") Outdoor outdoor, BindingResult result) {
        return "outdoor";
    }

    @RequestMapping(value = "/goindoor", method = RequestMethod.POST)
    public String addIndoorPatient(@ModelAttribute("indoor") Indoor indoor, BindingResult result) {
        Admission admission = admissionService.lastAdmission();
//            System.out.println("Hello I am here...");
        indoor.setSpecialist(specialistService.getSpecialistByDepartment(indoor.getIndoorDepartment()));
        indoor.setAdmission(admission);
        //indoor.setIndoorDepartment(indoor.getIndoorDepartment());
        indoorService.addIndoor(indoor);
        return "welcomeindoor";

    }

    @RequestMapping(value = "/gooutdoor", method = RequestMethod.POST)
    public String addOutdoorPatient(@ModelAttribute("outdoor") Outdoor outdoor, BindingResult result) {
        Admission admission = admissionService.lastAdmission();
        outdoor.setAdmission(admission);
        System.out.println(miService.getMiByTime(outdoor.getOutdoorTime()).getMiName());
        outdoor.setMi(miService.getMiByTime(outdoor.getOutdoorTime()));
//            System.out.println(admission.getAdmissionId());//ok
//            System.out.println("Hello I am out...");//ok
        outdoorService.addOutdoor(outdoor);//solved
        return "welcomeoutdoor";
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
}
