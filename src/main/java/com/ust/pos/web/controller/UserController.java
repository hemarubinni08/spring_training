package com.ust.pos.web.controller;

import com.ust.pos.dto.UserDto;
import com.ust.pos.service.RoleService;
import com.ust.pos.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    UserService userService;
    @Autowired
    RoleService roleService;

    @PostMapping("/register")
    public String register(RedirectAttributes ra, @ModelAttribute UserDto userDto) {
        String message = userService.register(userDto);
        ra.addFlashAttribute("message", message);
        ra.addFlashAttribute("success", userDto.isSuccess());
        return "redirect:/user/getAllUsers";
    }

    @GetMapping("/register")
    public String doRegister(Model model) {
        model.addAttribute("roles", roleService.getRoles());
        return "register";
    }

    @PostMapping("/registerJdbc")
    public String registerJdbc(RedirectAttributes ra, @ModelAttribute UserDto userDto) {
        userService.registerUsingJdbc(userDto);
        ra.addFlashAttribute("message", userDto.getMessage());
        ra.addFlashAttribute("success", userDto.isSuccess());
        return "redirect:/user/getAllUsers";
    }

    @GetMapping("/registerJdbc")
    public String doRegisterJdbc() {
        return "registerJdbc";
    }

    @GetMapping("/getAllUsers")
    public String getAllUsers(Model model) {
        List<UserDto> users = userService.getUsers();
        model.addAttribute("users", users);
        return "userDetails";
    }

    @GetMapping("/getAllUsersJdbc")
    public String getAllUsersJdbc(Model model) {
        List<UserDto> users = userService.getUsersJdbc();
        model.addAttribute("users", users);
        return "userDetailsJdbc";
    }

    @GetMapping("/profilePage")
    public String profilePage(Model model, @RequestParam String email) {
        UserDto userDto = userService.findDetails(email);
        model.addAttribute("u", userDto);
        model.addAttribute("roles", roleService.getRoles());
        return "profilePage";
    }

    @GetMapping("/profilePageJdbc")
    public String profilePageJdbc(Model model, @RequestParam String email) {
        UserDto userDto = userService.findDetailsJdbc(email);
        model.addAttribute("u", userDto);
        return "profilePageJdbc";
    }

    @GetMapping("/deletePage")
    public String deletePage(@RequestParam("email") String email) {
        userService.deleteDetails(email);
        return "redirect:/user/getAllUsers";
    }

    @GetMapping("/deletePageJdbc")
    public String deletePageJdbc(@RequestParam("email") String email) {
        userService.deleteDetailsJdbc(email);
        return "redirect:/user/getAllUsersJdbc";
    }

    @PostMapping("/updateJdbc")
    public String updateJdbc(RedirectAttributes ra, @ModelAttribute UserDto userDto) {
        userService.updateValueJdbc(userDto);
        ra.addFlashAttribute("message", userDto.getMessage());
        ra.addFlashAttribute("success", userDto.isSuccess());
        return "redirect:/user/getAllUsersJdbc";
    }

    @PostMapping("/update")
    public String update(RedirectAttributes ra, @ModelAttribute UserDto userDto) {
        userService.updateValue(userDto);
        ra.addFlashAttribute("message", userDto.getMessage());
        ra.addFlashAttribute("success", userDto.isSuccess());
        return "redirect:/user/getAllUsers";
    }
}