package com.ust.pos.web.controller;

import com.ust.pos.service.UserService;
import com.ust.pos.service.impl.UserServiceImpl;
import jakarta.annotation.Resource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/user")
public class UserController {

 @Resource
    UserService userService;

    @RequestMapping("/login")
    public String login(Model model) {
        userService.findAll();
        model.addAttribute("name" , "Rohit");
        return "login.jsp";

    }

    @RequestMapping("/register")
    public String userRegister(Model model) {
        model.addAttribute("name" , "Rohit");
        return "register.jsp";
    }

    @RequestMapping("/forgotpassword")
    public String forgotPassword(Model model) {
        model.addAttribute("name" , "Rohit");
        return "forgotpassword.jsp";

    }
}
