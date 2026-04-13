package com.ust.pos.web.controller;


import com.ust.pos.dto.RoleDto;
import com.ust.pos.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/role")
public class RoleController {

    @Autowired
    private RoleService roleService;

    // ================= ADD =================

    // JDBC
    @GetMapping("/addRoleJdbc")
    public String addRoleJdbc(Model model) {
        model.addAttribute("roleDto", new RoleDto());
        model.addAttribute("rolesList", roleService.getAllRolesUsingJdbc());
        return "rolesList";
    }


    @PostMapping("/addRoleJdbc")
    public String addRoleJdbc(@ModelAttribute RoleDto roleDto,RedirectAttributes redirectAttributes) {
        RoleDto response = roleService.createRoleUsingJdbc(roleDto);
        redirectAttributes.addFlashAttribute("message", response.getMessage());
        redirectAttributes.addFlashAttribute("colour", response.getColour());
        return "redirect:/role/showRolesListJdbc";
    }


    // JPA
    @PostMapping("/addRoleJpa")
    public String addRoleJpa(@ModelAttribute RoleDto roleDto,
                             RedirectAttributes redirectAttributes) {
        roleService.createRoleUsingJpa(roleDto);
        redirectAttributes.addFlashAttribute("message", "Role added successfully!");
        return "redirect:/role/showRolesListJpa";
    }

    // ================= LIST =================

    @GetMapping("/showRolesListJdbc")
    public String showRolesListJdbc(Model model) {
        model.addAttribute("rolesList", roleService.getAllRolesUsingJdbc());
        return "rolesList";
    }

    @GetMapping("/showRolesListJpa")
    public String showRolesListJpa(Model model) {
        model.addAttribute("rolesList", roleService.getAllRolesUsingJpa());
        return "rolesList";
    }

    // ================= DELETE =================

    @GetMapping("/deleteRoleJdbc/{id}")
    public String deleteRoleJdbc(@PathVariable long id,
                                 RedirectAttributes redirectAttributes) {
        roleService.deleteRoleUsingIdJdbc(id);
        redirectAttributes.addFlashAttribute("message", "Role deleted successfully!");
        return "redirect:/role/showRolesListJdbc";
    }

    @GetMapping("/deleteRoleJpa/{id}")
    public String deleteRoleJpa(@PathVariable long id,
                                RedirectAttributes redirectAttributes) {
        roleService.deleteRoleUsingIdJpa(id);
        redirectAttributes.addFlashAttribute("message", "Role deleted successfully!");
        return "redirect:/role/showRolesListJpa";
    }

    // ================= UPDATE =================

    @PostMapping("/updateRoleJdbc")
    public String updateRoleJdbc(@ModelAttribute RoleDto roleDto,
                                 RedirectAttributes redirectAttributes) {
        boolean updated = roleService.updateRoleUsingJdbc(roleDto);

        if (updated) {
            redirectAttributes.addFlashAttribute("message", "Role updated successfully!");
        } else {
            redirectAttributes.addFlashAttribute("message", "Role update failed!");
        }

        return "redirect:/role/showRolesListJdbc";
    }

    @PostMapping("/updateRoleJpa")
    public String updateRoleJpa(@ModelAttribute RoleDto roleDto,
                                RedirectAttributes redirectAttributes) {
        RoleDto response = roleService.updateRoleUsingJpa(roleDto);
        redirectAttributes.addFlashAttribute("message", response.getMessage());
        return "redirect:/role/roleProfileJpaById/" + roleDto.getId();
    }

    // ================= PROFILE =================

    @GetMapping("/roleProfileJpaById/{id}")
    public String roleProfileJpa(@PathVariable long id, Model model) {
        model.addAttribute("roleDto", roleService.getRoleByIdUsingJpa(id));
        return "roleProfile";
    }

    @GetMapping("/roleProfileJdbcById/{id}")
    public String roleProfileJdbc(@PathVariable long id, Model model) {
        model.addAttribute("roleDto", roleService.getRoleByIdUsingJdbc(id));
        return "roleProfile";
    }

}