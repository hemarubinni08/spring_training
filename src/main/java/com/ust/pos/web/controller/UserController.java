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
    private UserService userService;

    @PostMapping("/register")
    public String register(Model model, @ModelAttribute UserDto userDto) {
        boolean flag = userService.register(userDto);
        if (flag) {
            model.addAttribute("message", "Success");
        } else {
            model.addAttribute("message", "Failure");
        }
        return "success";
    }

    @GetMapping("/register")
    public String userRegister(Model model, @ModelAttribute UserDto userDto) {
        model.addAttribute("name", "Shashi");
        return "register";
    }

    @GetMapping("/registerjdbc")
    public String registerjdbc(Model model) {
        model.addAttribute("name", "Shashi");
        return "registered";
    }

    @PostMapping("/registerjdbc")
    public String registerjdbc(Model model, @ModelAttribute UserDto userDto) {
        boolean flag = userService.saveDataJdbc(userDto);
        if (flag) {
            model.addAttribute("message", "Success");
        } else {
            model.addAttribute("message", "Failure" + userDto.getEmail());
        }
        return "success";
    }
}