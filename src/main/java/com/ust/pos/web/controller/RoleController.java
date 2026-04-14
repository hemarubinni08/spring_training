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

    @GetMapping("/addRoleJpa")
    public String addRoleJpa(Model model, @ModelAttribute RoleDto roleDto) {
        model.addAttribute("name", "Add role successful");
        return "addRole";
    }

    @PostMapping("/addRoleJpa")
    public String addingRoleJpa(Model model, @ModelAttribute RoleDto roleDto) {
        RoleDto roleDto1 = roleService.addRoleJdbc(roleDto);
        model.addAttribute("role", roleDto1);
        if (roleDto1.isSuccess()) {
            model.addAttribute("message", "Add role Successful");
        } else {
            model.addAttribute("message", "Role Already existed");
        }
        return "successRole";
    }

    @GetMapping("/addRoleJdbc")
    public String addRoleJdbc(Model model, @ModelAttribute RoleDto roleDto) {
        model.addAttribute("name", "Add role successful");
        return "addRole";
    }

    @PostMapping("/addRoleJdbc")
    public String addingRoleJdbc(Model model, @ModelAttribute RoleDto roleDto) {
        RoleDto roleDto1 = roleService.addRoleJdbc(roleDto);
        model.addAttribute("role", roleDto1);
        if (roleDto1.isSuccess()) {
            model.addAttribute("message", "Add role Successful");
        } else {
            model.addAttribute("message", "Role Already existed");
        }
        return "successRole";
    }

    @GetMapping("/update/by-idJpa/{id}")
    public String getProfileByIdJdbc(Model model, @PathVariable Long id) {
        RoleDto roles = roleService.getRolesByIdJpa(id);
        model.addAttribute("roleDto", new RoleDto());
        model.addAttribute("role", roles);
        return "updateRoles";
    }

    @PostMapping("/updateRoleJpa")
    public String updateJpa(Model model, @ModelAttribute RoleDto roleDto) {
        RoleDto roleDto1 = roleService.updateRoleJpa(roleDto);
        model.addAttribute("role", roleDto1);
        if (roleDto1.isSuccess()) {
            model.addAttribute("name", "Add role Successful");
        } else {
            model.addAttribute("name", "Role Already existed");
        }
        return "redirect:/role/allRolesJpa";
    }

    @GetMapping("/update/by-idJdbc/{id}")
    public String updateJdbc(Model model, @PathVariable Long id) {
        RoleDto role = roleService.getRolesByIdJdbc(id);
        model.addAttribute("role", role);
        if (role.isSuccess()) {
            model.addAttribute("name", "Add role Successful");
        } else {
            model.addAttribute("name", "Role Already existed");
        }
        return "updateRoles";
    }

    @PostMapping("/updateRoleJdbc")
    public String updateJdbc(Model model, @ModelAttribute RoleDto roleDto) {
        RoleDto roleDto1 = roleService.updateRoleJdbc(roleDto);
        model.addAttribute("user", roleDto1);
        if (roleDto1.isSuccess()) {
            model.addAttribute("name", "Add role Successful");
        } else {
            model.addAttribute("name", "Role Already existed");
        }
        return "redirect:/role/allRolesJdbc";
    }

    @GetMapping("/allRolesJpa")
    public String allRoleJpa(Model model) {
        model.addAttribute("role", roleService.findAllRoles());
        return "allRolesJpa";
    }

    @GetMapping("/allRolesJdbc")
    public String allRolesJdbc(Model model) {
        model.addAttribute("role", roleService.findAllRolesJdbc());
        return "allRolesJdbc";
    }

    @GetMapping("/deleteByIdJpa/{id}")
    public String deletebyIdJpa(Model model, @PathVariable Long id) {
        roleService.deleteRoleByIdJpa(id);
        return "redirect:/role/allRolesJpa";
    }

    @GetMapping("/deleteByIdJdbc/{id}")
    public String deletebyIdJdbc(Model model, @PathVariable long id) {
        roleService.deleteRoleByIdJdbc(id);
        return "redirect:/role/allRolesJdbc";
    }
}
