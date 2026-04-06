package com.ust.pos.web.controller;


import com.ust.pos.dto.UserDto;
import com.ust.pos.service.impl.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserService userService;


    @PostMapping("/registration")
    public String registration(Model model, @ModelAttribute UserDto userDto) {
        boolean isSuccess = userService.registration(userDto);
        model.addAttribute("userDto", userDto);

        if (isSuccess) {
            model.addAttribute("message", "Registration success");
        } else {
            model.addAttribute("message", "Registration failed");
        }
        return "success";

    }

    @GetMapping("/registration")
    public String doregistration(Model model, @ModelAttribute UserDto userDto) {
//        User user=new User();
        model.addAttribute("name", "keerthi");
        return "registration";
    }


    @PostMapping("/registerJdbc")
    public String userRegisterJdbc(Model model, @ModelAttribute UserDto userDto) {
        boolean userDto1 = userService.createUserJdbc(userDto);
        model.addAttribute("user", userDto1);
        if (userDto1) {
            model.addAttribute("message", "Registeration Successful");
        } else {
            model.addAttribute("message", "Email already exist");
        }
        return "success";
    }

    @GetMapping("/registerJdbc")
    public String doRegisterJdbc(Model model, @ModelAttribute UserDto userDto) {
        model.addAttribute("name", "Anu");
        return "sucess";
    }

}
