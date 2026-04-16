package com.ust.pos.web.controller;

import com.ust.pos.dao.UserDao;
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
    private UserDao userDao;

    @Autowired
    private RoleService roleService;

    @GetMapping("/register")
    public String register(Model model) {
        model.addAttribute("rolesList", roleService.getRolesListJpa());
        return "register";
    }

    @PostMapping("/register")
    public String register(Model model, @ModelAttribute UserDto userDto) {
        boolean registerSuccess = userService.register(userDto);

        if (!registerSuccess) {
            model.addAttribute("statusMessage", userDto.getEmail() + " already exists. Try with a different email.");
        } else {
            model.addAttribute("statusMessage", userDto.getEmail() + " registration success");
        }

        return "registerstatus";
    }

    @GetMapping("/registerjdbc")
    public String registerjdbc(Model model) {
        return "registerjdbc";
    }

    @PostMapping("/registerjdbc")
    public String registerjdbc(Model model, @ModelAttribute UserDto userDto) {
        boolean registerSuccess = userService.createUserJdbc(userDto);

        if (!registerSuccess) {
            model.addAttribute("statusMessage", userDto.getEmail() + " already exists. Try with a different email.");
        } else {
            model.addAttribute("statusMessage", userDto.getEmail() + " registration success");
        }

        return "registerstatus";
    }

    @GetMapping("/userslistjpa")
    public String usersListJpa(Model model) {
        model.addAttribute("usersList", userService.getUsersListJpa());
        return "userslist";
    }

    @GetMapping("/userslistjdbc")
    public String usersListJdbc(Model model) {
        model.addAttribute("usersList", userService.getUsersListJdbc());
        return "userslist";
    }

    @GetMapping("/getprofilejpa")
    public String getProfileJpa(Model model, @RequestParam String email) {
        model.addAttribute("rolesList", roleService.getRolesListJpa());
        model.addAttribute("userDetails", userService.findByEmailJpa(email));
        return "userprofile";
    }

    @GetMapping("/getprofilejdbc/{email}")
    public String getProfileJdbc(Model model, @PathVariable String email) {
        model.addAttribute("rolesList", roleService.getRolesListJpa());
        model.addAttribute("userDetails", userService.findByEmailJdbc(email));
        return "userprofile";
    }

    @GetMapping("/getprofilebyidjpa")
    public String getProfileByIdJpa(Model model, @RequestParam long id) {
        model.addAttribute("rolesList", roleService.getRolesListJpa());
        model.addAttribute("userDetails", userService.findByIdJpa(id));
        return "userprofile";
    }

    @GetMapping("/getprofilebyidjdbc/{id}")
    public String getProfileByIdJdbc(Model model, @PathVariable long id) {
        model.addAttribute("rolesList", roleService.getRolesListJpa());
        model.addAttribute("userDetails", userService.findByIdJdbc(id));
        return "userprofile";
    }

    @GetMapping("/deleteUserJpa")
    public String deleteUserJpa(@RequestParam String email) {
        userService.deleteByEmailJpa(email);
        return "redirect:/user/userslistjpa";
    }

    @GetMapping("/deleteUserJdbc")
    public String deleteUserJdbc(@RequestParam String email) {
        userService.deleteByEmailJdbc(email);
        return "redirect:/user/userslistjdbc";
    }

    @PostMapping("/updateuserjpa")
    public String updateUserJpa(Model model, @ModelAttribute UserDto userDto) {
        userService.updateUserJpa(userDto);
        return "redirect:/user/userslistjpa";
    }

    @PostMapping("/updateuserjdbc")
    public String updateUserJdbc(Model model, @ModelAttribute UserDto userDto) {
        model.addAttribute("userDetails", userService.updateUserJdbc(userDto));
        return "redirect:/user/getprofilebyidjpa?id={userDto.getEmail()}";
    }
}
