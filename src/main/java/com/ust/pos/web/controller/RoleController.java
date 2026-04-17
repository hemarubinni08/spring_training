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

    @GetMapping("/addRole")
    public String AddRolePage(Model model, @ModelAttribute RoleDto roleDto) {
        model.addAttribute("role", roleDto);
        return "addRole";
    }

    @PostMapping("/addRole")
    public String saveRole(Model model, @ModelAttribute RoleDto roleDto) {
        RoleDto result = roleService.addRole(roleDto);
        if (result == null) {
            model.addAttribute("error", "Role already exists");
            return "addRole";
        }
        model.addAttribute("message", "addedd successfully");
        return "addRole";
    }

    @GetMapping("list")
    public String listRoles(Model model) {
        model.addAttribute("roles", roleService.listAllRoles());
        return "listAllRoles";
    }

    @GetMapping("/delete/{id}")
    public String deleteRole(@PathVariable Long id) {
        roleService.deleteRoleById(id);
        return "redirect:/role/list";
    }

    @GetMapping("/edit/{id}")
    public String editRole(@PathVariable Long id, Model model) {
        model.addAttribute("roleDto", roleService.getRoleById(id));
        return "updateRole";
    }

    @PostMapping("/update")
    public String updateRole(@ModelAttribute RoleDto roleDto, Model model) {
        if (roleService.roleFindsForUpdate(roleDto.getName(), roleDto.getId())) {
            model.addAttribute("error", "Role name already exists");
            model.addAttribute("roleDto", roleDto);
            return "updateRole";
        }
        roleService.updateRole(roleDto);
        return "redirect:/role/list?msg=updated";
    }

    @GetMapping("/addRoleJdbc")
    public String showJdbcForm() {
        return "role-add-jdbc";
    }

    @PostMapping("/add-jdbc")
    public String addRoleJdbc(@ModelAttribute RoleDto roleDto, Model model) {
        String roleName = roleDto.getName().trim();
        if (roleService.existsByNameJdbc(roleName)) {
            model.addAttribute("error", "Already exists");
            model.addAttribute("role", roleDto);
            return "role-add-jdbc"; // stay on same page
        }
        roleDto.setName(roleName);
        roleService.addJdbc(roleDto);
        return "role-add-jdbc-success";
    }

    @GetMapping("/list-jdbc")
    public String getAllRolesJdbc(Model model) {
        model.addAttribute("roles", roleService.getAllRolesJdbc());
        return "role-list-jdbc";
    }

    @GetMapping("/delete-jdbc/{id}")
    public String deleteRoleJdbc(@PathVariable Long id) {
        roleService.deleteRoleJdbc(id);
        return "redirect:/role/list-jdbc";
    }

    @GetMapping("/edit-jdbc/{id}")
    public String editRoleJdbc(@PathVariable Long id, Model model) {
        RoleDto role = roleService.getRoleByIdJdbc(id);
        model.addAttribute("role", role);
        return "role-edit-jdbc";
    }

    @PostMapping("/update-jdbc")
    public String updateRoleJdbc(@ModelAttribute RoleDto roleDto, Model model) {
        if (roleService.existsByNameJdbc(roleDto.getName())) {
            model.addAttribute("error", "Already exists");
            model.addAttribute("role", roleDto);
            return "role-edit-jdbc";
        }
        roleService.updateRoleJdbc(roleDto);
        return "redirect:/role/list-jdbc";
    }
}