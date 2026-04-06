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

    @PostMapping("/register")
    public String userRegister(Model model, @ModelAttribute UserDto userDto) {
        UserDto userDto1 = userService.saveData(userDto);
        if (userDto1.isSuccess()) {
            model.addAttribute("message", "Success ");
        } else {
            model.addAttribute("message", "! Email already exists");
        }
        return "success";
    }

    @GetMapping("/register")
    public String userRegister(Model model) {
        model.addAttribute("name", "Navaneeth");
        return "register";
    }

    @PostMapping("/registerJdbc")
    public String userRegisterJdbc(Model model, @ModelAttribute UserDto userDto) {
        boolean state = userService.saveDataJdbc(userDto);
        if (state) {
            return "Success";
        } else {
            return "! Email already exists";
        }
    }

    @GetMapping("/registerJdbc")
    public String userRegisterJdbc(Model model) {
        model.addAttribute("name", "Navaneeth");
        return "register";
    }
}
