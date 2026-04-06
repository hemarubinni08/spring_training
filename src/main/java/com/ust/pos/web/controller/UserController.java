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
    public UserService userService;

    @PostMapping("/register")
    public String userRegister(Model model, @ModelAttribute UserDto userDto) {

        UserDto registeredUser = userService.register(userDto);

        if (registeredUser == null) {
            model.addAttribute("error", "Failed to register: Email already exists");
            return "register";
        }

        model.addAttribute("name", "Mamtha");
        model.addAttribute("message", "Registration successful");
        return "success";
    }

    @GetMapping("/register")
    public String douserRegister(Model model, @ModelAttribute UserDto userDto) {
        model.addAttribute("name", "Mamtha");
        return "register";
    }

    @PostMapping("/registerJdbc")
    public String userRegisterJdbc(Model model, @ModelAttribute UserDto userDto) {

        boolean isRegistered = userService.registerJdbc(userDto);

        if (!isRegistered) {
            model.addAttribute("error", "Failed to register: Email already exists");
            return "registerJdbc";
        }

        model.addAttribute("name", "Mamtha");
        model.addAttribute("message", "Registration successful");
        return "success";
    }

    @GetMapping("/registerJdbc")
    public String doUserRegisterJdbc(Model model, @ModelAttribute UserDto userDto) {
        model.addAttribute("name", "Mamtha");
        return "registerJdbc";
    }

}
