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

    // Using JPA Repo
    @GetMapping("/register")
    public String showRegisterPage(Model model) {
        model.addAttribute("userDto", new UserDto());
        return "register";
    }

    @PostMapping("/register")
    public String registerUser(@ModelAttribute("userDto") UserDto userDto, Model model) {
        UserDto resultDto = userService.updateUniqueUser(userDto);
        model.addAttribute("status", resultDto.getMessage());
        model.addAttribute("status2", resultDto.getMessage2());
        model.addAttribute("Colour", resultDto.getColour());
        return "success";
    }

    //Using JDBC
    @GetMapping("/registerJdbc")
    public String registerUserUsingJdbc(Model model) {
        model.addAttribute("userDto", new UserDto());
        return "registerJdbc";
    }

    @PostMapping("/registerJdbc")
    public String registerUserUsingJdbc(
            @ModelAttribute("userDto") UserDto userDto,
            Model model) {
        userService.createUserUsingDao(userDto);
        model.addAttribute("userDto", userDto);
        return "success";
    }
}
