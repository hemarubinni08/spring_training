package com.ust.pos.web.controller;

import com.ust.pos.dto.UserDto;
import com.ust.pos.model.User;
import com.ust.pos.model.UserRepository;
import com.ust.pos.service.impl.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/user")

public class UserController {

    @Autowired
    UserService userService;

    @GetMapping("/login")
    public String login(Model model) {
        User user=new User();
        user.setId(123);
        user.setName("navya");
        model.addAttribute("name", "navya");

        return "login";
    }

    @PostMapping("register")
    public String register(Model model,@ModelAttribute  UserDto userDto) {
        boolean isSuccess = userService.register(userDto);
        model.addAttribute("userDto", userDto);

        if(isSuccess){
            model.addAttribute("message", "Registration success");
        }else {
            model.addAttribute("message", "Registration failed");
        }
        return "success";
    }

    @GetMapping("register")
    public String register(Model model) {
        model.addAttribute("name", "navya");
        return "register";
    }

    @GetMapping("findByUser")
    public String findByUser(Model model, @RequestParam String user) {
        UserDto userDto = userService.findByUserName(user);
        model.addAttribute("user", userDto);
        return "register";
    }

    @GetMapping("/delete")
    public String delete(Model model, @RequestParam Long id) {
        userService.deleteById(id);
        model.addAttribute("message", "Deleted successfully");
        return "register";
    }

    @GetMapping("/update")
    public String delete(Model model, UserDto userDto) {
        userService.update(userDto);
        model.addAttribute("message", "Deleted successfully");
        return "register";
    }

    @PostMapping("/forgotPassword")
    public String forgotPassword(Model model) {
        model.addAttribute("name", "navya");
        return "forgotpassword";
    }

}
