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
    public String userRegister(Model model, @ModelAttribute UserDto userDto) {
        model.addAttribute("userDto", new UserDto());
        return "register";
    }

    @PostMapping("/register")
    public String userRegisterdo(Model model, @ModelAttribute UserDto userDto) {
        model.addAttribute("message", "success  " + userDto.getEmail());
        if (userService.UpdateByUserName(userDto)) {

            return "success";
        } else {
            model.addAttribute("message", "failed  " + userDto.getEmail());
            return "failed";
        }
    }

    @GetMapping("/registerJdbc")
    public String showRegisterJdbc(Model model, @ModelAttribute UserDto userDto) {
        model.addAttribute("userDto", new UserDto());
        return "registerJdbc";
    }

    @PostMapping("/registerJdbc")
    public String processRegisterJdbc(Model model, @ModelAttribute UserDto userDto) {
        model.addAttribute("message", "success  " + userDto.getEmail());
        if (userService.createUserJdbc(userDto)) {

            return "success";
        } else {
            model.addAttribute("message", "failed  " + userDto.getEmail());
            return "failed";
        }
    }
}
