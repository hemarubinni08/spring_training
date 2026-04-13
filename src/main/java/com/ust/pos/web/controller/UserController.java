package com.ust.pos.web.controller;

import com.ust.pos.dto.RoleDto;
import com.ust.pos.dto.UserDto;
import com.ust.pos.service.RoleService;
import com.ust.pos.service.UserServiceRitu;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.parameters.P;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserServiceRitu userService;

    @Autowired
    private RoleService roleService;

    @GetMapping("/register")
    public String register(Model model, @ModelAttribute UserDto userDto) {
        List<RoleDto> roles=roleService.findAllRoles();
        model.addAttribute("name", "Ritu");
        model.addAttribute("userDto", new UserDto());
        model.addAttribute("role", roles);
        return "register";
    }
    @PostMapping("/register")
    public String userRegister(Model model, @ModelAttribute UserDto userDto) {
        UserDto userDto1 = userService.register(userDto);
        model.addAttribute("user", userDto1);
        if (userDto1.isSuccess()) {
            model.addAttribute("message", "Registeration Successful");
        } else {
            model.addAttribute("message", "Email already exist");
        }
        return "success";
    }

    @GetMapping("/registerJdbc")
    public String registerJdbc(Model model, @ModelAttribute UserDto userDto) {
        model.addAttribute("name", "Ritu");
        return "register";
    }

    @PostMapping("/registerJdbc")
    public String userRegisterJdbc(Model model, @ModelAttribute UserDto userDto) {
        UserDto userDto1 = userService.registerJdbc(userDto);
        model.addAttribute("user", userDto1);
        if (userDto1.isSuccess()) {
            model.addAttribute("message", "Registeration Successful");
        } else {
            model.addAttribute("message", "Email already exist");
        }
        return "success";
    }


    @PostMapping("/updateJpa")
    public String updateJpa(Model model,@ModelAttribute UserDto userDto) {
        UserDto userDto1 = userService.updateJpa(userDto);
        model.addAttribute("user", userDto1);
        if (userDto1.isSuccess()) {
            model.addAttribute("name", "Add user Successful");
        } else {
            model.addAttribute("name", "User Already existed");
        }
        return "redirect:/user/allUsers";
    }

    @PostMapping("/updateJdbc")
    public String updateJdbc(Model model,@ModelAttribute UserDto userDto) {
        UserDto userDto1 = userService.updateJdbc(userDto);
        model.addAttribute("user", userDto1);
        return "redirect:/user/allUsersJdbc";
    }

    @GetMapping("/allUsers")
    public String allUsers(Model model) {
        model.addAttribute("user", userService.fetchAllUsers());
        return "allUsers";
    }

    @GetMapping("/allUsersJdbc")
    public String allUsersJdbc(Model model) {
        model.addAttribute("user", userService.fetchAllUsers());
        return "allUsersJdbc";
    }

    @GetMapping("/detail")
    public String getProfile(Model model, @RequestParam String email) {
        UserDto users = userService.getUserByEmail(email);
        model.addAttribute("users", users);
        return "detail";
    }

    @GetMapping("/detail/by-idJpa/{id}")
    public String getProfileByIdJdbc(Model model, @PathVariable Long id) {
        UserDto users = userService.getUserByIdJpa(id);
        model.addAttribute("user", users);
        model.addAttribute("roles", roleService.findAllRoles());
        return "detail";
    }

    @GetMapping("/detail/by-idJdbc/{id}")
    public String getProfileByIdJpa(Model model, @PathVariable Long id) {
        UserDto user = userService.getUserByIdJdbc(id);
        model.addAttribute("user", user);
        return "detail";
    }

    @GetMapping("/deleteByEmailJpa/{email}")
    public String deletebyEmailJpa(Model model, @PathVariable String email) {
        userService.deleteByEmailJpa(email);
        return "redirect:/user/allUsers";
    }

    @GetMapping("/deleteByEmailJdbc/{email}")
    public String deletebyEmailJdbc(Model model, @PathVariable String email) {
        userService.deleteByEmailJdbc(email);
        return "redirect:/user/allUsersJdbc";
    }
}
