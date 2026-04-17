package com.ust.pos.web.controller;

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
    UserService userService;

    @Autowired
    RoleService roleService;

    @GetMapping("/register")
    public String register(Model model, @ModelAttribute UserDto userDto) {
        model.addAttribute("name", "Rohit");
        model.addAttribute("roles", roleService.getAllUsersRoles());
        return "register";
    }

    @PostMapping("/register")
    public String doRegister(Model model, @ModelAttribute UserDto userDto) {

        UserDto resultDto = userService.register(userDto);
        model.addAttribute("status", resultDto.getMessage());
        model.addAttribute("colour", resultDto.getColour());
        model.addAttribute("status2", resultDto.getMessage2());

        return "success";
    }

    @GetMapping("/registerJdbc")
    public String registerJdbc(Model model, @ModelAttribute UserDto userDto) {
        model.addAttribute("name", "Rohit");

        return "registerJdbc";
    }

    @PostMapping("/registerJdbc")
    public String doRegisterJdbc(Model model, @ModelAttribute UserDto userDto) {

        UserDto resultDto = userService.createUserUsingJdbc(userDto);
        model.addAttribute("status", resultDto.getMessage());
        model.addAttribute("colour", resultDto.getColour());
        model.addAttribute("status2", resultDto.getMessage2());

        return "success";
    }

    @GetMapping("/display")
    public String displayValues(Model model, @ModelAttribute UserDto userDto) {
        model.addAttribute("users", userService.getAllUsers());


        return "display";
    }

    @GetMapping("/displayJdbc")
    public String displayValuesJdbc(Model model, @ModelAttribute UserDto userDto) {
        model.addAttribute("users", userService.displayValuesJdbc());

        return "display";
    }

    @GetMapping("/displayByEmailByPathVariable/{email}")
    public String displayValuesByPathVariable(Model model, @PathVariable String email) {
        model.addAttribute("roles", roleService.getAllUsersRoles());
        model.addAttribute("user", userService.findByEmailPage(email));
        return "profile";
    }

    @GetMapping("/displayByEmailByRequestParameter")
    public String displayValuesByRequestMapping(Model model, @RequestParam String email) {

        model.addAttribute("user", userService.findByEmailPage(email));


        return "profile";
    }

    @GetMapping("/displayByEmailByPathVariableJdbc/{email}")
    public String displayValuesByPathVariableJdbc(Model model, @PathVariable String email) {

        model.addAttribute("user", userService.findByEmailPageJdbc(email));
        return "profile";
    }

    @GetMapping("/displayByEmailByRequestParameterJdbc")
    public String displayValuesByRequestMappingJdbc(Model model, @RequestParam String email) {

        model.addAttribute("user", userService.findByEmailPageJdbc(email));


        return "profile";
    }

    @GetMapping("/deleteByEmailJdbc/{email}")
    public String deleteUserByEmailJdbc(@PathVariable String email) {

        userService.deleteByEmailJdbc(email);

        return "redirect:/user/display";
    }

    @GetMapping("/deleteByEmail/{email}")
    public String deleteUserByEmail(@PathVariable String email) {

        userService.deleteByEmail(email);

        return "redirect:/user/display";
    }

    @GetMapping("/displayByIdByPathVariableJdbc/{id}")
    public String displayValuesByIdByPathVariableJdbc(Model model, @PathVariable Long id) {

        model.addAttribute("user", userService.findByIdJdbc(id));
        return "profile";
    }

    @GetMapping("/displayByIdByRequestParam")
    public String displayValuesByIdByRequestMapping(Model model, @RequestParam Long id) {

        model.addAttribute("user", userService.findById(id));
        model.addAttribute("roles", roleService.getAllUsersRoles());

        return "profile";
    }

    @GetMapping("/editProfile/{id}")
    public String editprofile1(Model model,@PathVariable long id) {

      UserDto userDto = userService.findById(id);
      model.addAttribute("user",userDto);
      model.addAttribute("roles",roleService.getAllUsersRoles());

        return "editProfile";
    }

    @PostMapping("/editProfile/{id}")
    public String editprofile(Model model, @ModelAttribute UserDto userDto,@PathVariable long id) {

        userService.edit(userDto);

        return "redirect:/user/display";
    }

    @PostMapping("/editProfileJdbc")
    public String editprofileJdbc(Model model, @ModelAttribute UserDto userDto) {

        userService.editJdbc(userDto);

        return "redirect:/user/display";
    }
}