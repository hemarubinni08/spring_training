package com.ust.pos.web.controller;

import com.ust.pos.dto.UserDto;
import com.ust.pos.service.impl.UserServiceImpl;
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
    UserServiceImpl userService;

    @GetMapping("/register")
    public String showRegister(Model model, @ModelAttribute UserDto userDto) {

        model.addAttribute("name", "Bewin");
        return "register";
    }

    @PostMapping("/register")
    public String processRegister(Model model, @ModelAttribute UserDto userDto) {

        String message = userService.update(userDto);
        userService.update(userDto);
        model.addAttribute("message", message);
        return "success";
    }

    @GetMapping("/registerJdbc")
    public String showRegisterJdbc(Model model, @ModelAttribute UserDto userDto) {

        model.addAttribute("name", "Bewin");
        return "registerJdbc";
    }

    @PostMapping("/registerJdbc")
    public String processRegisterJdbc(Model model, @ModelAttribute UserDto userDto) {

        String message = userService.createUserJdbc(userDto);
        userService.update(userDto);
        model.addAttribute("message", message);
        return "success";
    }
}
