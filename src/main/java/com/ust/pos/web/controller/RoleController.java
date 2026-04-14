package com.ust.pos.web.controller;

import com.ust.pos.dto.RoleDto;
import com.ust.pos.service.impl.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/role")
public class RoleController {
    @Autowired
    RoleService roleService;

    @PostMapping("addRole")
    public String addingRole(Model model, @ModelAttribute RoleDto roleDto) {
        roleService.addRole(roleDto);
        model.addAttribute("role", "role added successfully");
        return "redirect:/role/allRoles";
    }

    @GetMapping("addRole")
    public String addRole(Model model, @ModelAttribute RoleDto roleDto) {
        model.addAttribute("role", "add role");
        return "addRole";
    }

    @GetMapping("/allRoles")
    public String allUsers(Model model) {
        model.addAttribute("roles", roleService.allUsers());
        return "allRoles";
    }

    @GetMapping("/deleteRole")
    public String deleteRole(Model model, @RequestParam long id) {
        roleService.deletebyId(id);
        return "redirect:/role/allRoles";
    }

    @GetMapping("/getRole")
    public String getRole(Model model, @RequestParam long id) {
        RoleDto roleDto1 = roleService.findById(id);
        model.addAttribute("role", roleDto1);
        return "updateRole";
    }

    @PostMapping("/updateRole")
    public String update(Model model, @ModelAttribute RoleDto roleDto) {
        if (roleService.UpdateData(roleDto) == false) {
            model.addAttribute("message", "Email already exists");
        } else {
            return "redirect:/role/allRoles";
        }
        return "success";
    }

    @PostMapping("addRoleJdbc")
    public String addingRoleJdbc(Model model, @ModelAttribute RoleDto roleDto) {
        roleService.addRoleJdbc(roleDto);
        model.addAttribute("role", "role added successfully");
        return "addRole";
    }

    @GetMapping("addRoleJdbc")
    public String addRoleJdbc(Model model, @ModelAttribute RoleDto roleDto) {
        model.addAttribute("role", "add role");
        return "redirect:/role/allRoles";
    }

    @GetMapping("/allRolesJdbc")
    public String allUsersJdbc(Model model) {
        model.addAttribute("roles", roleService.findAllRoles());
        return "allRoles";
    }

    @GetMapping("/deleteRoleJdbc")
    public String deleteRoleJdbc(Model model, @RequestParam long id) {
        roleService.deleteByIdJdbc(id);
        return "redirect:/role/allRoles";
    }
}