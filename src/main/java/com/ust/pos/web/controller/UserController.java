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
    UserService userService;
    @Autowired
    RoleService roleService;

    @GetMapping("/register")
    public String userRegister(Model model, @ModelAttribute UserDto userDto) {
        model.addAttribute("userDto", new UserDto());
        model.addAttribute("roles", roleService.findAllRoles());
        return "register";
    }

    @PostMapping("/register")
    public String userRegisterdo(Model model, @ModelAttribute UserDto userDto) {
        System.out.println(userDto);
        model.addAttribute("message", "success  " + userDto.getEmail());
        if (userService.UpdateByUserName(userDto)) {

            return "success";
        } else {
            model.addAttribute("message", "failed  " + userDto.getEmail());
            return "failed";
        }
    }

    @GetMapping("/registerJdbc")
    public String showRegisterJdbc(Model model, @ModelAttribute UserDto userDto) {
        model.addAttribute("userDto", new UserDto());
        return "registerJdbc";
    }

    @PostMapping("/registerJdbc")
    public String processRegisterJdbc(Model model, @ModelAttribute UserDto userDto) {
        model.addAttribute("message", "success  " + userDto.getEmail());
        if (userService.createUserJdbc(userDto)) {

            return "success";
        } else {
            model.addAttribute("message", "failed  " + userDto.getEmail());
            return "failed";
        }
    }

    @GetMapping("/records")
    public String getUserRecords(Model model) {
        List<UserDto> userDtoList = userService.getAllUsers();
        model.addAttribute("users", userDtoList);
        return "records";
    }

    @GetMapping("/recordsJpa")
    public String getUserRecordsJpa(Model model) {
        List<UserDto> userDtoList = userService.getAllUsersJpa();
        model.addAttribute("users", userDtoList);
        return "records";
    }

    @GetMapping("/getprofile")
    public String getProfiles(Model model, @RequestParam String email) {
        UserDto userdto = userService.findByEmail(email);
        model.addAttribute("roles", roleService.findAllRoles());
        model.addAttribute("userDto", userdto);
        return "editprofile";
    }


    @GetMapping("/deleteemail/{email}")
    public String deleteEmail(Model model, @PathVariable String email) {
        UserDto userdto = userService.deleteByEmailService(email);
        model.addAttribute("userDto", userdto);
        return "deleteemail";
    }

    @GetMapping("/deleteemails/{email}")
    public String deleteEmailJdbc(Model model, @PathVariable String email) {
        boolean flag = userService.deleteByEmailServiceJdbc(email);
        model.addAttribute("message", email);
        return "deleteemail";
    }

    @GetMapping("/getprofileId/{id}")
    public String getProfilesId(Model model, @PathVariable long id) {
        UserDto userdto = userService.getByIdService(id);
        model.addAttribute("userDto", userdto);
        model.addAttribute("roles", roleService.findAllRoles());
        return "editprofile";
    }

    @GetMapping("/getprofileIdJdbc/{id}")
    public String getProfilesIdJdbc(Model model, @PathVariable long id) {
        UserDto userdto = userService.getByIdServiceJdbc(id);
        model.addAttribute("userDto", userdto);
        return "editprofileJdbc";
    }
    @GetMapping("/getprofileEmail/{email}")
    public String getProfilesEmail(Model model, @PathVariable String email) {
        UserDto userdto = userService.findByEmail(email);
        model.addAttribute("userDto", userdto);
        model.addAttribute("roles", roleService.findAllRoles());
        return "editprofile";
    }
    @GetMapping("/getprofileEmailJdbc/{email}")
    public String getProfilesEmailJdbc(Model model, @RequestParam String email) {
        UserDto userdto = userService.findByEmail(email);
        model.addAttribute("userDto", userdto);
        model.addAttribute("roles", roleService.findAllRoles());
        return "editprofileJdbc";
    }


    @GetMapping("/updatebyidjpa")
    public String showUpdateByIdPage(Model model, @RequestParam long id) {
        UserDto userDto = userService.getByIdService(id);
        model.addAttribute("userDto", userDto);
        return "editprofile";
    }

    @PostMapping("/saveprofile")
    public String saveUpdateByIdPage(Model model, UserDto userDto) {
        UserDto savedUser = userService.updateByIdService(userDto);
        if (savedUser == null) {
            model.addAttribute("message", "update unsuccessful");
        } else {

            model.addAttribute("message", "successful");
        }
        return "redirect:/user/records";
    }

    @PostMapping("/saveprofileJdbc")
    public String saveUpdateByIdPageJdbc(Model model, UserDto userDto) {
        UserDto savedUser = userService.updateUserJdbc(userDto);
        if (savedUser == null) {
            model.addAttribute("message", "update unsuccessful");
        } else {

            model.addAttribute("message", "successful");
        }
        return "redirect:/user/records";
    }
}