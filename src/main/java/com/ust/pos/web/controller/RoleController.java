package com.ust.pos.web.controller;

import com.ust.pos.dto.RoleDto;

import com.ust.pos.service.Impl.RoleService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/Role")
public class RoleController {
    @Autowired
    private RoleService roleService;

    @GetMapping("/getAllRoles")
    public String getAllRoles(Model model) {
        List<RoleDto> roles = roleService.findAllRoles();
        model.addAttribute("roles", roles);
        return "allRoles";
    }

    @GetMapping("/addRole")
    public String addRole(Model model) {
        model.addAttribute("roleDto", new RoleDto());
        return "addRole";
    }

    @PostMapping("/addRole")
    public String addRole(Model model, @ModelAttribute RoleDto roleDto) {
        RoleDto resultDto = roleService.addRole(roleDto);
        model.addAttribute("status", resultDto);
        if (resultDto.getMessage() == null) {
            model.addAttribute("success", "Role added Successfully!");
        }
        return "addRole";
    }

    @GetMapping("/deleteRole")
    public String deleteRole(@RequestParam Long id) {
        roleService.deleteRole(id);
        return "redirect:/Role/getAllRoles";
    }

    @GetMapping("/editRole")
    public String editRole(@RequestParam Long id, Model model) {
        RoleDto role = roleService.findById(id);
        model.addAttribute("role", role);
        return "editRole";
    }

    @PostMapping("/editRole")
    public String editRole(@ModelAttribute RoleDto role, @RequestParam Long id, Model model) {

        roleService.editRole(role);
        model.addAttribute("role", role);

        if (role.getMessage() == null) {
            model.addAttribute("success", "Role updated successfully");
        } else {
            model.addAttribute("error", role.getMessage());
        }

        return "editRole";
    }

    @GetMapping("/addRoleJdbc")
    public String addRoleJdbc(Model model) {
        model.addAttribute("roleDto", new RoleDto());
        return "addRole";
    }

    @PostMapping("/addRoleJdbc")
    public String addRoleJdbc(Model model, @ModelAttribute RoleDto roleDto) {

        RoleDto resultDto = roleService.addRoleJdbc(roleDto);
        model.addAttribute("status", resultDto);
        return "redirect:/Role/getAllRoles";
    }
}
