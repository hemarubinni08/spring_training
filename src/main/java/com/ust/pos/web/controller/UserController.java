package com.ust.pos.web.controller;

import com.ust.pos.dto.UserDto;
import com.ust.pos.service.Impl.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;


@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserService userService;

    @GetMapping("/register")
    public String userRegister() {
        return "register";
    }

    @PostMapping("/register")
    public String userRegister(Model model, @ModelAttribute UserDto userDto) {
        UserDto resultDto = userService.createUser(userDto);

        model.addAttribute("status", resultDto.getMessage());

        return "success";
    }

    @GetMapping("/registerJdbc")
    public String userRegisterJdbc(Model model) {
        model.addAttribute("userDto", new UserDto());
        return "registerJdbc";
    }

    @PostMapping("/registerJdbc")
    public String userRegisterJdbc(Model model, @ModelAttribute UserDto userDto) {
        UserDto resultDto = userService.createUserJdbc(userDto);
        model.addAttribute("status", resultDto.getMessage());
        return "success";
    }
}
