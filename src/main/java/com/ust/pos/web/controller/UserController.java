package com.ust.pos.web.controller;

import com.ust.pos.dto.UserDto;
import com.ust.pos.service.impl.UserService;
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


    @PostMapping("register")
    public String doregister(Model model, @ModelAttribute UserDto userDto) {
        boolean isSuccess = userService.register(userDto);
        model.addAttribute("userDto", userDto);

        if (isSuccess) {
            model.addAttribute("message", "Registration success");
        } else {
            model.addAttribute("message", "Registration failed");
        }
        return "success";
    }

    @GetMapping("/register")
    public String register(Model model, @ModelAttribute UserDto userDto) {
        model.addAttribute("name", "deepak");
        return "register";
    }


    @PostMapping("/registerJdbc")
    public String registerJdbc(Model model, @ModelAttribute UserDto userDto) {
        boolean isSuccess = userService.register(userDto);
        model.addAttribute("userDto", userDto);

        if (isSuccess) {
            model.addAttribute("message", "Registration success");
        } else {
            model.addAttribute("message", "Registration failed");
        }
        return "success";
    }

    @GetMapping("/registerJdbc")
    public String registerJdbc(Model model) {
        model.addAttribute("name", "deepak");
        return "registerJdbc";
    }
}
