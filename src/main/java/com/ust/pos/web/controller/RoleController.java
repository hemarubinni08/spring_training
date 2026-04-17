package com.ust.pos.web.controller;

import com.ust.pos.dto.RoleDto;
import com.ust.pos.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/role")
public class RoleController {
    @Autowired
    RoleService roleService;

    @GetMapping("/display")
    public String displayValues(Model model, @ModelAttribute RoleDto roleDto) {
        model.addAttribute("role", roleService.getAllUsersRoles());
        return "getAllRoles";
    }

    @GetMapping("/displayJdbc")
    public String displayValuesJdbc(Model model, @ModelAttribute RoleDto roleDto) {
        model.addAttribute("role", roleService.displayValuesJdbc());

        return "getAllRoles";
    }


    @GetMapping("/editProfile/{id}")
    public String editprofile(Model model, @PathVariable Long id) {
        RoleDto roleDto = roleService.findById(id);
        model.addAttribute("roleDto", roleDto);
        return "roleProfile";
    }

    @PostMapping("/editProfile")
    public String editprofile(Model model, @ModelAttribute RoleDto roleDto) {
        if (roleService.edit(roleDto)) {
            return "redirect:/role/display";
        }
        return "roleFail";
    }

    @GetMapping("/editProfileJdbc/{id}")
    public String editprofileJdbc(Model model, @PathVariable Long id) {
        RoleDto roleDto = roleService.findByIdJdbc(id);
        model.addAttribute("roleDto", roleDto);
        return "roleProfile";
    }


    @PostMapping("/editProfileJdbc")
    public String editprofileJdbc1(Model model, @ModelAttribute RoleDto roleDto) {

        if (roleService.editJdbc(roleDto)) {
            return "redirect:/role/displayJdbc";
        }

        return "roleFail";
    }

    @GetMapping("/addRole")
    public String addRole(Model model) {
        model.addAttribute("roleDto", new RoleDto());
        return "rolesList";
    }

    @PostMapping("/addRole")
    public String addRole1(@ModelAttribute RoleDto roleDto) {

        if (roleService.addRole(roleDto)) {
            return "roleSuccess";
        } else {
            return "roleFail";
        }

    }

    @GetMapping("/addRoleJdbc")
    public String addRoleJdbc(Model model) {
        model.addAttribute("roleDto", new RoleDto());
        return "rolesList";
    }

    @PostMapping("/addRoleJdbc")
    public String addRoleJdbc(@ModelAttribute RoleDto roleDto) {

        if (roleService.addRoleJdbc(roleDto)) {
            return "roleSuccess";
        } else {
            return "roleFail";
        }

    }

    @GetMapping("/deleteJdbc/{id}")
    public String deleteJdbc(@PathVariable long id) {

        roleService.deleteByIdJdbc(id);

        return "redirect:/role/displayJdbc";
    }

    @GetMapping("/delete/{id}")
    public String deleteRole(Model model, @PathVariable long id) {
        roleService.deleteById(id);
        return "redirect:/role/display";
    }
}