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
    private UserService userService;

    @Autowired
    private RoleService roleService;

    private RedirectAttributes redirectAttributes;

    // Using JPA
    @GetMapping("/register")
    public String registerUser(Model model) {
        model.addAttribute("userDto", new UserDto());
        List<String> roleNames = roleService.getAllRoleNames();
        model.addAttribute("roleList", roleNames);
        return "register";
    }

    @PostMapping("/register")
    public String registerUser(@ModelAttribute("userDto") UserDto userDto, Model model) {
        UserDto resultDto = userService.createUser(userDto);
        model.addAttribute("toastMessage", resultDto.getMessage());
        model.addAttribute("toastMessage2", resultDto.getMessage2());
        model.addAttribute("toastType", "green".equals(resultDto.getColour()) ? "success" : "error");
        return "register";
    }

    @GetMapping("/list")
    public String listUsers(Model model) {
        model.addAttribute("usersDetailsList", userService.getAllUsersDetails());
        return "usersList";
    }

    @GetMapping("/profileByEmail/{email}")
    public String userProfileByEmail(@PathVariable String email, Model model) {
        model.addAttribute("userDetailsDto", userService.getUserDetails(email));
        model.addAttribute("rolesList", roleService.getAllRoleNames());
        return "userProfile";
    }

    @GetMapping("/profileById/{id}")
    public String userProfileById(@PathVariable long id, Model model) {
        model.addAttribute("userDetailsDto", userService.getUserDetailsById(id));
        model.addAttribute("rolesList", roleService.getAllRoleNames());
        return "userProfile";
    }

    @GetMapping("/update")
    public String fetchForUpdateUserDetailsUsingJpa(@ModelAttribute UserDto userDto, Model model) {
        model.addAttribute("userDetailsDto", userService.getUserDetailsById(userDto.getId()));
        List<String> roleNames = roleService.getAllRoleNames();
        model.addAttribute("rolesList", roleNames);
        return "userProfile";
    }

    @PostMapping("/update")
    public String updateUserDetailsUsingJpa(@ModelAttribute UserDto userDto, Model model) {
        UserDto responseDto = userService.updateUserDetails(userDto);
        model.addAttribute("userDetailsDto", responseDto);
        return "userProfile";
    }

    @GetMapping("/delete/{email}")
    public String deleteUser(@PathVariable String email, Model model, RedirectAttributes redirectAttributes) {
        userService.deleteUser(email);
        redirectAttributes.addFlashAttribute("message", "User deleted successfully");
        return "redirect:/user/list";
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
        userService.createUserUsingJdbc(userDto);
        model.addAttribute("userDto", userDto);
        return "success";
    }

    @GetMapping("/usersDetailsJdbc")
    public String showUsersDetailsUsingJdbc(Model model) {
        model.addAttribute("usersDetailsList", userService.getAllUsersDetailsUsingJdbc());
        return "usersList";
    }

    @GetMapping("/userProfileJdbc")
    public String showUserDetailsUsingJdbc(@RequestParam String email, Model model) {
        model.addAttribute("userDetailsDto", userService.getUserDetailsUsingJdbc(email));
        model.addAttribute("rolesList", roleService.getAllRoleNames());
        return "userProfile";
    }

    @GetMapping("/userProfileJdbcById")
    public String showUserDetailsUsingJdbcById(@RequestParam long id, Model model) {
        model.addAttribute("userDetailsDto", userService.getUserDetailsUsingJdbcByid(id));
        model.addAttribute("rolesList", roleService.getAllRoleNames());
        return "userProfile";
    }

    @PostMapping("/updateUserJdbc")
    public String updateUserDetailsUsingJdbc(@ModelAttribute UserDto userDto, Model model) {
        UserDto responseDto = userService.updateUserDetailsUsingJdbc(userDto);
        model.addAttribute("userDetailsDto", responseDto);
        return "userProfile";
    }
}
