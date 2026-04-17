package com.ust.pos.web.controller;

import com.ust.pos.dto.RoleDto;
import com.ust.pos.dto.UserDto;
import com.ust.pos.service.RoleService;
import com.ust.pos.service.UserService;
import jakarta.annotation.Resource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/user")
public class UserController {

    @Resource
    UserService userService;

    @Autowired
    RoleService roleService;

    @PostMapping("/register")
    public String userRegister(Model model, @ModelAttribute UserDto userDto) {
        UserDto userDto1 = userService.saveData(userDto);

        if (userDto1.isSuccess()) {
            model.addAttribute("msg", "Success");
        } else {
            model.addAttribute("msg", "Failed ! Email already exists");
        }

        return "register";
    }

    @GetMapping("/register")
    public String userRegister(Model model) {
        List<RoleDto> roles = roleService.fetchRole();
        model.addAttribute("name", "Chandu");
        model.addAttribute("roles", roles);
        model.addAttribute("userDto", new UserDto());
        return "register";
    }

    @PostMapping("/registerJdbc")
    public String userRegisterJdbc(Model model, @ModelAttribute UserDto userDto) {
        boolean checkEmail = userService.saveDataJdbc(userDto);

        if (checkEmail) {
            return "Success";
        } else {
            return "Email already exists";
        }
    }

    @GetMapping("/registerJdbc")
    public String userRegisterJdbc(Model model) {
        model.addAttribute("name", "Chandu");
        return "register";
    }

    @GetMapping("/usersJdbc")
    public String userDetailsJdbc(Model model) {
        List<UserDto> users = userService.fetchUserJdbc();
        model.addAttribute("users", users);
        return "users";
    }

    @GetMapping("/users")
    public String userDetails(Model model) {
        List<UserDto> users1 = userService.fetchUser1();
        model.addAttribute("users", users1);
        return "users";
    }

    @GetMapping("/getProfile")
    public String getProfile(Model model, @RequestParam String email) {
        UserDto user = userService.findByEmail(email);
        model.addAttribute("user", user);
        return "profile";
    }

    @GetMapping("/getProfile/{email}")
    public String getProfile1(Model model, @PathVariable String email) {
        UserDto user = userService.findByEmail(email);
        model.addAttribute("user", user);
        return "profile";
    }

    @GetMapping("/getProfileJpa")
    public String fetchProfile(Model model, @RequestParam String email) {
        UserDto userDto = userService.findByEmailJpa(email);
        model.addAttribute("user", userDto);
        return "profile";
    }

    @GetMapping("/getProfileJpa/{email}")
    public String fetchProfileJpa(Model model, @PathVariable String email) {
        UserDto userDto = userService.findByEmailJpa(email);
        model.addAttribute("user", userDto);
        return "profile";
    }

    @GetMapping("/getProfileId")
    public String getProfileId(Model model, @RequestParam Long id) {
        List<RoleDto> roles = roleService.fetchRole();
        model.addAttribute("roles", roles);
        UserDto userDto = userService.findByIdJdbc(id);
        model.addAttribute("user", userDto);
        return "profile";
    }

    @GetMapping("/getProfileIdJpa")
    public String getProfileIdJpa(Model model, @RequestParam Long id) {
        UserDto userDto = userService.findByIdJpa(id);
        model.addAttribute("user", userDto);
        return "profile";
    }

    @GetMapping("/deleteProfile/{email}")
    public String deleteByEmail(Model model, @PathVariable String email) {
        userService.deleteByEmail(email);
        return "redirect:/user/users";
    }

    @GetMapping("/deleteProfileJdbc")
    public String deleteByEmailJdbc(Model model, @RequestParam String email) {
        userService.deleteByEmail(email);
        return "redirect:/user/users";
    }

    @PostMapping("/updateByEmail/{id}")
    public String updateByEmail(Model model, @ModelAttribute UserDto userDto) {
        boolean result = userService.updateByEmail(userDto);

        if (result) {
            return "redirect:/user/users";
        } else {
            model.addAttribute("msg", "failed, email exists");
            return "success";
        }
    }
}
