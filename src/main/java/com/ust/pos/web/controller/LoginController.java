package com.ust.pos.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

@Controller
public class LoginController {
    @GetMapping("/login")
    public String login(Model model){
        model.addAttribute("userDto","Welcome to login page");
        return "login";
    }
}
