package com.ust.pos.web.controller;

import com.ust.pos.dto.UserDto;
import com.ust.pos.service.Impl.RoleService;
import com.ust.pos.service.Impl.UserService;
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
    private final RoleService roleService;

    public UserController(RoleService roleService) {
        this.roleService = roleService;
    }

    @GetMapping("/register")
    public String userRegister(Model model) {
        model.addAttribute("roleList", roleService.findAllRoles());
        return "register";
    }

    @PostMapping("/register")
    public String userRegister(Model model, @ModelAttribute UserDto userDto) {
        UserDto resultDto = userService.createUser(userDto);
        model.addAttribute("status", resultDto.getMessage());
        return "success";
    }

    @GetMapping("/registerJdbc")
    public String userRegisterJdbc(Model model) {
        model.addAttribute("userDto", new UserDto());
        return "registerJdbc";
    }

    @PostMapping("/registerJdbc")
    public String userRegisterJdbc(Model model, @ModelAttribute UserDto userDto) {
        UserDto resultDto = userService.createUserJdbc(userDto);
        model.addAttribute("status", resultDto.getMessage());
        return "success";
    }

    @GetMapping("/getAllUsers")
    public String getAllUsers(Model model) {
        List<UserDto> users = userService.findAllUsers();
        model.addAttribute("users", users);
        return "allUsers";
    }

    @GetMapping("/getAllUsersJdbc")
    public String getAllUsersJdbc(Model model) {
        List<UserDto> users = userService.findAllUsersJdbc();
        model.addAttribute("users", users);
        return "allUsers";
    }

    @GetMapping("/getProfilePage")
    public String getProfile2(Model model, @RequestParam String email) {
        UserDto user = userService.findByEmail(email);
        model.addAttribute("user", user);
        return "profilePage";

    }

    @GetMapping("/getProfilePageJdbc/{email}")
    public String getProfileJdbc(Model model, @PathVariable String email) {
        UserDto user = userService.findByEmail(email);
        model.addAttribute("user", user);
        return "profilePage";
    }

    @GetMapping("/getProfilePageJdbc")
    public String getProfile2Jdbc(Model model, @RequestParam String email) {
        UserDto user = userService.findByEmailJdbc(email);
        model.addAttribute("user", user);
        return "profilePage";
    }

    @GetMapping("/deleteProfile")
    public String deleteByEmail(@RequestParam Long id) {

        userService.deleteByEmailJpa(id);
        return "redirect:/user/getAllUsers";
    }

    @GetMapping("/getProfilePageById")
    public String getProfileById(Model model, @RequestParam Long id) {
        UserDto user = userService.findById(id);
        model.addAttribute("user", user);
        return "profilePage";
    }

    @GetMapping("/editUser/{id}")
    public String editUserProfile(Model model, @PathVariable Long id, @ModelAttribute UserDto userDto) {
        UserDto user = userService.findById(id);
        model.addAttribute("user", user);
        model.addAttribute("roleList", roleService.findAllRoles());
        return "editUser";
    }

    @PostMapping("/editUser/{id}")
    public String editUserProfile(Model model, @ModelAttribute UserDto userDto, @PathVariable Long id) {
        UserDto user = userService.editUserProfile(userDto);
        model.addAttribute("user", user);
        if (user.getMessage() == null) {
            model.addAttribute("success", "User updated successfully");
        } else {
            model.addAttribute("error", user.getMessage());
        }
        return "editUser";
    }
}
