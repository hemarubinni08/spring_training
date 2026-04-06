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
    public String userRegister(Model model, @ModelAttribute UserDto userDto) {
        boolean state = userService.createUser(userDto);
        String status = "";
        if (state) {
            status = "Success";
        } else {
            status = "Email already exist";
        }
        model.addAttribute("state", status);
        return "success";
    }

    @GetMapping("/register")
    public String userRegister(Model model) {
        model.addAttribute("userDto", new UserDto());
        return "register";
    }

    @PostMapping("/registerJdbc")
    public String userRegisterJdbc(Model model, @ModelAttribute UserDto userDto) {
        boolean state = userService.createUserJdbc(userDto);
        String status = "";
        if (state) {
            status = "Success";
        } else {
            status = "Email already exist";
        }
        model.addAttribute("state", status);
        return "success";
    }

    @GetMapping("/registerJdbc")
    public String userRegisterJdbc(Model model) {
        model.addAttribute("userDto", new UserDto());
        return "registerJdbc";
    }
}
