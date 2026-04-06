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

    @RequestMapping("/login")
    public String login(Model model) {
        model.addAttribute("name", "Shashi");
        return "login";

    }
//
//    @PostMapping("/register")
//    public String register(Model model, @ModelAttribute UserDto userDto) {
//        boolean flag = userService.register(userDto);
//        if (flag) {
//            model.addAttribute("message", "Success");
//        } else {
//            model.addAttribute("message", "Failure");
//        }
//        return "success";
//    }
//
//    @GetMapping("/register")
//    public String userRegister(Model model, @ModelAttribute UserDto userDto) {
//        model.addAttribute("name", "Shashi");
//        return "register";
//    }


    @GetMapping("/registerjdbc")
    public String registerjdbc(Model model) {
        model.addAttribute("name", "Shashi");
        return "registered";
    }

    @PostMapping("/registerjdbc")
    public String registerjdbc(Model model, @ModelAttribute UserDto userDto) {
        boolean flag = userService.registerjdbc(userDto);
        if (flag) {
            model.addAttribute("message", "Success");
        } else {
            model.addAttribute("message", "Failure");
        }
        return "success";
    }

    @RequestMapping("/forgotpassword")
    public String forgotPassword(Model model) {
        model.addAttribute("name", "Shashi");
        return "forgotpassword";

    }


//    @GetMapping("/all")
//    public List<User> getAllUsers() {
//        return userService.findAll();
//    }
//
//    @GetMapping("/{id}")
//    public UserDto getById(@PathVariable Long id) {
//        return userService.findById(id);
//    }
//
//    @GetMapping("/username/{username}")
//    public UserDto getByUserName(@PathVariable String username) {
//        return userService.findByUserName(username);
//    }
//
//    @PutMapping("/{id}")
//    public UserDto updateUser(@PathVariable Long id, @RequestBody UserDto userDto) {
//        return userService.update(id, userDto);
//    }
//
//    @DeleteMapping("/{id}")
//    public String deleteUser(@PathVariable Long id) {
//        userService.deleteById(id);
//        return "Deleted successfully";
//    }
}