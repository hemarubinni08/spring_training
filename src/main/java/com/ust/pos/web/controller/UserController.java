package com.ust.pos.web.controller;

import com.ust.pos.dto.UserDto;
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

    @PostMapping("/register")
    public String userRegister(Model model, @ModelAttribute UserDto userDto) {
        boolean state = userService.createUser(userDto);
        String status = "";
        if (state) {
            status = "Success";
        } else {
            status = "Email already exist";
        }
        model.addAttribute("state", status);
        model.addAttribute("linkPage", "/user/register");
        return "success";
    }

    @GetMapping("/register")
    public String userRegister(Model model) {
        model.addAttribute("userDto", new UserDto());
        return "register";
    }

    @PostMapping("/registerJdbc")
    public String userRegisterJdbc(Model model, @ModelAttribute UserDto userDto) {
        boolean state = userService.createUserJdbc(userDto);
        String status = "";
        if (state) {
            status = "Success";
        } else {
            status = "Email already exist";
        }
        model.addAttribute("state", status);
        model.addAttribute("linkPage", "/user/registerJdbc");
        return "success";
    }

    @GetMapping("/registerJdbc")
    public String userRegisterJdbc(Model model) {
        model.addAttribute("userDto", new UserDto());
        return "registerJdbc";
    }

    @GetMapping("/getAllUsers")
    public  String getAllUsers(Model model){
        List<UserDto> userDtoList = userService.allUsersDto();
        model.addAttribute("UserDtoList",userDtoList);
        return "display";
    }

    @GetMapping("/getAllUsersJdbc")
    public  String getAllUsersJdbc(Model model){
        List<UserDto> userDtoList = userService.allUsersDtoJdbc();
        model.addAttribute("UserDtoList",userDtoList);
        return "display";
    }

    @GetMapping("/getUserByEmailJdbc")
    public String getByEmailRequestParamsJdbc(Model model, @RequestParam String email){
        System.out.println(email);
        UserDto userDto = userService.getByEmailJdbc(email );
        model.addAttribute("user", userDto);
        return "profile";
    }

    @GetMapping("/getUserByEmailJdbc/{email}")
    public String getByEmailPathVariableJdbc(Model model, @PathVariable String email){
        System.out.println(email);
        UserDto userDto = userService.getByEmailJdbc(email );
        model.addAttribute("user", userDto);
        return "profile";
    }
    @GetMapping("/getUserByEmailJpa")
    public String getByEmailRequestParamsJpa(Model model, @RequestParam String email){
        System.out.println(email);
        UserDto userDto = userService.getByEmailJpa(email );
        model.addAttribute("user", userDto);
        return "profile";
    }

    @GetMapping("/getUserByEmailJpa/{email}")
    public String getByEmailPathVariableJpa(Model model, @PathVariable String email){
        UserDto userDto = userService.getByEmailJpa(email );
        model.addAttribute("user", userDto);
        return "profile";
    }

    @GetMapping("/deleteByEmail/{email}")
    public String deleteUserById(Model model, @PathVariable String email){
        userService.deleteByEmailJpa(email);
        return "redirect:/user/getAllUsers";
    }

    @GetMapping("/deleteByEmailJdbc/{email}")
    public String deleteUserByIdJdbc(Model model, @PathVariable String email){
        userService.deleteByEmailJdbc(email);
        return "redirect:/user/getAllUsers";
    }

    @GetMapping("/getUserByIdJpa/{id}")
    public String getUserByIdJpa(Model model, @PathVariable Long id){
        UserDto userDto = userService.getUserByidJpa(id);
        model.addAttribute("user", userDto);
        model.addAttribute("userDto", new UserDto());
        return "profile";
    }

    @GetMapping("/getUserByIdJdbc/{id}")
    public String getUserByIdJdbc(Model model, @PathVariable Long id){
        UserDto userDto = userService.getUserByidJdbc(id);
        model.addAttribute("userDto", new UserDto());
        model.addAttribute("user", userDto);
        return "profile";
    }

    @PostMapping("/updateUserByIdJpa/{id}")
    public String updateUserByIdJpa(Model model, @ModelAttribute UserDto userDto){
        boolean state = userService.updateUserByid(userDto);
        if (state){
            return "redirect:/user/getAllUsers";
        }else {
            model.addAttribute("state", "User with same Email is already exist");
            model.addAttribute("linkPage", "/user/getAllUsers");
            return "success";
        }

    }

    @PostMapping("/updateUserByIdJdbc/{id}")
    public String updateUserByIdJdbc(Model model, @ModelAttribute UserDto userDto){
        boolean state = userService.updateUserByIdJdbc(userDto);
        if (state){
            return "redirect:/user/getAllUsers";
        }else {
            model.addAttribute("state", "User with same Email is already exist");
            model.addAttribute("linkPage", "/user/getAllUsers");
            return "success";
        }

    }
}
