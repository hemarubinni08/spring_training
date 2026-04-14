package com.ust.pos.web.controller;

import com.ust.pos.dto.UserDto;
import com.ust.pos.service.impl.RoleService;
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
    @Autowired
    RoleService roleService;

    @PostMapping("/register")
    public String userRegister(Model model, @ModelAttribute UserDto userDto) {
        UserDto userDto1 = userService.saveData(userDto);
        if (userDto1.isSuccess()) {
            model.addAttribute("message", "Registration Successful");
        } else {
            model.addAttribute("message", "User Already Excists");
        }
        return "success";
    }

    @GetMapping("/register")
    public String register(Model model, @ModelAttribute UserDto userDto) {
        model.addAttribute("roles", roleService.findAllRoles());
        return "register";
    }

    @PostMapping("/registerJdbc")
    public String userRegisterJdbc(Model model, @ModelAttribute UserDto userDto) {
        UserDto userDto1 = userService.registerJdbc(userDto);
        if (userDto1.isSuccess()) {
            model.addAttribute("message", "Registration Successful");
        } else {
            model.addAttribute("message", "User Already Excists");
        }
        return "success";
    }

    @GetMapping("/registerJdbc")
    public String registerJdbc(Model model, @ModelAttribute UserDto userDto) {
        model.addAttribute("name", "Rohit");
        return "register";
    }

    @GetMapping("/registeruserList")
    public String userList(Model model) {
        model.addAttribute("users", userService.findAllUser());
        return "userList";
    }

    @GetMapping("/registeruserListJpa")
    public String userListJpa(Model model) {
        model.addAttribute("users", userService.findAllUsersJpa());
        return "userList";
    }

    @GetMapping("/getprofile")
    public String profile(Model model, @RequestParam String email) {
        UserDto userDto2 = userService.findByEmail(email);
        model.addAttribute("user", userDto2);
        return "getProfile";
    }

    @GetMapping("/getprofile/{email}")
    public String profileJpa(Model model, @PathVariable String email) {
        UserDto userDto2 = userService.findByEmailJpa(email);
        model.addAttribute("user", userDto2);
        return "getProfile";
    }

    @GetMapping("/deleteProfile/{email}")
    public String deleteUserJpa(Model model, @PathVariable String email) {
        userService.deleteUser(email);
        return "redirect:/user/registeruserList";
    }

    @GetMapping("/getprofileById/{id}")
    public String findUserByIdJpa(Model model, @PathVariable Long id) {
        UserDto userDto = userService.findByIdJpa(id);
        model.addAttribute("user", userDto);
        model.addAttribute("roles", roleService.findAllRoles());
        return "getProfile";
    }

    @GetMapping("/getprofileByIdJdbc/{id}")
    public String findUserById(Model model, @PathVariable Long id) {
        UserDto userDto = userService.findById(id);
        model.addAttribute("user", userDto);
        model.addAttribute("roles", roleService.findAllRoles());
        return "getProfile";
    }

    @PostMapping("/updateUserJdbc")
    public String updateUserJdbc(Model model, @ModelAttribute UserDto userDto) {
        UserDto updateUser = userService.UpdateData(userDto);
        model.addAttribute("user", updateUser);
        return "redirect:/user/registeruserList";
    }

    @PostMapping("/updateUserJpa")
    public String UpdateUserJpa(Model model, @ModelAttribute UserDto userDto) {
        UserDto updateUser = userService.UpdateUserJpa(userDto);
        model.addAttribute("user", updateUser);
        return "redirect:/user/registeruserList";
    }
}