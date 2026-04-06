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
        UserDto userDto1 = userService.saveUser(userDto);
        if (userDto1.isSuccess()) {
            model.addAttribute("message", "success");
        } else {
            model.addAttribute("message", "Email Already Exists");
        }
        return "success";
    }

    @GetMapping("/register")
    public String userRegister(Model model) {
        model.addAttribute("name", "varsha");
        return "register";
    }

    @PostMapping("/registerJdbc")
    public String userRegisterJdbc(Model model, @ModelAttribute UserDto userDto) {
        boolean check = userService.saveUserJdbc(userDto);
        if (check) {
            return "success";
        } else {
            return "Email Already Exits ";
        }

    }

    @GetMapping("/registerJdbc")
    public String userRegisterJdbc1(Model model) {
        model.addAttribute("name", "varsha");
        return "register";
    }

}