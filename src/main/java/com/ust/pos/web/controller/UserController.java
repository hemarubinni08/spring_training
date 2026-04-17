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
    private UserService userService;

    @Autowired
    private RoleService roleService;

    @PostMapping("/register_jdbc")
    public String userRegister_Jdbc(@ModelAttribute UserDto userDto, Model model) {

        model.addAttribute("email", userDto.getEmail());

        if (userService.saveAUserJdbc(userDto)) {
            return "success";
        }

        return "failed";
    }

    @GetMapping("/register_jdbc")
    public String registerPageJdbc(Model model) {

        model.addAttribute("userDto", new UserDto());

        return "registerjdbc";
    }

    @PostMapping("/register")
    public String userRegister(@ModelAttribute UserDto userDto, Model model) {

        model.addAttribute("email", userDto.getEmail());

        if (userService.saveAUSer(userDto)) {
            return "success";
        }

        return "failed";
    }

    @GetMapping("/register")
    public String registerPage(Model model) {

        model.addAttribute("roles", roleService.listRoles());

        return "register";
    }

    @GetMapping("/listusers")
    public String fetchAllUsersUsingJpa(Model model) {

        model.addAttribute("users", userService.fetchAllUsersListUsingJpa());


        return "listusersjpa";
    }

    @GetMapping("/listusersjdbc")
    public String fetchAllUsersUsingJdbc(Model model) {

        model.addAttribute("users", userService.fetchAllUsersList());

        return "listusers";
    }

    @GetMapping("/getuserprofile")
    public String fetchUserProfileUsingRP(Model model, @RequestParam String email) {

        UserDto user = userService.findByEmail(email);
        model.addAttribute("user", user);

        return "profilepage";
    }

    @GetMapping("/getuserprofile/{email}")
    public String fetchUserProfileUsingPV(Model model, @PathVariable String email) {

        UserDto user = userService.findByEmail(email);
        List<RoleDto> roleDto = roleService.listRoles();

        model.addAttribute("user", user);
        model.addAttribute("roles", roleDto);

        return "profilepage";
    }

    @GetMapping("/getuserprofileusingjpa")
    public String fetchUserProfileUsingRPJpa(Model model, @RequestParam String email) {

        UserDto user = userService.findByEmailUsingJpa(email);
        List<RoleDto> roleDto = roleService.listRoles();

        model.addAttribute("user", user);
        model.addAttribute("roles", roleDto);

        return "profilepage";
    }

    @GetMapping("/getuserprofileusingjpa/{email}")
    public String fetchUserProfileUsingPVJpa(Model model, @PathVariable String email) {

        UserDto user = userService.findByEmailUsingJpa(email);
        List<RoleDto> roleDto = roleService.listRoles();

        model.addAttribute("user", user);
        model.addAttribute("roles", roleDto);


        return "profilepage";
    }

    @GetMapping("/deletebyemail/{email}")
    public String deleteByEmailController(Model model, @PathVariable String email) {

        UserDto user = userService.deleteByEmailService(email);
        model.addAttribute("email", email);

        return "deletebyemail";
    }

    @GetMapping("/deletebyemailusingjdbc/{email}")
    public String deleteByEmailControllerUsingJdbc(Model model, @PathVariable String email) {

        boolean message = userService.deleteByEmailServiceJdbc(email);
        model.addAttribute("email", email);
        model.addAttribute("user", message);

        return "deletebyemail";
    }

    @GetMapping("/profilebyid/{id}")
    public String getProfileById(Model model, @PathVariable Long id) {

        UserDto userDto = userService.findByIdService(id);
        List<RoleDto> roleDto = roleService.listRoles();

        model.addAttribute("roles", roleDto);
        model.addAttribute("user", userDto);

        return "profilepage";
    }

    @GetMapping("/update/{id}")
    public String updateUserService(Model model, @PathVariable Long id) {

        UserDto userDto = userService.findByIdService(id);
        List<RoleDto> roleDto = roleService.listRoles();

        model.addAttribute("roles", roleDto);
        model.addAttribute("user", userDto);

        return "updateuser";
    }

    @GetMapping("/profilebyidusingjdbc/{id}")
    public String getProfileByIdUsingJdbc(Model model, @PathVariable Long id) {

        UserDto userDto = userService.findByIdServiceUsingJdbc(id);
        model.addAttribute("user", userDto);

        return "profilepage";
    }

    @PostMapping("/update")
    public String updateProfileUsingJpa(Model model, @ModelAttribute UserDto userDto) {

        if (userService.updateUsingJpaService(userDto) == null) {
            model.addAttribute("message", userDto.getMessage());
            return "failed";
        }

        model.addAttribute("message", userDto.getMessage());

        return "successforupdate";
    }

    @PostMapping("/updatejdbc")
    public String updateProfileUsingJdbc(Model model, @ModelAttribute UserDto userDto) {

        if (userService.updateUsingJpaServiceUsingJdbc(userDto) < 1) {

            model.addAttribute("message", userDto.getMessage());
            return "failed";
        }

        model.addAttribute("message", userDto.getMessage());

        return "successforupdate";
    }


}
