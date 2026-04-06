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
    public String Register(Model model, @ModelAttribute UserDto userDto) {
        Boolean userCheck = userService.save(userDto);
        model.addAttribute("user", userDto);
        if (userCheck) {
            model.addAttribute("message", "Registration Success");
        } else {
            model.addAttribute("message", "Registration Failed");
        }
        return "success";
    }

    @GetMapping("/register")
    public String Register(Model model) {
        model.addAttribute("name", "Chaila shree");
        return "register";
    }

    @GetMapping("/registerJdbc")
    public String RegisterJdbc(Model model) {
        model.addAttribute("name", "Chaila shree");
        return "registerJdbc";
    }

    @PostMapping("/registerJdbc")
    public String RegisterJdbc(Model model, @ModelAttribute UserDto userDto) {
        Boolean userCheck = userService.createUserJdbc(userDto);
        model.addAttribute("user", userDto);
        if (userCheck) {
            model.addAttribute("message", "Registration Success");
        } else {
            model.addAttribute("message", "Registration Failed");
        }
        return "success";
    }
}
