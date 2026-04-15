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

    // JPA
    @GetMapping("/add")
    public String addRole(Model model) {
        model.addAttribute("roleDto", new RoleDto());
        model.addAttribute("rolesList", roleService.getAllRoles());
        return "rolesList";
    }

    @PostMapping("/add")
    public String addRole(@ModelAttribute RoleDto roleDto, RedirectAttributes redirectAttributes) {
        roleService.createRole(roleDto);
        redirectAttributes.addFlashAttribute("message", "Role added successfully!");
        return "redirect:/role/list";
    }

    @GetMapping("/list")
    public String rolesList(Model model) {
        model.addAttribute("rolesList", roleService.getAllRoles());
        return "rolesList";
    }

    @GetMapping("/profile/{id}")
    public String roleProfile(@PathVariable long id, Model model) {
        model.addAttribute("roleDto", roleService.getRoleById(id));
        return "roleProfile";
    }

    @PostMapping("/update")
    public String updateRole(@ModelAttribute RoleDto roleDto,
                             RedirectAttributes redirectAttributes) {
        RoleDto response = roleService.updateRole(roleDto);
        redirectAttributes.addFlashAttribute("message", response.getMessage());
        return "redirect:/role/profile/" + roleDto.getId();
    }

    @GetMapping("/delete/{id}")
    public String deleteRole(@PathVariable long id, RedirectAttributes redirectAttributes) {
        roleService.deleteRole(id);
        redirectAttributes.addFlashAttribute("message", "Role deleted successfully!");
        return "redirect:/role/list";
    }


    /* JDBC */
    @GetMapping("/addRoleJdbc")
    public String addRoleJdbc(Model model) {
        model.addAttribute("roleDto", new RoleDto());
        model.addAttribute("rolesList", roleService.getAllRolesUsingJdbc());
        return "rolesList";
    }

    @PostMapping("/addRoleJdbc")
    public String addRoleJdbc(@ModelAttribute RoleDto roleDto, RedirectAttributes redirectAttributes) {
        RoleDto response = roleService.createRoleUsingJdbc(roleDto);
        redirectAttributes.addFlashAttribute("message", response.getMessage());
        redirectAttributes.addFlashAttribute("colour", response.getColour());
        return "redirect:/role/showRolesListJdbc";
    }

    @GetMapping("/showRolesListJdbc")
    public String showRolesListJdbc(Model model) {
        model.addAttribute("rolesList", roleService.getAllRolesUsingJdbc());
        return "rolesList";
    }

    @GetMapping("/roleProfileJdbcById/{id}")
    public String roleProfileJdbc(@PathVariable long id, Model model) {
        model.addAttribute("roleDto", roleService.getRoleByIdUsingJdbc(id));
        return "roleProfile";
    }

    @PostMapping("/updateRoleJdbc")
    public String updateRoleJdbc(@ModelAttribute RoleDto roleDto, RedirectAttributes redirectAttributes) {
        boolean updated = roleService.updateRoleUsingJdbc(roleDto);

        if (updated) {
            redirectAttributes.addFlashAttribute("message", "Role updated successfully!");
        } else {
            redirectAttributes.addFlashAttribute("message", "Role update failed!");
        }
        return "redirect:/role/showRolesListJdbc";
    }

    @GetMapping("/deleteRoleJdbc/{id}")
    public String deleteRoleJdbc(@PathVariable long id, RedirectAttributes redirectAttributes) {
        roleService.deleteRoleUsingIdJdbc(id);
        redirectAttributes.addFlashAttribute("message", "Role deleted successfully!");
        return "redirect:/role/showRolesListJdbc";
    }
}