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
    UserService userService;

    @Autowired
    RoleService roleService;

    @RequestMapping("/login")
    public String login(Model model) {
        model.addAttribute("name", "Hemanth");
        return "login";

    }

    @PostMapping("/register")

    public String userRegister(Model model, @ModelAttribute UserDto userDto) {
        UserDto result = userService.createUser(userDto);

        if (!result.isUserSuccess()) {
            model.addAttribute("message", "Username Already Exists");
        } else if (!result.isSuccess()) {
            model.addAttribute("message", "Email Already Exists");
        } else {
            model.addAttribute("message", "Registration Successful");
        }

        return "redirect:/user/listOfUsers";
    }

    @GetMapping("/register")
    public String doRegister(Model model,@ModelAttribute UserDto userDto) {
        model.addAttribute("roles", roleService.getAllRoles());
        return "register";
    }

    @GetMapping("/registerJdbc")
    public String userRegisterJdbc(Model model, @ModelAttribute UserDto userDto) {
        model.addAttribute("name", "Hemanth");
        return "registerJdbc";
    }

    @PostMapping("/registerJdbc")
    public String userRegisterJdbc1(Model model, @ModelAttribute UserDto userDto) {
        boolean check = userService.createUserJdbc(userDto);
        if (check) {
            model.addAttribute("message", "Successfully registered");
            return "success";
        } else {
            model.addAttribute("message", "Email Already Exists");

            return "success";
        }
    }
    @GetMapping("/listOfUsers")
    public  String listOfUsers(Model model){
        List<UserDto> userDtos = userService.getData();

        model.addAttribute("users" ,userDtos);
        return("userList");
    }
    @GetMapping("/listOfUsersJdbc")
    public  String listOfUsersJdbc(Model model){
        List<UserDto> userDtos = userService.getDataJdbc();
        model.addAttribute("users" ,userDtos);
        return("userListJdbc");
    }
    @GetMapping("/userDetailsJdbc")
    public String userDetailsJdbc(Model model, @RequestParam String email){
        UserDto userDto = userService.getUserDetailsJdbc(email);
        model.addAttribute("user" , userDto);
        return("userDetailsJdbc");
    }
    @GetMapping("/userDetails/{email}")
    public String userDetails(Model model, @PathVariable String email){
        UserDto userDto = userService.getUserDetails(email);
        model.addAttribute("roles",roleService.getAllRoles());
        model.addAttribute("user" , userDto);
        return("userDetails");
    }
    @GetMapping("/deleteUser/{email}")
    public  String deleteEmail(Model model , @PathVariable String email){
        userService.deleteUser(email);
        return("redirect:/user/listOfUsers");
    }
    @GetMapping("/deleteUserJdbc")
    public String deleteUser(Model model, @RequestParam String email){
        userService.deleteUserJdbc(email);
        return("redirect:/user/listOfUsersJdbc");
    }
    @GetMapping("/userById/{id}")
    public String getUsersById(Model model , @PathVariable Long id){
        UserDto userDto = userService.getUserDetailsById(id);
        model.addAttribute("user" , userDto);
        model.addAttribute("roles",roleService.getAllRoles());
        return("userDetails");
    }
    @GetMapping("/userByIdJdbc")
    public String getUsersByIdJdbc(Model model, @RequestParam Long id){
        UserDto userDto = userService.getUserDetailsByIdJdbc(id);
        model.addAttribute("user", userDto);
        return ("userDetailsJdbc");
    }
    @PostMapping("/updateUserJdbc")
    public String updateUserJdbc(Model model , @ModelAttribute UserDto userDto) {
        UserDto updatedUser = userService.updaterUserJdbc(userDto);
        model.addAttribute("user", updatedUser);
        return "redirect:/user/listOfUsersJdbc";
    }
    @PostMapping("/updateUserJpa")
    public String updateUserJpa(Model model , @ModelAttribute UserDto userDto) {
        UserDto updatedUser = userService.updateUserJpa(userDto);
        if(updatedUser.isSuccess()){
            model.addAttribute("user", updatedUser);
            model.addAttribute("Message","Updates Successfull");
        }
        else{
            model.addAttribute("message", "Email Already Exists");
        }
        return "redirect:/user/listOfUsers";
    }
}