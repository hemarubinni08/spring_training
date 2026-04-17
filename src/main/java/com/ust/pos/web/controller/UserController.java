package com.ust.pos.web.controller;

import com.ust.pos.dto.UserDto;
import com.ust.pos.service.impl.RoleServiceImpl;
import com.ust.pos.service.impl.UserServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/user")

public class UserController {

    @Autowired
    UserServiceImpl userService;

    @Autowired
    RoleServiceImpl roleService;

    @GetMapping("/register")
    public String showRegister(Model model, @ModelAttribute UserDto userDto) {

        model.addAttribute("name", "Bewin");
        model.addAttribute("roles", roleService.getAllRoles());
        return "register";
    }

    @PostMapping("/register")
    public String processRegister(Model model, @ModelAttribute UserDto userDto) {

        String message = userService.update(userDto);
        model.addAttribute("message", message);
        return "success";
    }

    @GetMapping("/registerJdbc")
    public String showRegisterJdbc(Model model, @ModelAttribute UserDto userDto) {

        model.addAttribute("name", "Bewin");
        return "registerJdbc";
    }

    @PostMapping("/registerJdbc")
    public String processRegisterJdbc(Model model, @ModelAttribute UserDto userDto) {

        String message = userService.createUserJdbc(userDto);
        userService.update(userDto);
        model.addAttribute("message", message);
        return "redirect:/user/showAllUsers";
    }

    @GetMapping("/showAllUsers")

    public String showAllUsers(Model model) {

        model.addAttribute("users", userService.getAllUsers());
        return "showAllUsers";

    }

    @GetMapping("/showAllUsersJdbc")
    public String showAllUsersJdbc(Model model) {

        model.addAttribute("users", userService.getAllUsersJdbc());
        return "showAllUsersJdbc";
    }

    @GetMapping("/getProfileEmail")
    public String getProfile1(Model model, @RequestParam String email) {

        UserDto userDto = userService.getUserProfileByEmail(email);
        model.addAttribute("user", userDto);
        return "getProfile";
    }

    @GetMapping("/getProfile/{email}")
    public String getProfile2(Model model, @PathVariable String email) {

        UserDto userDto = userService.getUserProfileByEmail(email);
        model.addAttribute("user", userDto);
        return "getProfile";
    }

    @GetMapping("/getProfileJdbcEmail")
    public String getProfile1Jdbc(Model model, @RequestParam String email) {

        UserDto userDto = userService.getUserProfileByEmailJdbc(email);
        model.addAttribute("user", userDto);
        return "getProfileJdbc";
    }

    @GetMapping("/deleteEmail")
    public String deleteEmail(Model model, @RequestParam String email) {

        UserDto userDto = userService.deleteByEmailService(email);
        model.addAttribute("userDto", userDto);
        return "deleteEmail";
    }

    @GetMapping("/getProfileId")
    public String getProfileId(Model model, @RequestParam long id) {

        UserDto userDto = userService.getUserProfileById(id);
        model.addAttribute("user", userDto);
        return "getProfile";
    }

    @GetMapping("/getProfileJdbcId")
    public String getProfile1JdbcId(Model model, @RequestParam long id) {

        UserDto userDto = userService.getUserProfileByIdJdbc(id);
        model.addAttribute("user", userDto);
        return "getProfileJdbc";
    }
    
    @GetMapping("/editProfile")
    public String editProfile(@RequestParam long id, Model model) {

        UserDto userDto = userService.getUserProfileById(id);
        model.addAttribute("user", userDto);
        model.addAttribute("roles", roleService.getAllRoles());
        return "editProfile";
    }

    @PostMapping("/saveProfile")
    public String saveProfile(UserDto userDto, Model model) {

        UserDto savedUser = userService.saveOrUpdateUser(userDto);

        if (savedUser == null) {

            model.addAttribute("errorMessage",
                    "User could not be created or updated because the email already exists.");
            return "saved";
        }

        model.addAttribute("savedUser", savedUser);
        return "saved";
    }

    @GetMapping("/editProfileJdbc")
    public String editProfileJdbc(@RequestParam long id, Model model) {

        UserDto userDto = userService.getUserProfileById(id);
        model.addAttribute("user", userDto);
        return "editProfileJdbc";
    }

    @PostMapping("/saveProfileJdbc")
    public String saveProfileJdbc(UserDto userDto, Model model) {

        UserDto savedUser = userService.saveOrUpdateUserJdbc(userDto);

        if (savedUser == null) {
            model.addAttribute("errorMessage",
                    "User could not be created or updated because the email already exists.");
            return "savedJdbc";
        }

        model.addAttribute("savedUser", savedUser);
        return "savedJdbc";
    }
}
