/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.zahangir.controller;

import com.zahangir.model.Mi;
import com.zahangir.model.Outdoor;
import com.zahangir.model.Specialist;
import com.zahangir.model.User;
import com.zahangir.service.MiService;
import com.zahangir.service.OutdoorService;
import com.zahangir.service.SpecialistService;
import com.zahangir.service.UserService;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author Zahangir Alam
 */
@Controller
public class UserController {

    @Autowired
    UserService userService;

    @Autowired
    SpecialistService specialistService;

    @Autowired
    MiService miService;

    @Autowired
    OutdoorService outdoorService;

    @RequestMapping(value = "/user", method = RequestMethod.GET)
    public String userRegister(@ModelAttribute("user") User user, BindingResult result) {
        return "adduser";
    }

    @RequestMapping(value = "/user/regsuccess", method = RequestMethod.POST)
    public String successRegistration(@Valid @ModelAttribute("user") User user, BindingResult result) {
        if (result.hasErrors()) {
            return "adduser";
        } else {
            userService.addUser(user);
            return "successreg";
        }

    }

    @RequestMapping(value = "/user/login", method = RequestMethod.GET)
    public String addAdmission(@ModelAttribute("user") User user) {
        return "login";
    }

    @ModelAttribute("roleList")
    public Map<String, String> getRoleList() {
        Map<String, String> roleList = new HashMap<>();
        roleList.put("admin", "admin");
        roleList.put("specialist", "specialist");
        roleList.put("mi", "mi");
        return roleList;
    }

    @RequestMapping(value = "/user/check", method = RequestMethod.POST)
    public String adminView(ModelMap map, @RequestParam("userEmail") String userEmail, @RequestParam("userPassword") String userPassword, HttpServletRequest request) {
        if (userService.getUserByEmailAndPass(userEmail, userPassword) && userService.isAdmin(userEmail) != null) {
            User loginUser = userService.getUserByEmail(userEmail);
            map.addAttribute("hello", "Hello" + loginUser.getUserName());
            request.getSession(true).setAttribute("email", userEmail);
            System.out.println(loginUser.getUserRole());
            return "admin";
        } else if (userService.getUserByEmailAndPass(userEmail, userPassword) && specialistService.getSpecialistByEmail(userEmail) != null) {
            User loginUser = userService.getUserByEmail(userEmail);
            map.addAttribute("hello", "Hello" + loginUser.getUserName());
            request.getSession(true).setAttribute("email", userEmail);
            System.out.println(loginUser.getUserRole());
            Specialist s = specialistService.getSpecialistByEmail(userEmail);
            map.put("id", s.getSpecialistId());
            map.put("name", s.getSpecialistName());
            map.put("email", s.getSpecialistEmail());
            map.put("contact", s.getSpecialistContactNo());
            map.put("specialty", s.getSpecialistSpeialty());
            map.put("qualification", s.getSpecialistQualification());
            map.put("address", s.getSpecialistAddress());
            return "specialistview";
        } else if (userService.getUserByEmailAndPass(userEmail, userPassword) && miService.getMiByEmail(userEmail) != null) {
            User loginUser = userService.getUserByEmail(userEmail);
            map.addAttribute("hello", "Hello" + loginUser.getUserName());
            request.getSession(true).setAttribute("email", userEmail);
            System.out.println(loginUser.getUserRole());
            Mi m = miService.getMiByEmail(userEmail);
            //List<Outdoor> list = outdoorService.getPatientByMiId(m.getMiId());
            map.put("id", m.getMiId());
            map.put("name", m.getMiName());
            map.put("email", m.getMiEmail());
            map.put("contact", m.getMiContactNo());
            map.put("time", m.getMiTime());
            map.put("qualification", m.getMiQualification());
            map.put("address", m.getMiAddress());
            map.put("outdoor", new Outdoor());
            //map.put("listmi", list);
            return "miedit";
        } else {
            map.addAttribute("incorrect", "Incorrect username or password");
            map.addAttribute("reg", "Yet not registered.. please <a href='/Restful_In_Peace/user'> register here</a>");
            return "redirect:/user/login";
        }

    }

    @RequestMapping("/user/logout")
    public String logout(HttpServletRequest request) {
        request.getSession().invalidate();
        return "redirect:/user/login";
    }
}
