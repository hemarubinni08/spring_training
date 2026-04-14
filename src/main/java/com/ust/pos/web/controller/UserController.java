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

    private final UserService userService;

    public UserController(UserService userService) {
        this.userService = userService;
    }

    @Autowired
    private RoleService roleService;

    @GetMapping("/register")
    public String showRegister(Model model) {
        model.addAttribute("user", new UserDto());
        model.addAttribute("roles",roleService.getAllRoles());
        return "register";
    }

    @PostMapping("/register")
    public String registerUser(@ModelAttribute("user") UserDto userDto,
                               Model model) {

        if (userService.emailExists(userDto.getEmail())) {
            model.addAttribute("errorMessage",
                    "Email already exists. Please use a different email.");
            model.addAttribute("user", userDto);
            return "register";
        }

        UserDto savedUser = userService.createUser(userDto);
        model.addAttribute("user", savedUser);

        return "success";
    }


    @GetMapping("/registerJdbc")
    public String showRegisterJdbc(Model model) {
        model.addAttribute("user", new UserDto());
        return "registerJdbc";
    }

    @PostMapping("/registerJdbc")
    public String registerJdbcUser(@ModelAttribute("user") UserDto userDto,
                                   Model model) {

        if (userService.emailExistsJdbc(userDto.getEmail())) {
            model.addAttribute("errorMessage",
                    "Email already exists. Please use a different email.");
            model.addAttribute("user", userDto);
            return "registerJdbc";
        }
        userService.createUserJdbc(userDto);

        model.addAttribute("successMessage",
                "User registered successfully using JDBC");

        return "success";
    }


    @GetMapping("/getUsers")
    public String getUsers(Model model) {


        model.addAttribute("getUsers", userService.getUsers());

        return "getUsers";
    }

    @GetMapping("/getusersjpa")
    public String getUsersJpa(Model model) {


        model.addAttribute("getUsersJpa", userService.getUsersJpa());

        return "getusersjpa";
    }

//    @GetMapping("/profile")
//    public String userProfile(@RequestParam("email") String email, Model model) {
//
//        UserDto user = userService.getUserByEmail(email);
//        model.addAttribute("user", user);
//
//        return "userProfile";
//    }
//
//    @GetMapping("/{email}")
//    public String userProfilePath(@PathVariable String email, Model model) {
//            UserDto user = userService.getUserByEmail(email);
//            model.addAttribute("user", userService.getUserByEmail(email));
//            return "userProfile";
//    }

//    @GetMapping("/profileJdbc")
//    public String userProfileJdbc(@RequestParam("email") String email, Model model) {
//
//        UserDto user = userService.getUserByEmailJdbc(email);
//        model.addAttribute("user", user);
//
//        return "userProfile";
//    }

//    @GetMapping("/profileJdbc/{email}")
//    public String userProfilePathJdbc(@PathVariable String email, Model model) {
//        UserDto user = userService.getUserByEmail(email);
//        model.addAttribute("user", userService.getUserByEmailJdbc(email));
//        return "userProfile";
//    }

    @GetMapping("/profileid/{id}")
    public String profileid(@PathVariable Long id, Model model){

        UserDto user = userService.getUserById(id);

        model.addAttribute("user", user);
        model.addAttribute("roles",roleService.getAllRoles());

        return "userProfile";
    }


    @GetMapping("/profileJdbc/id/{id}")
    public String showProfile(@PathVariable Long id, Model model) {
        UserDto user = userService.getUserByIdJdbc(id);
        model.addAttribute("user", user);
        return "userProfile";
    }

    @GetMapping("/profileJpa/id/{id}")
    public String showProfileJpa(@PathVariable Long id, Model model) {
        UserDto user = userService.getUserById(id);
        model.addAttribute("user", user);
        return "userProfileJpa";
    }


    @PostMapping("/delete/{email}")
    public String deleteUser(@PathVariable String email) {
        userService.deleteUserByEmail(email);
        return "redirect:/user/getUsers";
    }

    @GetMapping("/deleteJpa/{email}")
    public String deleteUserJpa(@PathVariable String email, Model model) {

        userService.deleteUserByEmailJpa(email);

        model.addAttribute("getUsers", userService.getUsers());

        return "getUsers";
    }

    @PostMapping("/userProfileJpa")
    public String updateProfilejpa(
            @ModelAttribute("user") UserDto userDto,
            Model model) {

        boolean updated = userService.updateUserJpa(userDto);

        if (!updated) {
            model.addAttribute(
                    "errorMessage",
                    "Email already exists. Please use another email"
            );
            return "userProfileJpa";
        }

        model.addAttribute(
                "successMessage",
                "Profile updated successfully"
        );

        model.addAttribute("user", userDto);
        return "userProfileJpa";
    }


    @PostMapping("/userProfileJdbc")
    public String updateProfile(
            @ModelAttribute("user") UserDto userDto,
            Model model) {

        boolean updated = userService.updateUserJdbc(userDto);

        if (!updated) {
            model.addAttribute(
                    "errorMessage",
                    "Email already exists. Please use another email"
            );
            return "userProfile";
        }

        model.addAttribute(
                "successMessage",
                "Profile updated successfully"
        );

        model.addAttribute("user", userDto);
        return "userProfile";
    }




}