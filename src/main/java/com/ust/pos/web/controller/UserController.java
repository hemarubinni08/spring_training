package com.ust.pos.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/user")
public class UserController {

    @RequestMapping("/login")
    public String login(Model model) {
        model.addAttribute("name" , "Aron");
        return "login";

    }

    @PostMapping("/register")
    public String userRegister(Model model) {
        model.addAttribute("name" , "Aron");
        return "register";
    }

    @RequestMapping("/forgotpassword")
    public String forgotPassword(Model model) {
        model.addAttribute("name" , "Aron");
        return "forgotpassword";
    }
}
