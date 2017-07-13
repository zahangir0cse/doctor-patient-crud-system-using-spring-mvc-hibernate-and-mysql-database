/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.zahangir.controller;

import com.zahangir.model.User;
import com.zahangir.service.UserService;
import java.util.HashMap;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author Zahangir Alam
 */
@Controller
@RequestMapping(value = "user")
public class UserController {
    
    @Autowired
    UserService userService;

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String userRegister(@ModelAttribute("user") User user, BindingResult result) {
        return "adduser";
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String addAdmission(@ModelAttribute("user") User user, BindingResult result) {
        if (user.getUserId() == null) {
            userService.addUser(user);
        }
        return "login";
    }

    @ModelAttribute("roleList")
    public Map<String, String> getRoleList() {
        Map<String, String> roleList = new HashMap<>();
        roleList.put("admin", "admin");
        roleList.put("clark", "clerk");
        return roleList;
    }

    @RequestMapping("/check")
    public String adminView(ModelMap map) {
        map.addAttribute("hello", "Hello Admin");
        return "admin";
    }
}
