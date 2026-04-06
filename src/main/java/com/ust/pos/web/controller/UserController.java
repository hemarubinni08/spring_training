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
    public String register(Model model, @ModelAttribute UserDto userDto) {
        String message = userService.update(userDto);
        model.addAttribute("message", message);
        return "success";
    }

    @GetMapping("/register")
    public String doRegister(Model model, @ModelAttribute UserDto userDto) {
        return "register";
    }

    @PostMapping("/registerJdbc")
    public String registerJdbc(Model model, @ModelAttribute UserDto userDto) {
        String message = userService.registerUsingJdbc(userDto);
        model.addAttribute("message", message);
        return "success";
    }

    @GetMapping("/registerJdbc")
    public String doRegisterJdbc(Model model, @ModelAttribute UserDto userDto) {
        return "registerJdbc";
    }
}