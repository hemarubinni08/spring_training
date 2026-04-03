package com.ust.pos.web.controller;

import com.ust.pos.dto.UserDto;
import com.ust.pos.model.User;
import com.ust.pos.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;

    @GetMapping("/getById")
    public String getById(Model model, @RequestParam Long id) {
        UserDto userDto = userService.getById(id);
        model.addAttribute("user" , userDto);
        return "login";
    }

    @PostMapping("/register")
    public String userRegister(Model model) {
        model.addAttribute("name" , "Rohit");
        return "register";
    }

    @RequestMapping("/forgotpassword")
    public String forgotPassword(Model model) {
        model.addAttribute("name" , "Rohit");
        return "forgotpassword";

    }
}
