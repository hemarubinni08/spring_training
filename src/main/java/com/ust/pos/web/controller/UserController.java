package com.ust.pos.web.controller;

import com.ust.pos.dto.UserDto;
import com.ust.pos.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller

@RequestMapping("/user")
public class UserController {

    @Autowired
    UserService userService;

    @RequestMapping("/login")
    public String login(Model model) {
        model.addAttribute("name", "Hemanth");
        return "login";

    }

    @PostMapping("/register")

    public String userRegister(Model model, @ModelAttribute UserDto userDto) {
        UserDto result = userService.save(userDto);

        if (!result.isUserSuccess()) {
            model.addAttribute("message", "Username Already Exists");
        } else if (!result.isSuccess()) {
            model.addAttribute("message", "Email Already Exists");
        } else {
            model.addAttribute("message", "Registration Successful");
        }

        return "success";
    }

    @GetMapping("/register")
    public String doRegister(Model model, @ModelAttribute UserDto userDto) {
        model.addAttribute("name", "Hemanth");
        return "register";
    }

    @GetMapping("/registerJdbc")
    public String userRegisterJdbc(Model model, @ModelAttribute UserDto userDto) {
        model.addAttribute("name", "Hemanth");
        return "registerJdbc";
    }

    @PostMapping("/registerJdbc")
    public String userRegisterJdbc1(Model model, @ModelAttribute UserDto userDto) {
        boolean check = userService.createUserJdbc(userDto);

        if (check) {
            model.addAttribute("message", "Successfully registered");
            return "success";
        } else {
            model.addAttribute("message", "Email Already Exists");

            return "success";
        }
    }
}