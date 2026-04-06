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

    @GetMapping("/register")
    public String register(Model model, @ModelAttribute UserDto userDto) {
        model.addAttribute("name", "Rohit");
        return "register";
    }

    @PostMapping("/register")
    public String doRegister(Model model, @ModelAttribute UserDto userDto) {

        UserDto resultDto = userService.update(userDto);
        model.addAttribute("status", resultDto.getMessage());
        model.addAttribute("colour", resultDto.getColour());
        model.addAttribute("status2", resultDto.getMessage2());

        return "success";
    }

    @GetMapping("/registerJdbc")
    public String registerJdbc(Model model, @ModelAttribute UserDto userDto) {
        model.addAttribute("name", "Rohit");

        return "registerJdbc";
    }

    @PostMapping("/registerJdbc")
    public String doRegisterJdbc(Model model, @ModelAttribute UserDto userDto) {

        UserDto resultDto = userService.createUserUsingJdbc(userDto);
        model.addAttribute("status", resultDto.getMessage());
        model.addAttribute("colour", resultDto.getColour());
        model.addAttribute("status2", resultDto.getMessage2());

        return "success";
    }
}