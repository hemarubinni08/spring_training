package com.ust.pos.web.controller;

import com.ust.pos.dto.UserDto;
import com.ust.pos.model.User;
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

    @GetMapping("/login")
    public String login(Model model) {
        return "login";
    }

    @PostMapping("/login")
    public String login(Model model, @ModelAttribute UserDto userDto) {
        boolean loginSuccess = userService.login(userDto);
        if (!loginSuccess) {
            model.addAttribute("message", "Wrong credentials");
            return "login";
        } else {
            model.addAttribute("email", userDto.getEmail());
            return "index";
        }
    }

    @GetMapping("/register")
    public String register(Model model) {
        return "register";
    }

    @PostMapping("/register")
    public String register(Model model, @ModelAttribute UserDto userDto) {
        boolean registerSuccess = userService.register(userDto);
        if (!registerSuccess) {
            model.addAttribute("statusMessage", userDto.getEmail() + " already exists. Try with a different email.");
        } else {
            model.addAttribute("statusMessage", userDto.getEmail() + " registration success");
        }
        return "registerstatus";
    }

    @GetMapping("/index")
    public String index(Model model) {
        return "index";
    }

    @RequestMapping("/forgotpassword")
    public String forgotPassword(Model model) {
        model.addAttribute("name", "Aron");
        return "forgotpassword";
    }
}
