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
    UserService userService;
    @Autowired
    RoleService roleService;

    @PostMapping("/register")
    public String userRegister(Model model, @ModelAttribute UserDto userDto) {
        UserDto userDto1 = userService.register(userDto);
        model.addAttribute("user", userDto1);
        if (userDto1.isSuccess()) {
            model.addAttribute("message", "Registration Successful");
        } else {
            model.addAttribute("message", "Email already exist");
        }
        return "success";
    }

    @GetMapping("/register")
    public String doRegister(Model model, @ModelAttribute UserDto userDto) {
        model.addAttribute("roles", roleService.display());
        return "register";
    }

    @PostMapping("/registerJDBC")
    public String userRegisterJDBC(Model model, @ModelAttribute UserDto userDto) {
        UserDto userDto1 = userService.registerJDBC(userDto);
        model.addAttribute("user", userDto1);
        if (userDto1.isSuccess()) {
            model.addAttribute("message", "Registration Successful");
        } else {
            model.addAttribute("message", "Email already exist");
        }
        return "success";
    }

    @GetMapping("/registerJDBC")
    public String doRegisterJDBC(Model model, @ModelAttribute UserDto userDto) {
        model.addAttribute("name", "Akash");
        return "registerJDBC";
    }

    @GetMapping("/display")
    public String displayUsers(Model model, @ModelAttribute UserDto userDto)
    {
        List<UserDto> userDto1 = userService.display();
        model.addAttribute("users", userDto1);
        return "display";
    }

    @GetMapping("/displayJDBC")
    public String displayUsersJDBC(Model model, @ModelAttribute UserDto userDto)
    {
        List<UserDto> userDto1 = userService.displayJDBC();
        model.addAttribute("users", userDto1);
        return "displayJDBC";
    }

    @GetMapping("/getprofile")
    public String getProfile(Model model, @RequestParam String email)
    {
        UserDto userDto = userService.getProfile(email);
        model.addAttribute("roles", roleService.display());
        model.addAttribute("user", userDto);
        return "getprofile";
    }

    @GetMapping("/getprofile/{email}")
    public String getProfileusingpathvariable(Model model, @PathVariable String email) {
        UserDto userDto = userService.getProfile(email);
        model.addAttribute("user", userDto);
        return "getprofile";
    }

    @GetMapping("/deleteprofile")
    public String deleteProfile(Model model, @RequestParam String email, RedirectAttributes redirectAttributes)
    {
        userService.deleteProfile(email);
        redirectAttributes.addFlashAttribute("msg", "Profile successfully deleted!");
        return "redirect:/user/display";
    }

    @GetMapping("/getprofilebyid")
    public String getProfileById(Model model, @RequestParam long id)
    {
        UserDto userDto = userService.getProfileById(id);
        model.addAttribute("user", userDto);
        return "getprofilebyid";
    }

    @GetMapping("/getprofilebyidjdbc")
    public String getProfileByIdJDBC(Model model, @RequestParam long id)
    {
        UserDto userDto = userService.getProfileByIdJDBC(id);
        model.addAttribute("user", userDto);
        return "getprofilebyid";
    }

    @PostMapping("/updateprofilejdbc")
    public String updateprofilejdbc(Model model, @ModelAttribute UserDto userDto, RedirectAttributes redirectAttributes)
    {
        UserDto userDto1 = userService.updateprofileJDBC(userDto);
        model.addAttribute("userDto1", userDto1);
        return "redirect:/user/display";
    }

    @PostMapping("/updateprofilejpa")
    public String updateprofilejpa(Model model, @ModelAttribute UserDto userDto, RedirectAttributes redirectAttributes)
    {
        UserDto userDto1 = userService.updateprofileJpa(userDto);
        model.addAttribute("userDto1", userDto1);
        model.addAttribute("roles", roleService.display());
        if (userDto1.isSuccess()) {
            model.addAttribute("message", "Updation Successful");
        } else {
            model.addAttribute("message", "Email already exist");
        }
        return "redirect:/user/display";
    }
}
