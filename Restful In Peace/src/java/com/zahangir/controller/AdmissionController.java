
package com.zahangir.controller;

import com.zahangir.model.Admission;
import com.zahangir.model.Indoor;
import com.zahangir.model.Outdoor;
import com.zahangir.service.AdmissionService;
import com.zahangir.service.IndoorService;
import com.zahangir.service.OutdoorService;
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

    @RequestMapping(value = "/indoororoutdoor", method = RequestMethod.GET)
    public String indoorOrOutdoor(@ModelAttribute("indoor") Indoor indoor, BindingResult result) {
        return "indoororoutdoor";
    }

    @RequestMapping(value = "/selection", method = RequestMethod.POST)
    public String addIndoorPatient(@ModelAttribute("indoor") Indoor indoor, BindingResult result) {
        Admission admission = admissionService.lastAdmission();
        //admission.setAdmissionId(admission.getAdmissionId());
        if (indoor.getIndoorDepartment() != null) {//This if block is ok
//            System.out.println("Hello I am here...");
            indoor.setAdmission(admission);
            indoor.setIndoorDepartment(indoor.getIndoorDepartment());
            indoorService.addIndoor(indoor);
            return "welcomeindoor";
        } else {
            Outdoor outdoor = new Outdoor();
//            System.out.println("Hello I am out...");
            outdoor.setAdmission(admission);
//            System.out.println(admission.getAdmissionId());//ok
//            System.out.println("Hello I am out...");//ok
            outdoorService.addOutdoor(outdoor);//solved
            return "welcomeoutdoor";
        }

    }
}
