package com.ust.pos.web.controller;

import com.ust.pos.dto.UserDto;
import com.ust.pos.service.RoleService;
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
    @Autowired
    private RoleService roleService;

    @PostMapping("/register")
    public String userRegister(Model model, @ModelAttribute UserDto userDto) {
        UserDto userDto1 = userService.saveUser(userDto);
        if (userDto1.isSuccess()) {
            model.addAttribute("message", "success");
        } else {
            model.addAttribute("message", "Email Already Exists");
        }
        return "success";
    }

    @GetMapping("/register")
    public String userRegister(Model model) {
        model.addAttribute("name", "varsha");
        model.addAttribute("roles", roleService.listAllRoles()); // adds all roles from the database into the model
        return "register";
    }

    @PostMapping("/registerJdbc")
    public String userRegisterJdbc(Model model, @ModelAttribute UserDto userDto) {
        boolean check = userService.saveUserJdbc(userDto);
        if (check) {
            return "success";
        } else {
            return "Email Already Exits ";
        }
    }

    @GetMapping("/registerJdbc")
    public String userRegisterJdbc1(Model model) {
        model.addAttribute("name", "varsha");
        return "register";
    }

    @GetMapping("/getAllUsers")
    public String getAllUsers(Model model) {
        List<UserDto> users = userService.getAllUsers();
        model.addAttribute("users", users);
        return "getAllUsers";
    }

    @GetMapping("/getAllUserJdbc")
    public String getAllUsers1Jdbc(Model model) {
        List<UserDto> users = userService.getAllUserJdbc();
        model.addAttribute("users", users);
        return "getAllUserJdbc";
    }

    @GetMapping("/profile")
    public String getProfile(Model model, @RequestParam String email) {
        UserDto user = userService.getByEmail(email);
        model.addAttribute("user", user);
        return "profile";
    }

    @GetMapping("/profile/{email}")
    public String getProfilePath(Model model, @PathVariable String email) {
        UserDto user = userService.getByEmail(email);
        model.addAttribute("user", user);
        return "profile";
    }

    @GetMapping("/profileJdbc")
    public String getProfileJdbc(Model model, @RequestParam String email) {
        UserDto user = userService.getByEmail(email);
        model.addAttribute("user", user);
        return "profile";
    }

    @GetMapping("/profileJdbc/{email}")
    public String getProfilePathJdbc(Model model, @PathVariable String email) {
        UserDto user = userService.getByEmail(email);
        model.addAttribute("user", user);
        return "profile";
    }

    @GetMapping("/deleteProfile/{email}")
    public String deleteProfile(@PathVariable String email) {
        userService.deleteByEmail(email);
        return "redirect:/user/getAllUsers";
    }

    @GetMapping("/deleteByEmailJdbc/{email}")
    public String deleteByEmailPathJdbc(@PathVariable String email) {
        userService.deleteByEmail(email); // calls JDBC service
        return "redirect:/user/getAllUserJdbc";
    }

    @GetMapping("/getUserById/{id}")
    public String getUserByIdPath(Model model, @PathVariable Long id) {
        UserDto user = userService.getUserById(id);
        model.addAttribute("user", user);
        model.addAttribute("roles", roleService.listAllRoles());
        return "profile";
    }

    @GetMapping("/getUserByIdJdbc")
    public String getUserByIdJdbc(Model model, @RequestParam Long id) {
        UserDto user = userService.getUserByIdJdbc(id);
        model.addAttribute("user", user);
        return "profile";
    }

    @GetMapping("/edit/{id}")
    public String showEditPage(@PathVariable Long id, Model model) {
        UserDto user = userService.findById(id);
        model.addAttribute("user", user);
        model.addAttribute("roles", roleService.listAllRoles()); //adds all roles from the database into the model
        return "profile";
    }

    @PostMapping("/update")
    public String updateUser(@ModelAttribute UserDto userDto) {
        userService.updateUser(userDto);
        return "redirect:/user/getAllUsers";
    }

}