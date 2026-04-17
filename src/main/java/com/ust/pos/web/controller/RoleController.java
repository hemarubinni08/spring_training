package com.ust.pos.web.controller;

import com.ust.pos.dto.RoleDto;
import com.ust.pos.service.impl.RoleServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/role")

public class RoleController {

    @Autowired
    RoleServiceImpl roleService;

    @GetMapping("/addRole")
    public String showRole(Model model, @ModelAttribute RoleDto roleDto) {

        model.addAttribute("name", "Bewin");
        return "addRole";
    }

    @PostMapping("/addRole")
    public String processRole(Model model, @ModelAttribute RoleDto roleDto) {

        String message = roleService.addRole(roleDto);
        model.addAttribute("message", message);
        return "redirect:/role/showAllRoles";
    }

    @GetMapping("/showAllRoles")
    public String showAllRoles(Model model) {

        model.addAttribute("roles", roleService.getAllRoles());
        return "showAllRoles";
    }

    @GetMapping("/deleteRole")
    public String deleteRole(@RequestParam long id) {

        roleService.deleteByIdService(id);
        return "redirect:/role/showAllRoles";
    }

    @GetMapping("/editRole")
    public String editRole(@RequestParam long id, Model model) {

        RoleDto roleDto = roleService.getRoleById(id);
        model.addAttribute("role", roleDto);
        return "editRole";
    }


    @PostMapping("/saveRole")
    public String saveRole(RoleDto roleDto, Model model) {

        RoleDto savedUser = roleService.updateRole(roleDto);
        model.addAttribute("savedUser", savedUser);
        return "redirect:/role/showAllRoles";
    }

    @GetMapping("/addRoleJdbc")
    public String showRoleJdbc(Model model, @ModelAttribute RoleDto roleDto) {

        model.addAttribute("name", "Bewin");
        return "addRoleJdbc";
    }

    @PostMapping("/addRoleJdbc")
    public String processRoleJdbc(Model model, @ModelAttribute RoleDto roleDto) {

        roleService.addRoleJdbc(roleDto);
        return "redirect:/role/showAllRolesJdbc";
    }

    @GetMapping("/showAllRolesJdbc")
    public String showAllRolesJdbc(Model model) {

        model.addAttribute("roles", roleService.getAllRolesJdbc());
        return "showAllRolesJdbc";
    }


    @GetMapping("/editRoleJdbc")
    public String editRoleJdbc(@RequestParam long id, Model model) {

        RoleDto roleDto = roleService.getRoleByIdJdbc(id);
        model.addAttribute("role", roleDto);
        return "editRoleJdbc";
    }


    @PostMapping("/saveRoleJdbc")
    public String saveRoleJdbc(RoleDto roleDto, Model model) {

        roleService.updateRoleJdbc(roleDto);
        return "redirect:/role/showAllRolesJdbc";
    }

    @GetMapping("/deleteRoleJdbc")
    public String deleteRoleJdbc(@RequestParam long id) {

        roleService.deleteRoleJdbc(id);
        return "redirect:/role/showAllRolesJdbc";
    }
}
