package com.ust.pos.web.controller;

import com.ust.pos.dto.UserDto;
import com.ust.pos.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/user")
public class UserController {

    private final UserService userService;

    public UserController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping("/login")
    public String login() {
        return "login";
    }

    @GetMapping("/register")
    public String showRegister(Model model) {
        model.addAttribute("user", new UserDto());
        return "register";
    }

    @PostMapping("/register")
    public String registerUser(@ModelAttribute("user") UserDto userDto,
                               Model model) {

        if (userService.emailExists(userDto.getEmail())) {
            model.addAttribute("errorMessage",
                    "Email already exists. Please use a different email.");
            model.addAttribute("user", userDto);
            return "register";
        }

        UserDto savedUser = userService.createUser(userDto);

        model.addAttribute("user", savedUser);
        return "success";
    }

    @GetMapping("/forgotpassword")
    public String forgotPassword() {
        return "forgotpassword";
    }
}