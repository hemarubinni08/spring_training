package com.ust.pos.web.controller;

import com.ust.pos.dto.RoleDto;
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
    public String doRegister(Model model) {
        model.addAttribute("userDto", new UserDto());
        List<RoleDto> roles = roleService.retrieveAllRecords();
        model.addAttribute("roles", roles);
        return "register";
    }

    @PostMapping("/register")
    public String processRegister(Model model, @ModelAttribute UserDto userDto) {

        if (userService.updateUserDetailsById(userDto)) {
            model.addAttribute("message", "success" + userDto.getEmail());
            return "success";
        } else {
            model.addAttribute("message", "failed" + userDto.getEmail());
            return "failed";
        }
    }

    @GetMapping("/registerJdbc")
    public String doRegisterJdbc(Model model) {
        model.addAttribute("userDto", new UserDto());
        return "registerJdbc";
    }

    @PostMapping("/registerJdbc")
    public String processRegisterJdbc(Model model, @ModelAttribute UserDto userDto) {

        if (userService.createUserJdbc(userDto)) {
            model.addAttribute("message", "success" + userDto.getEmail());
            return "success";
        } else {
            model.addAttribute("message", "failed" + userDto.getEmail());
            return "failed";
        }
    }

    @GetMapping("/display")
    public String getAllRecords(Model model, @ModelAttribute UserDto userDto) {
        model.addAttribute("users", userService.retrieveAllRecords(userDto));
        return "records";
    }

    @GetMapping("/displayDto")
    public String getAllRecordsDto(Model model, @ModelAttribute UserDto userdto) {
        model.addAttribute("users", userService.retrieveAllRecordsDto());
        return "recordsDto";
    }

    @GetMapping("/getprofile")
    public String getProfile(Model model, @RequestParam String email) {
        UserDto userprofile = userService.getUserByEmailId(email);
        model.addAttribute("user", userprofile);
        return "userprofile";
    }

    @GetMapping("/getprofile/{email}")
    public String getProfilePath(Model model, @PathVariable("email") String email) {
        UserDto userprofile = userService.getUsersByEmailIdPath(email);
        model.addAttribute("user", userprofile);
        List<RoleDto> roles = roleService.retrieveAllRecords();
        model.addAttribute("roles", roles);
        return "userprofile";
    }

    @GetMapping("/getprofileJdbc")
    public String getProfileJdbc(Model model, @RequestParam String email) {
        UserDto userprofile = userService.getUsersByEmailIdJdbc(email);
        model.addAttribute("user", userprofile);
        List<RoleDto> roles = roleService.retrieveAllRecords();
        model.addAttribute("roles", roles);
        return "userprofile";
    }

    @GetMapping("/deleteprofile")
    public String deleteProfile(@RequestParam String email) {
        userService.deleteUsersByEmailId(email);
        return "redirect:/user/display";
    }

    @GetMapping("/deleteprofileJdbc")
    public String deleteProfileJdbc(@RequestParam String email) {
        userService.deleteUsersByEmailIdJdbc(email);
        return "redirect:/user/display";
    }

    @GetMapping("/getprofilebyid")
    public String getProfileById(Model model, @RequestParam long id) {
        UserDto userRecord = userService.findById(id);
        model.addAttribute("user", userRecord);
        List<RoleDto> roles = roleService.retrieveAllRecords();
        model.addAttribute("roles", roles);
        return "userprofile";
    }

    @GetMapping("/getprofilebyidjdbc")
    public String getProfileByIdJdbc(Model model, @RequestParam long id) {
        UserDto userRecord = userService.getUsersByIdJdbc(id);
        model.addAttribute("user", userRecord);
        List<RoleDto> roles = roleService.retrieveAllRecords();
        model.addAttribute("roles", roles);
        return "userprofile";
    }

    @PostMapping("/updateprofiledata")
    public String updateProfile(@ModelAttribute UserDto userDto, Model model) {
        UserDto updatedUser = userService.updateUserRecord(userDto);

        if (updatedUser == null) {
            model.addAttribute("user", userDto);
            List<RoleDto> roles = roleService.retrieveAllRecords();
            model.addAttribute("roles", roles);
            model.addAttribute("edit", true);
            model.addAttribute("error", "Email already exists");
            return "redirect:/user/display";
        }
        return "redirect:/user/display";
    }

    @GetMapping("/getProfile")
    public String getProfile(
            @RequestParam String email,
            @RequestParam(defaultValue = "false") boolean edit,
            Model model) {

        UserDto user = userService.getUserByEmailId(email);
        model.addAttribute("user", user);
        model.addAttribute("edit", edit);
        return "userprofile";
    }

    @PostMapping("/updateprofiledatajdbc")
    public String updateProfileJdbc(@ModelAttribute UserDto userDto, Model model) {
        UserDto updatedUser = userService.updateUserRecordJdbc(userDto);

        if (updatedUser == null) {
            model.addAttribute("user", userDto);
            List<RoleDto> roles = roleService.retrieveAllRecords();
            model.addAttribute("roles", roles);
            model.addAttribute("edit", true);
            model.addAttribute("error", "Email already exists");
            return "getProfile";
        }
        return "redirect:/user/display";
    }

    @GetMapping("/displayroles")
    public String getAllRoleRecords(Model model, @ModelAttribute UserDto userDto) {
        model.addAttribute("users", userService.retrieveAllRecords(userDto));
        return "rolerecords";
    }
}

