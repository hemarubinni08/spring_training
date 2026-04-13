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
    public String addRolePage(Model model) {
        model.addAttribute("roleDto", new RoleDto());
        return "addRole";
    }

    @PostMapping("/addrole")
    public String addRole(@ModelAttribute RoleDto roleDto) {
        roleService.addRole(roleDto);
        return "redirect:/role/listallroles";
    }

    @GetMapping("/addrolejdbc")
    public String addRoleJdbcPage(Model model) {
        model.addAttribute("roleDto", new RoleDto());
        return "addRoleJdbc";
    }

    @PostMapping("/addrolejdbc")
    public String addRoleJdbc(@ModelAttribute RoleDto roleDto) {
        roleService.addRoleJdbc(roleDto);
        return "redirect:/role/listallrolesjdbc";
    }

    @GetMapping("/listallroles")
    public String listAllRoles(Model model) {
        model.addAttribute("role", roleService.getAllRoles());
        return "listAllRoles";
    }

    @GetMapping("/listallrolesjdbc")
    public String listAllRolesJdbc(Model model) {
        model.addAttribute("roles", roleService.getAllRolesJdbc());
        return "listAllRolesJdbc";
    }

    @GetMapping("/roleprofile/{id}")
    public String roleProfile(Model model, @PathVariable Long id) {
        model.addAttribute("roledata", roleService.getProfile(id));
        return "roleProfile";
    }

    @GetMapping("/roleprofilejdbc/{id}")
    public String roleProfileJdbc(Model model, @PathVariable Long id) {
        model.addAttribute("roledata", roleService.getProfileJdbc(id));
        return "roleProfileJdbc";
    }

    @PostMapping("/updaterole")
    public String updateRole(@ModelAttribute RoleDto roleDto) {
        roleService.updateRole(roleDto);
        return "redirect:/role/listallroles";
    }

    @PostMapping("/updateroleJdbc")
    public String updateRoleJdbc(@ModelAttribute RoleDto roleDto) {
        roleService.updateRoleJdbc(roleDto);
        return "redirect:/role/listallrolesjdbc";
    }

    @GetMapping("/deleterole/{id}")
    public String deleteRole(@PathVariable Long id) {
        roleService.deleteById(id);
        return "redirect:/role/listallroles";
    }

    @GetMapping("/deleterolejdbc/{id}")
    public String deleteRoleJdbc(@PathVariable Long id) {
        roleService.deleteByIdJdbc(id);
        return "redirect:/role/listallrolesjdbc";
    }
}