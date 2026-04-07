package com.ust.pos.web.controller;

import com.ust.pos.dao.UserDao;
import com.ust.pos.dto.UserDto;
import com.ust.pos.model.User;
import com.ust.pos.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    UserService userService;

    @PostMapping("/register")
    public String userRegister(Model model, @ModelAttribute UserDto userDto) {
        UserDto result = userService.registerUser(userDto);
        if (result.isSuccess()) {
            model.addAttribute("message", "Registration Successful");
        } else {
            model.addAttribute("message", "Email Already Exist");
        }
        return "success";
    }

    @GetMapping("/register")
    public String doRegister(Model model, @ModelAttribute UserDto userDto) {
        model.addAttribute("name", "ardra");
        return "register";
    }

    @PostMapping("/registerJdbc")
    public String userRegisterJdbc(Model model, @ModelAttribute UserDto userDto) {
        UserDto result = userService.registerUserJdbc(userDto);
        if (result.isSuccess()) {
            model.addAttribute("message", "Registration Successful");
        } else {
            model.addAttribute("message", "Email Already Exist");
        }
        return "success";
    }

    @GetMapping("/registerJdbc")
    public String doRegisterJdbc(Model model, @ModelAttribute UserDto userDto) {
        model.addAttribute("name", "ardra");
        return "register";
    }

    @GetMapping("/usersJpa")
    public String displayUsersJpa(Model model){
        List<UserDto> userDtoList = userService.getUsersJpa();
        model.addAttribute("users",userDtoList);
        return "usersJpa";
    }

    @GetMapping("/usersJdbc")
    public String displayUsersJdbc(Model model){
        List<UserDto> userDtoList = userService.getUsersJdbc();
        model.addAttribute("users", userDtoList);
        return "usersJdbc";
    }
    @GetMapping("/getprofileJpa")
    public String getProfileJpaRequestParams(Model model, @RequestParam String email){
        UserDto userDto=userService.getUserByEmail(email);
        model.addAttribute("user",userDto);
        return "getprofileJpa";
    }
    @GetMapping("/getprofileJpa/{email}")
    public String getProfileJpaPathVariable(Model model, @PathVariable String email){
        UserDto userDto=userService.getUserByEmailJdbc(email);
        model.addAttribute("user",userDto);
        return "getprofileJpa";
    }
    @GetMapping("/getprofileJdbc")
    public String getProfileJdbcRequestParams(Model model, @RequestParam String email){
        UserDto userDto=userService.getUserByEmailJdbc(email);
        model.addAttribute("user",userDto);
        return "getprofileJdbc";
    }

    @GetMapping("/getprofileJdbc/{email}")
    public String getProfileJdbcPathVariable(Model model, @PathVariable String email){
        UserDto userDto=userService.getUserByEmailJdbc(email);
        model.addAttribute("user", userDto);
        return "getprofileJdbc";
    }
}