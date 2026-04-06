package com.ust.pos.web.controller;

import com.ust.pos.dto.UserDto;
import com.ust.pos.model.User;
import com.ust.pos.service.impl.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;

    @PostMapping("/register")
    public String userRegister(Model model, @ModelAttribute UserDto userDto) {
        boolean flag = userService.putInformation(userDto);
        if (flag) {
            model.addAttribute("message", "Sucess");
        } else {
            model.addAttribute("message", "Failed");
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
        boolean flag = userService.putInformationJdbc(userDto);
        if (flag) {
            model.addAttribute("message", "Sucess");
        } else {
            model.addAttribute("message", "Failed");
        }
        return "success";
    }

    @GetMapping("/registerJdbc")
    public String registerJdbc(Model model, @ModelAttribute UserDto userDto) {
        model.addAttribute("name", "Rohit");
        return "registerJdbc";
    }
}
