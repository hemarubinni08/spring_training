package com.ust.pos.web.controller;


import com.ust.pos.dto.UserDto;
import com.ust.pos.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserService userService;

    @RequestMapping("/register")
    public String userRegister(Model model) {
        model.addAttribute("name", "Rohit");
        return "register";
    }

    @PostMapping("/register")
    public String register(Model model, @ModelAttribute UserDto userDto) {

        try {
            userService.register(userDto);
            return "success";
        } catch (RuntimeException e) {
            model.addAttribute("error", e.getMessage());
            return "register";
        }
    }

    @GetMapping("/register")
    public String register(Model model) {
        model.addAttribute("name", "Rohit");
        return "register";
    }


    @PostMapping("/registerJdbc")
    public String registerJdbc(Model model, @ModelAttribute UserDto userDto) {

        try {
            userService.register(userDto);
            return "success";
        } catch (RuntimeException e) {
            model.addAttribute("error", e.getMessage());
            return "registerJdbc";
        }
    }

    @GetMapping("/registerJdbc")
    public String registerJdbc(Model model) {
        model.addAttribute("name", "Rohit");
        return "registerJdbc";
    }
}
