package com.ust.pos.web.controller;

import com.ust.pos.dao.UserDao;
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
    UserDao userDao;
    @Autowired
    private UserService userService;

    @PostMapping("/register")
    public String userRegister(Model model, @ModelAttribute UserDto userDto) {
        if (userService.register(userDto)) {
            model.addAttribute("message", "Registration successful");
        } else {
            model.addAttribute("message", "Registration failed");
        }
        return "success";
    }

    @GetMapping("/register")
    public String getUserRegister(Model model, @ModelAttribute UserDto userDto) {
        return "register";
    }

    @PostMapping("/registerJdbc")
    public String userRegisterJdbc(Model model, @ModelAttribute UserDto userDto) {
        if (userService.registerJdbc(userDto)) {
            model.addAttribute("message", "Registration successful");
        } else {
            model.addAttribute("message", "Registration failed");
        }
        return "success";
    }

    @GetMapping("/registerJdbc")
    public String getUserRegisterJdbc(Model model, @ModelAttribute UserDto userDto) {
        return "registerJdbc";
    }
}
