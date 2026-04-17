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
        UserDto userDto1 = userService.saveData(userDto);

        if (userDto1.isSuccess()) {
            model.addAttribute("message", "Success ");
        } else {
            model.addAttribute("message", "! Email already exists");
        }

        return "register";
    }

    @GetMapping("/register")
    public String userRegister(Model model) {
        model.addAttribute("name", "Navaneeth");
        model.addAttribute("roles", roleService.getAllRoles());
        return "register";
    }

    @PostMapping("/registerJdbc")
    public String userRegisterJdbc(Model model, @ModelAttribute UserDto userDto) {
        boolean state = userService.saveDataJdbc(userDto);

        if (state) {
            return "Success";
        } else {
            return "! Email already exists";
        }
    }

    @GetMapping("/registerJdbc")
    public String userRegisterJdbc(Model model) {
        model.addAttribute("name", "Navaneeth");
        return "register";
    }

    @GetMapping("/users")
    public String userDetails(Model model) {
        List<UserDto> users = userService.getAllUsers();
        model.addAttribute("users", users);
        return "users";
    }

    @GetMapping("/usersJdbc")
    public String userDetailsJdbc(Model model) {
        List<UserDto> usersJdbc = userService.getAllUsersJdbc();
        model.addAttribute("users", usersJdbc);
        return "users";
    }

    @GetMapping("/getProfile")
    public String getProfile(Model model, @RequestParam String email) {
        UserDto userDto = userService.findByEmail(email);
        model.addAttribute("user", userDto);
        return "profile";
    }

    @GetMapping("/getProfile/{email}")
    public String getProfileJdbc(Model model, @PathVariable String email) {
        UserDto userDto = userService.findByEmail(email);
        model.addAttribute("user", userDto);
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

    @GetMapping("/deleteProfile/{email}")
    public String deleteProfile(@PathVariable String email) {
        userService.deleteByEmail(email);
        return "redirect:/user/users";
    }

    @GetMapping("/deleteProfileJdbc/{email}")
    public String deleteProfileJdbc(@PathVariable String email) {
        userService.deleteByEmailJdbc(email);
        return "redirect:/user/users";
    }

    @GetMapping("/getProfileById")
    public String getProfileById(Model model, @RequestParam Long id) {
        UserDto userDto = userService.findById(id);
        model.addAttribute("user", userDto);
        model.addAttribute("roles", roleService.getAllRoles());
        return "profile";
    }

    @GetMapping("/getProfileJdbcById")
    public String getProfileJdbcById(Model model, @RequestParam Long id) {
        UserDto userDto = userService.findByIdJdbc(id);
        model.addAttribute("user", userDto);
        return "profile";
    }

    @PostMapping("/updateUserJpa")
    public String updateUserJpa(Model model, @ModelAttribute UserDto userDto) {

        if (userService.updateDataJpa(userDto) == null) {
            model.addAttribute("message", userDto.getMessage());

            return "profile";
        }

        model.addAttribute("message", userDto.getMessage());
        return "profile";
    }

    @PostMapping("/updateUserJdbc")
    public String updateUserJdbc(Model model, @ModelAttribute UserDto userDto) {

        if (userService.updateDataJdbc(userDto) < 1) {
            model.addAttribute("message", userDto.getMessage());
            return "profile";
        }

        model.addAttribute("message", userDto.getMessage());
        return "profile";
    }
}
