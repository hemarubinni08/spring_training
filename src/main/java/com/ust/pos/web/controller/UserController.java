package com.ust.pos.web.controller;

import com.ust.pos.dto.UserDto;
import com.ust.pos.service.RoleService;
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

    @Autowired
    private RoleService roleService;

    @GetMapping("/register")
    public String registerPage(Model model) {
        model.addAttribute("singlerole", roleService.getAllRoles());
        model.addAttribute("multiplerole", roleService.getAllRoles());
        model.addAttribute("userDto", new UserDto());
        return "register";
    }

    @PostMapping("/register")
    public String register(Model model, @ModelAttribute UserDto userDto) {
        userService.register(userDto);
        return "redirect:/user/getuser";
    }

    @GetMapping("/registerjdbc")
    public String registerJdbcPage(Model model) {
        model.addAttribute("singlerole", roleService.getAllRoles());
        model.addAttribute("multiplerole", roleService.getAllRoles());
        model.addAttribute("userDto", new UserDto());
        return "registerjdbc";
    }

    @PostMapping("/registerjdbc")
    public String registerJdbc(Model model, @ModelAttribute UserDto userDto) {
        userService.saveDataJdbc(userDto);
        return "redirect:/user/getuser";
    }

    @GetMapping("/getuser")
    public String getAllUsers(Model model) {
        model.addAttribute("users", userService.printAllUsers());
        return "printAllUser";
    }

    @GetMapping("/getuserjdbc")
    public String getAllUsersJdbc(Model model) {
        model.addAttribute("users", userService.printAllUsersJdbc());
        return "printAllUser";
    }

    @GetMapping("/getProfileById")
    public String getProfileById(Model model, @RequestParam Long id) {
        model.addAttribute("singlerole", roleService.getAllRoles());
        model.addAttribute("multiplerole", roleService.getAllRoles());
        model.addAttribute("userDetails", userService.findById(id));
        return "profile";
    }

    @GetMapping("/getProfileByIdJdbc/{id}")
    public String getProfileByIdJdbc(Model model, @PathVariable Long id) {
        model.addAttribute("singlerole", roleService.getAllRoles());
        model.addAttribute("multiplerole", roleService.getAllRoles());
        model.addAttribute("userDetails", userService.findByIdJdbc(id));
        return "profile";
    }

    @GetMapping("/profile/{email}")
    public String getProfileByEmail(Model model, @PathVariable String email) {
        model.addAttribute("rolesList", roleService.getAllRoles());
        model.addAttribute("userDetails", userService.getProfile(email));
        return "profile";
    }

    @GetMapping("/profilejdbc")
    public String getProfileByEmailJdbc(Model model, @RequestParam String email) {
        model.addAttribute("singlerole", roleService.getAllRoles());
        model.addAttribute("multiplerole", roleService.getAllRoles());
        model.addAttribute("userDetails", userService.getProfileJdbc(email));
        return "profile";
    }

    @PostMapping("/updateUser")
    public String updateUser(@ModelAttribute UserDto userDto) {
        userService.updateUser(userDto);
        return "redirect:/user/getuser";
    }

    @PostMapping("/updateUserJdbc")
    public String updateUserJdbc(@ModelAttribute UserDto userDto) {
        userService.updateUserJdbc(userDto);
        return "redirect:/user/getuserjdbc";
    }

    @GetMapping("/deleteUser")
    public String deleteUser(@RequestParam String email) {
        userService.deleteByEmail(email);
        return "redirect:/user/getuser";
    }

    @GetMapping("/deleteUserJdbc")
    public String deleteUserJdbc(@RequestParam String email) {
        userService.deleteByEmailJdbc(email);
        return "redirect:/user/getuserjdbc";
    }
}