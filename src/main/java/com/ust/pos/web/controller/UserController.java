package com.ust.pos.web.controller;

import com.ust.pos.dto.UserDto;
import com.ust.pos.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;
    private RedirectAttributes redirectAttributes;

    // Using JPA Repo
    @GetMapping("/register")
    public String showRegisterPage(Model model) {
        model.addAttribute("userDto", new UserDto());
        return "register";
    }

    @PostMapping("/register")
    public String registerUser(@ModelAttribute("userDto") UserDto userDto, Model model) {
        UserDto resultDto = userService.updateUniqueUser(userDto);
        model.addAttribute("status", resultDto.getMessage());
        model.addAttribute("status2", resultDto.getMessage2());
        model.addAttribute("Colour", resultDto.getColour());
        return "success";
    }

    //Using JDBC
    @GetMapping("/registerJdbc")
    public String registerUserUsingJdbc(Model model) {
        model.addAttribute("userDto", new UserDto());
        return "registerJdbc";
    }

    @PostMapping("/registerJdbc")
    public String registerUserUsingJdbc(
            @ModelAttribute("userDto") UserDto userDto,
            Model model) {
        userService.createUserUsingDao(userDto);
        model.addAttribute("userDto", userDto);
        return "success";
    }

    @GetMapping("/usersDetailsJpa")
    public String showUsersDetailsUsingJpa(Model model){
        model.addAttribute("usersDetailsList", userService.getAllUsersDetailsUsingJpa());
        return "usersList";
    }

    @GetMapping("/usersDetailsJdbc")
    public String showUsersDetailsUsingJdbc(Model model){
        model.addAttribute("usersDetailsList",userService.getAllUsersDetailsUsingJdbc());
        return "usersList";
    }

    @GetMapping("/userProfileJdbc")
    public String showUserDetailsUsingJdbc(@RequestParam String email, Model model){
        model.addAttribute("userDetailsDto",userService.getUserDetailsUsingJdbc(email));
        return "userProfile";
    }
    @GetMapping("/userProfileJpa/{email}")
    public String showUserDetailsUsingJpa(@PathVariable String email, Model model){
        model.addAttribute("userDetailsDto", userService.getUserDetailsUsingJpa(email));
        return "userProfile";
    }

    @GetMapping("/userProfileJdbcById")
    public String showUserDetailsUsingJdbcById(@RequestParam long id, Model model) {
        model.addAttribute("userDetailsDto",userService.getUserDetailsUsingJdbcByid(id));
        return "userProfile";
    }

    @GetMapping("/userProfileJpaById/{id}")
    public String showUserDetailsUsingJpaById(@PathVariable long id, Model model){
        model.addAttribute("userDetailsDto", userService.getUserDetailsUsingJpaByid(id));
        return "userProfile";
    }

    @GetMapping("/userDelete/{email}")
    public String deleteUserDetailsUsingJdbc(@PathVariable String email, Model model, RedirectAttributes redirectAttributes){
        userService.deleteUserDetailsUsingJdbc(email);
        redirectAttributes.addFlashAttribute("message", "User deleted successfully");
        return "redirect:/user/usersDetailsJdbc";
    }


    @PostMapping("/updateUserJdbc")
    public String updateUserDetailsUsingJdbc(@ModelAttribute UserDto userDto, Model model) {
        UserDto responseDto = userService.updateUserDetailsUsingJdbc(userDto);
        model.addAttribute("userDetailsDto", responseDto);
        return "userProfile";
    }

    @PostMapping("/updateUserJpa")
    public String updateUserDetailsUsingJpa(@ModelAttribute UserDto userDto, Model model) {
        UserDto responseDto = userService.updateUserDetailsUsingJpa(userDto);
        model.addAttribute("userDetailsDto", responseDto);
        return "userProfile";
    }
}
