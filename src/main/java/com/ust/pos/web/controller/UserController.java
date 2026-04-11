package com.ust.pos.web.controller;


import com.ust.pos.dto.UserDto;
import com.ust.pos.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

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


    @GetMapping("/usersList")
    public String getUsersJpa(Model model) {
        List<UserDto> users = userService.getAllUsers();
        model.addAttribute("users", users);
        return "usersList";
    }

    @GetMapping("/usersListJdbc")
    public String getUsersJdbc(Model model) {
        List<UserDto> users = userService.getAllUsersJdbc();
        model.addAttribute("users", users);
        return "usersListJdbc";
    }

    @GetMapping("/profileUsers")
    public String profileUsers(Model model, @RequestParam String email) {
        UserDto user = userService.getUserByEmail(email);
        model.addAttribute("user", user);
        return "ProfileUsers";
    }

    @GetMapping("/profileUsersJdbc/{email}")
    public String profileUsersJdbc(Model model, @PathVariable String email) {
        UserDto user = userService.getUserByEmailJdbc(email);
        model.addAttribute("user", user);
        return "ProfileUsersJdbc";
    }

    @GetMapping("/profileUsersById")
    public String profileUsers(Model model, @RequestParam long id) {
        UserDto user = userService.getUserById(id);
        model.addAttribute("user", user);
        return "ProfileUsers";
    }

    @GetMapping("/profileUsersByIdJdbc/{id}")
    public String profileUsersJdbc(Model model, @PathVariable long id) {
        UserDto user = userService.getUserByIdJdbc(id);
        model.addAttribute("user", user);
        return "ProfileUsersJdbc";
    }

    @GetMapping("/deleteemail")
    public String deleteemail(Model model, @RequestParam String email) {
        userService.deleteByEmail(email);
        return "redirect:/user/usersList";
    }
    @GetMapping("/deleteemailJdbc")
    public String deleteemailJdbc(Model model, @RequestParam String email) {
        userService.deleteByEmail(email);
        return "redirect:/user/usersListJdbc";
    }

    @GetMapping("/edit/{id}")
    public String editUser(@PathVariable Long id, Model model) {
        UserDto user = userService.findById(id);
        model.addAttribute("user", user);
        return "edit-user";
    }
    @PostMapping("/update")
    public String updateUser(@ModelAttribute UserDto userDto, Model model) {

        try {
            userService.update(userDto);
            return "redirect:/user/usersList";

        } catch (RuntimeException e) {

            // Send error message
            model.addAttribute("error", e.getMessage());

            // Send back entered data (to prevent clearing)
            model.addAttribute("user", userDto);

            return "edit-user";
        }
    }

}
