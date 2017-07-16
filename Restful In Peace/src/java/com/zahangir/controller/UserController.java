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
@RequestMapping(value = "user")
public class UserController {

    @Autowired
    UserService userService;

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String userRegister(@ModelAttribute("user") User user, BindingResult result) {
        return "adduser";
    }
    
    @RequestMapping("/regsuccess")
    public String successRegistration(@Valid @ModelAttribute("user") User user, BindingResult result){
        if (result.hasErrors()) {
            return "adduser";
        } else {
            userService.addUser(user);
            return "successreg";
        }
        
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String addAdmission(@ModelAttribute("user") User user) {
        return "login";
    }

    @ModelAttribute("roleList")
    public Map<String, String> getRoleList() {
        Map<String, String> roleList = new HashMap<>();
        roleList.put("admin", "admin");
        roleList.put("clark", "clerk");
        return roleList;
    }

    @RequestMapping(value = "/check", method = RequestMethod.POST)
    public String adminView(ModelMap map, @RequestParam("userEmail") String userEmail, @RequestParam("userPassword") String userPassword, HttpServletRequest request) {
        if (userService.getUserByEmailAndPass(userEmail, userPassword)) {
            map.addAttribute("hello", "Hello Admin");
            //User loginUser = userService.getUserByEmail(userEmail);
            request.getSession(true).setAttribute("email", userEmail);
            return "admin";
        }else{
            return "redirect:/user/login";
        }

    }
    
    @RequestMapping("/logout")
    public String logout(HttpServletRequest request){
        request.getSession().invalidate();
        return "redirect:/user/login";
    }
}
