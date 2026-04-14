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
    private RoleService roleService;

    @GetMapping("/addrole")
    public String addRole(Model model) {
        model.addAttribute("roleDto", new RoleDto());
        return "addRole";
    }

    @PostMapping("/addrole")
    public String addRole(Model model, @ModelAttribute RoleDto roleDto) {
        boolean success = roleService.addRole(roleDto);

        if (!success) {
            model.addAttribute("statusMessage",
                    roleDto.getName() + " already exists.");
        } else {
            model.addAttribute("statusMessage",
                    roleDto.getName()
                            + " added successfully.");
        }

        return "redirect:/role/listallroles";
    }

    @GetMapping("/addrolejdbc")
    public String addRoleJdbc(Model model) {
        model.addAttribute("roleDto", new RoleDto());
        return "addRoleJdbc";
    }

    @PostMapping("/addrolejdbc")
    public String addRoleJdbc(Model model, @ModelAttribute RoleDto roleDto) {
        boolean success = roleService.addRoleJdbc(roleDto);

        if (!success) {
            model.addAttribute("statusMessage",
                    roleDto.getName() + " already exists.");
        } else {
            model.addAttribute("statusMessage",
                    roleDto.getName() + " added successfully.");
        }

        return "rolestatus";
    }

    @GetMapping("/listallroles")
    public String rolesListJpa(Model model) {
        model.addAttribute("rolesList", roleService.getAllRoles());
        return "listAllRoles";
    }

    @GetMapping("/listallrolesjdbc")
    public String rolesListJdbc(Model model) {
        model.addAttribute("rolesList", roleService.getAllRolesJdbc());
        return "listAllRolesJdbc";
    }

    @GetMapping("/getrolebyidjpa")
    public String getRoleByIdJpa(Model model, @RequestParam Long id) {
        model.addAttribute("roledata", roleService.getProfile(id));
        return "roleProfile";
    }

    @GetMapping("/getrolebyidjdbc/{id}")
    public String getRoleByIdJdbc(Model model, @PathVariable Long id) {
        model.addAttribute("roledata", roleService.getProfileJdbc(id));
        return "roleProfile";
    }

    @PostMapping("/updaterole")
    public String updateRoleJpa(@ModelAttribute RoleDto roleDto) {
        roleService.updateRole(roleDto);
        return "redirect:/role/listallroles";
    }

    @PostMapping("/updaterolejdbc")
    public String updateRoleJdbc(@ModelAttribute RoleDto roleDto) {
        roleService.updateRoleJdbc(roleDto);
        return "redirect:/role/listallrolesjdbc";
    }


    @GetMapping("/deleterolejpa")
    public String deleteRoleJpa(@RequestParam Long id) {
        roleService.deleteById(id);
        return "redirect:/role/listallroles";
    }

    @GetMapping("/deleterolejdbc")
    public String deleteRoleJdbc(@RequestParam Long id) {
        roleService.deleteByIdJdbc(id);
        return "redirect:/role/listallroles";
    }
}