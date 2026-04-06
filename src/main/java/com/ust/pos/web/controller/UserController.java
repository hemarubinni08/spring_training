package com.ust.pos.web.controller;

import com.ust.pos.dto.UserDto;
import com.ust.pos.service.impl.UserService;
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

        if (userService.emailExists(userDto.getEmail().toLowerCase())) {
            model.addAttribute("errorMessage",
                    "This email is already registered. Please try with a different email address.");
            return "register";
        }

        boolean flag = userService.createUser(userDto);

        if (flag) {
            return "redirect:/user/success";
        } else {
            model.addAttribute("errorMessage", "Registration failed. Please try again.");
            return "register";
        }
    }

    @GetMapping("/register")
    public String register(Model model) {
        model.addAttribute("userDto", new UserDto());
        return "register";
    }

    @PostMapping("/registerjdbc")
    public String userRegisterJdbc(Model model, @ModelAttribute UserDto userDto) {

        if (userService.emailExistsJdbc(userDto.getEmail())) {
            model.addAttribute("errorMessage",
                    "This email is already registered. Please try with a different email address.");
            return "registerjdbc";
        }

        boolean flag = userService.createUserJdbc(userDto);

        if (flag) {

            return "redirect:/user/success";
        } else {
            model.addAttribute("errorMessage", "Registration failed. Please try again.");
            return "registerjdbc";
        }
    }

    @GetMapping("/registerjdbc")
    public String registerJdbc(Model model) {
        model.addAttribute("userDto", new UserDto());
        return "registerjdbc";
    }


    @GetMapping("/success")
    public String successPage() {
        return "success";
    }
}