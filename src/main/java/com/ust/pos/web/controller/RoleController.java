package com.ust.pos.web.controller;

import com.ust.pos.dto.RoleDto;
import com.ust.pos.service.RoleService;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/role")
public class RoleController {
    @Autowired
    private RoleService roleService;
    @Autowired
    private ModelMapper modelMapper;

    @GetMapping("/addRole")
    public String showForm(Model model) {
        return "role-add";
    }

    @PostMapping("/add")
    public String addRole(@ModelAttribute RoleDto roleDto, Model model) {
        String roleName = roleDto.getName().trim();
        if (roleService.existsByNameJpa(roleName)) {
            model.addAttribute("error", "Already exists");
            model.addAttribute("role", roleDto);
            return "role-exists";
        }
        roleDto.setName(roleName);
        roleService.addRoleJpa(roleDto);
        return "role-success";
    }

    @GetMapping("/list")
    public String getAllRoles(Model model) {
        List<RoleDto> roles = roleService.getAllRolesJpa();
        model.addAttribute("roles", roles);
        return "role-list";
    }

    @GetMapping("/delete/{id}")
    public String deleteRole(@PathVariable Long id) {
        roleService.deleteRoleById(id);
        return "redirect:/role/list";
    }

    @GetMapping("/edit/{id}")
    public String editRole(@PathVariable Long id, Model model) {
        RoleDto role = roleService.getRoleByIdJpa(id);
        model.addAttribute("role", role);
        return "role-edit";
    }

    @PostMapping("/update")
    public String updateRole(@ModelAttribute RoleDto roleDto, Model model) {
        if (roleService.existsByNameJpa(roleDto.getName())) {
            model.addAttribute("error", "Role already exists!");
            model.addAttribute("role", roleDto);
            return "role-edit";
        }
        roleService.updateRoleJpa(roleDto);
        return "redirect:/role/list";
    }

    ///  Using Jdbc :
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
        roleService.addRoleJdbc(roleDto);
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
