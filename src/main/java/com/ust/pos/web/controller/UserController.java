package com.ust.pos.web.controller;

import com.ust.pos.dto.UserDto;
import com.ust.pos.service.UserService;
import com.ust.pos.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserService userService;
    @Autowired
    private RoleService roleService;

    @PostMapping("/register")
    public String userRegister(Model model, @ModelAttribute UserDto userDto) {
        UserDto userDto1 = userService.createUserJpa(userDto);
        model.addAttribute("user", userDto1);
        if (userDto1.isSuccess()) {
            model.addAttribute("message", "Registration Successful");
        } else {
            model.addAttribute("message", "Email already exist");
        }
        return "success";
    }

    @GetMapping("/register")
    public String doRegister(Model model, @ModelAttribute UserDto userDto) {
        model.addAttribute("roles", roleService.getAllRolesJpa());
        return "register";
    }

    @PostMapping("/registerJdbc")
    public String userRegisterJdbc(Model model, @ModelAttribute UserDto userDto) {
        UserDto userDto1 = userService.createUserJdbc(userDto);
        model.addAttribute("user", userDto1);
        if (userDto1.isSuccess()) {
            model.addAttribute("message", "Registration Successful");
        } else {
            model.addAttribute("message", "Email already exist");
        }
        return "successJdbc";
    }

    @GetMapping("/registerJdbc")
    public String doRegisterJdbc(Model model, @ModelAttribute UserDto userDto) {
        model.addAttribute("name", "Anu");
        return "registerJdbc";
    }

    @GetMapping("/userJpa")
    public String getUsersJpa(Model model) {
        model.addAttribute("users", userService.listOfUsersJpa());
        return "userJpa";
    }

    @GetMapping("/userJdbc")
    public String getUsersJdbc(Model model) {
        model.addAttribute("users", userService.listOfUsersJdbc());
        return "userJdbc";
    }

    @GetMapping("/profileJpaEmail")
    public String getProfileJpaParam(Model model, @RequestParam String email) {
        UserDto user = userService.findByEmailJpa(email);
        model.addAttribute("user", user);
        model.addAttribute("role", roleService.getAllRolesJpa());
        return "profile";
    }

    @GetMapping("/profileJdbcEmail")
    public String getProfile(Model model, @RequestParam String email) {
        UserDto user = userService.findByEmailJdbc(email);
        model.addAttribute("user", user);
        return "profile";
    }

    @GetMapping("/profileJpaId")
    public String getProfileJpaParam(Model model, @RequestParam Long id) {
        UserDto user = userService.findByIdJpa(id);
        model.addAttribute("user", user);
        model.addAttribute("role", roleService.getAllRolesJpa());
        return "profile";
    }

    @GetMapping("/profileJdbcId")
    public String getProfile(Model model, @RequestParam Long id) {
        UserDto user = userService.findByIdJdbc(id);
        model.addAttribute("user", user);
        return "profile";
    }

    @PostMapping("/updateJpa")
    public String userUpdateJpa(Model model, @ModelAttribute UserDto userDto) {
        UserDto userDto1 = userService.updateUserJpa(userDto);
        model.addAttribute("user", userDto1);
        return "redirect:/user/userJpa";
    }

    @PostMapping("/updateJdbc")
    public String userUpdateJdbc(Model model, @ModelAttribute UserDto userDto) {
        UserDto userDto1 = userService.updateUserJdbc(userDto);
        model.addAttribute("user", userDto1);
        return "redirect:/user/userJdbc";
    }

    @GetMapping("/deleteJpa")
    public String deleteJpa(Model model, @RequestParam String email) {
        userService.deleteByEmailJpa(email);
        return "redirect:/user/userJpa";
    }

    @GetMapping("/delete")
    public String delete(Model model, @RequestParam String email) {
        userService.deleteByEmailJdbc(email);
        return "redirect:/user/userJdbc";
    }


}
