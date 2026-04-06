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

    @PostMapping("/register")
    public String userRegister(Model model, @ModelAttribute UserDto userDto) {
        UserDto userDto1 = userService.saveData(userDto);
        if (userDto1.isSuccess()) {
            model.addAttribute("message", "Registration Successful");
        } else {
            model.addAttribute("message", "User Already Excists");
        }
        return "success";
    }

    @GetMapping("/register")
    public String register(Model model, @ModelAttribute UserDto userDto) {
        model.addAttribute("name", "Rohit");
        return "register";
    }

    @PostMapping("/registerJdbc")
    public String userRegisterJdbc(Model model, @ModelAttribute UserDto userDto) {
        UserDto userDto1 = userService.registerJdbc(userDto);
        if (userDto1.isSuccess()) {
            model.addAttribute("message", "Registration Successful");
        } else {
            model.addAttribute("message", "User Already Excists");
        }
        return "success";
    }

    @GetMapping("/registerJdbc")
    public String registerJdbc(Model model, @ModelAttribute UserDto userDto) {
        model.addAttribute("name", "Rohit");
        return "register";
    }

    @RequestMapping("/forgotpassword")
    public String forgotPassword(Model model) {
        model.addAttribute("name", "Rohit");
        return "forgotpassword";
    }
}
