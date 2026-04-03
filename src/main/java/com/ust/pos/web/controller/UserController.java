package com.ust.pos.web.controller;

import com.ust.pos.dto.UserDto;
import com.ust.pos.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserService userService;

    @RequestMapping("/login")
    public String login(Model model) {
        model.addAttribute("name" , "Navaneeth");
        return "login";

    }

    @RequestMapping("/register")
    public String userRegister(Model model) {
        model.addAttribute("name" , "Navaneeth");
        return "register";
    }

    @RequestMapping("/forgotpassword")
    public String forgotPassword(Model model) {
        model.addAttribute("name" , "Navaneeth");
        return "forgotpassword";

    }

    @GetMapping("/getById")
    public String getById(Model model, @RequestParam Long id){
        UserDto userDto = userService.getById(id);
        model.addAttribute("userDto",userDto);
        return "user";
    }

}
