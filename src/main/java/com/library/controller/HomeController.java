package com.library.controller;

import com.library.model.UserModel;
import com.library.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

    @Autowired
    private UserService userService;

    @GetMapping(value = "/home")
    public String login() {
        String username = SecurityContextHolder.getContext().getAuthentication().getName();
        UserModel userDetails = userService.findByUsername(username).get();
        String role = userDetails.getRole();
        if (role.matches("Admin")){
            return "redirect:/admin";
        }
        else if(role.matches("Member")){
            return "redirect:/user";
        }
        return "redirect:/login";
    }

}
