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
    public UserService userService;

    @GetMapping("/register")
    public String showRegisterPage(Model model, @ModelAttribute UserDto userDto) {
        model.addAttribute("name", "Nagarajan");
        return "register";
    }

    @PostMapping("/register")
    public String userRegister(Model model, @ModelAttribute UserDto userDto) {
        System.out.println("=== REGISTER CALLED ===");
        System.out.println("Name: " + userDto.getName());
        System.out.println("Email: " + userDto.getEmail());

        try {
            userService.register(userDto);
            System.out.println("=== REGISTER SUCCESS ===");
            model.addAttribute("status", "success");
            model.addAttribute("message", "Account Created Successfully!");
            model.addAttribute("subMessage", "Welcome " + userDto.getName() + "! You can now login.");

        } catch (RuntimeException e) {
            System.out.println("=== REGISTER ERROR: " + e.getMessage() + " ===");
            model.addAttribute("status", "error");
            model.addAttribute("message", "Registration Failed!");
            model.addAttribute("subMessage", e.getMessage());
        }

        System.out.println("Status in model: " + model.getAttribute("status"));
        return "status";
    }

    @GetMapping("/registerJdbc")
    public String showRegisterPageJdbc(Model model, @ModelAttribute UserDto userDto) {
        model.addAttribute("name", "Nagarajan");
        return "registerJdbc";
    }

    @PostMapping("/registerJdbc")
    public String userRegisterJdbc(Model model, @ModelAttribute UserDto userDto) {
        System.out.println("=== REGISTER CALLED ===");
        System.out.println("Name: " + userDto.getName());
        System.out.println("Email: " + userDto.getEmail());

        try {
            userService.registerUsingJdbc(userDto);
            System.out.println("=== REGISTER SUCCESS ===");
            model.addAttribute("status", "success");
            model.addAttribute("message", "Account Created Successfully!");
            model.addAttribute("subMessage", "Welcome " + userDto.getName() + "! You can now login.");

        } catch (RuntimeException e) {
            System.out.println("=== REGISTER ERROR: " + e.getMessage() + " ===");
            model.addAttribute("status", "error");
            model.addAttribute("message", "Registration Failed!");
            model.addAttribute("subMessage", e.getMessage());
        }
        System.out.println("Status in model: " + model.getAttribute("status"));
        return "status";
    }
}








