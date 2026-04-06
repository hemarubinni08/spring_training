package com.ust.pos.web.controller;

import com.ust.pos.dto.UserDto;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import com.ust.pos.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;

    @PostMapping("/register_jdbc")
    public String userRegister_Jdbc(@ModelAttribute UserDto userDto, Model model) {

        model.addAttribute("email", userDto.getEmail());

        if (userService.saveAUserJdbc(userDto)) {
            return "success";
        }

        return "failed";
    }

    @GetMapping("/register_jdbc")
    public String registerPageJdbc(Model model) {

        model.addAttribute("userDto", new UserDto());

        return "registerjdbc";

    }

    @PostMapping("/register")
    public String userRegister(@ModelAttribute UserDto userDto, Model model) {

        model.addAttribute("email", userDto.getEmail());

        if(userService.saveAUSer(userDto)){
            return "success";
        }

        return "failed";

    }

    @GetMapping("/register")
    public String registerPage(Model model) {

        model.addAttribute("userDto", new UserDto());

        return "register";

    }
}
