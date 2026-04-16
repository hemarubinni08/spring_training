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

    @GetMapping("/roleslistjpa")
    public String listRolesJpa(Model model, @ModelAttribute RoleDto roleDto) {
        model.addAttribute("rolesList", roleService.getRolesListJpa());
        return "roleslist";
    }

    @GetMapping("/roleslistjdbc")
    public String listRolesJdbc(Model model, @ModelAttribute RoleDto roleDto) {
        model.addAttribute("rolesList", roleService.getRolesListJdbc());
        return "roleslist";
    }

    @GetMapping("/addrolejpa")
    public String addRoleJpa() {
        return "addrolejpa";
    }

    @PostMapping("/addrolejpa")
    public String addRoleJpa(Model model, @ModelAttribute RoleDto roleDto) {
        boolean addSuccess = roleService.addRoleJpa(roleDto);

        if (addSuccess) {
            model.addAttribute("message", "Role Added Successfully");
        } else {
            model.addAttribute("message", "Failed");
        }

        return "redirect:/role/roleslistjpa";
    }

    @GetMapping("/addrolejdbc")
    public String addRoleJdbc() {
        return "addrolejdbc";
    }

    @PostMapping("/addrolejdbc")
    public String addRoleJdbc(Model model, @ModelAttribute RoleDto roleDto) {
        boolean addSuccess = roleService.addRoleJdbc(roleDto);

        if (addSuccess) {
            model.addAttribute("message", "Role Added Successfully");
        } else {
            model.addAttribute("message", "Failed");
        }

        return "redirect:/role/roleslistjdbc";
    }

    @GetMapping("/editrolejpa")
    public String editRoleJpa(@RequestParam long id, Model model) {
        model.addAttribute("roleDetails", roleService.findRoleByIdJpa(id));
        return "editrolejpa";
    }

    @GetMapping("/editrolejdbc")
    public String editRoleJdbc(@RequestParam long id, Model model) {
        model.addAttribute("roleDetails", roleService.findRoleByIdJdbc(id));
        return "editrolejdbc";
    }

    @PostMapping("/editrolejpa")
    public String editRoleJpa(@ModelAttribute RoleDto roleDto) {
        roleService.editRoleJpa(roleDto);
        return "redirect:/role/roleslistjpa";
    }

    @PostMapping("/editrolejdbc")
    public String editRoleJdbc(@ModelAttribute RoleDto roleDto) {
        roleService.editRoleJdbc(roleDto);
        return "redirect:/role/roleslistjdbc";
    }

    @GetMapping("/deleterolejpa")
    public String deleteRoleJpa(@RequestParam long id) {
        roleService.deleteRoleJpa(id);
        return "redirect:/role/roleslistjpa";
    }

    @GetMapping("/deleterolejdbc")
    public String deleteRoleJdbc(@RequestParam long id) {
        roleService.deleteRoleJdbc(id);
        return "redirect:/role/roleslistjdbc";
    }
}
