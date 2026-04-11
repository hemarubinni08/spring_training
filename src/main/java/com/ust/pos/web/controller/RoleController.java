package com.ust.pos.web.controller;

import com.ust.pos.dto.RoleDto;
import com.ust.pos.service.RoleService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.beans.factory.annotation.Autowired;

@Controller
@RequestMapping("/role")
public class RoleController {

    @Autowired
    private RoleService roleService;

    @GetMapping("/addroles")
    public String showRoles(Model model) {
        model.addAttribute("role", new RoleDto());
        model.addAttribute("roles", roleService.getAllRoles());
        return "addRole";
    }

    @PostMapping("/addroles")
    public String addRole(
            @ModelAttribute("role") RoleDto roleDto,
            Model model) {

        boolean added = roleService.createRole(roleDto);

        if (!added) {
            model.addAttribute("errorMessage", "Role name already exists");
        } else {
            model.addAttribute("successMessage", "Role added successfully");
        }

        model.addAttribute("role", new RoleDto());
        model.addAttribute("roles", roleService.getAllRoles());
        return "addRole";
    }

    @PostMapping("/update")
    public String updateRole(
            @ModelAttribute("role") RoleDto roleDto,
            Model model) {

        boolean updated = roleService.updateRole(roleDto);

        if (!updated) {
            model.addAttribute("errorMessage", "Role name already exists");
        } else {
            model.addAttribute("successMessage", "Role updated successfully");
        }

        model.addAttribute("role", new RoleDto());
        model.addAttribute("roles", roleService.getAllRoles());
        return "addRole";
    }

    @GetMapping("/delete/{id}")
    public String deleteRole(@PathVariable Long id) {
        roleService.deleteRole(id);
        return "redirect:/role/addroles";
    }

    @GetMapping("/addjdbc")
    public String showRolePage(Model model) {
        model.addAttribute("role", new RoleDto());
        model.addAttribute("roles", roleService.getAllRolesJdbc());
        return "roleJdbc";
    }

    @PostMapping("/addjdbc")
    public String addRoleJdbc(@ModelAttribute("role") RoleDto roleDto,
                              Model model) {

        boolean added = roleService.createRoleJdbc(roleDto);

        if (!added) {
            model.addAttribute("errorMessage", "Role already exists");
        } else {
            model.addAttribute("successMessage", "Role added successfully");
        }

        model.addAttribute("role", new RoleDto());
        model.addAttribute("roles", roleService.getAllRolesJdbc());
        return "roleJdbc";
    }

    @PostMapping("/updatejdbc")
    public String updateRolejdbc(@ModelAttribute("role") RoleDto roleDto,
                                 Model model) {

        boolean updated = roleService.updateRoleJdbc(roleDto);

        if (!updated) {
            model.addAttribute("errorMessage", "Role already exists");
        } else {
            model.addAttribute("successMessage", "Role updated successfully");
        }

        model.addAttribute("role", new RoleDto());
        model.addAttribute("roles", roleService.getAllRolesJdbc());
        return "roleJdbc";
    }

    @GetMapping("/deletejdbc/{id}")
    public String deleteRolejdbc(@PathVariable Long id) {
        roleService.deleteRoleJdbc(id);
        return "redirect:/role/addjdbc";
    }
}