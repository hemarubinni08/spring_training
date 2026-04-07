package com.ust.pos.web.controller;

import com.ust.pos.dto.UserDto;
import com.ust.pos.model.User;
import com.ust.pos.service.UserService;
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
    private UserService userService;

    @PostMapping("/register")
    public String register(Model model, @ModelAttribute UserDto userDto) {
        boolean flag = userService.register(userDto);
        if (flag) {
            model.addAttribute("message", "Success");
        } else {
            model.addAttribute("message", "Failure");
        }
        return "success";
    }

    @GetMapping("/register")
    public String userRegister(Model model, @ModelAttribute UserDto userDto) {
        model.addAttribute("name", "Shashi");
        return "register";
    }

    @GetMapping("/registerjdbc")
    public String registerjdbc(Model model) {
        model.addAttribute("name", "Shashi");
        return "registered";
    }

    @PostMapping("/registerjdbc")
    public String registerjdbc(Model model, @ModelAttribute UserDto userDto) {
        boolean flag = userService.saveDataJdbc(userDto);
        if (flag) {
            model.addAttribute("message", "Success");
        } else {
            model.addAttribute("message", "Failure" + userDto.getEmail());
        }
        return "success";
    }
    @GetMapping("/getuser")
    public String getAllUsers(Model model){
       model.addAttribute("users", userService.printAllUsers());
       return "printAllUser";
    }
    @GetMapping("/getuserjdbc")
    public String getAllUserJdbc(Model model){
        model.addAttribute("users",userService.printAllUsersJdbc());
        return "printAllUser";
    }
    @GetMapping("/profile/{email}")
    public String getProfileByEmail(Model model,@PathVariable String email){
        model.addAttribute("userDetails",userService.getProfile(email));
        return "profile";
    }
    @GetMapping("/profilejdbc")
    public String getProfileEmail(Model model,@RequestParam String email){
        model.addAttribute("userDetails",userService.getProfileJdbc(email));
        return "profile";
    }
    @GetMapping("/deleteUser")
    public String deleteByEmail(@RequestParam String email){
        userService.deleteByEmail(email);
        return "redirect:/user/getuser";
    }
    @GetMapping("/deleteUserJdbc")
    public String deleteByEmailJdbc(Model model,@RequestParam String email){
        userService.deleteByEmailJdbc(email);
        return "redirect:/user/getuserjdbc";
    }
}