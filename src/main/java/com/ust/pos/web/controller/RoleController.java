package com.ust.pos.web.controller;

import com.ust.pos.dto.RoleDto;
import com.ust.pos.service.RoleService;
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

    @PostMapping("/addRole")
    public String addRole(Model model, @ModelAttribute RoleDto roleDto) {

        RoleDto roleDto1 = roleService.saveRoleData(roleDto);

        if (roleDto1 == null) {
            model.addAttribute("message", "Role already exists");
            return "addrole";
        }

        model.addAttribute("message", "Role added");
        model.addAttribute("roleDto", new RoleDto());
        return "addrole";
    }

    @GetMapping("/addRole")
    public String addRole(Model model) {
        model.addAttribute("message", new RoleDto());
        return "addrole";
    }

    @PostMapping("/addRoleJdbc")
    public String addRoleJdbc(Model model, @ModelAttribute RoleDto roleDto) {
        boolean state = roleService.saveRoleDataJdbc(roleDto);
        if (state) {
            return "Success";
        } else {
            return "! Email already exists";
        }
    }

    @GetMapping("/addRoleJdbc")
    public String addRoleJdbc(Model model) {
        model.addAttribute("name", "Navaneeth");
        return "addrolejdbc";
    }

    @GetMapping("/roles")
    public String getRoles(Model model) {
        List<RoleDto> roles = roleService.getAllRoles();
        model.addAttribute("roles", roles);
        return "roles";
    }

    @GetMapping("/rolesJdbc")
    public String getRolesJdbc(Model model) {
        List<RoleDto> roles = roleService.getAllRolesJdbc();
        model.addAttribute("roles", roles);
        return "roles";
    }

    @GetMapping("/deleteRole/{id}")
    public String deleteRole(@PathVariable Long id) {
        roleService.deleteById(id);
        return "redirect:/role/roles";
    }

    @GetMapping("/deleteRoleJdbc/{id}")
    public String deleteRoleJdbc(@PathVariable Long id) {
        roleService.deleteByIdJdbc(id);
        return "redirect:/role/roles";
    }

    @GetMapping("/getRoleById")
    public String getRoleById(Model model, @RequestParam Long id) {
        RoleDto roleDto = roleService.findById(id);
        model.addAttribute("role", roleDto);
        return "roleprofile";
    }

    @GetMapping("/getRoleJdbcById")
    public String getRoleJdbcById(Model model, @RequestParam Long id) {
        RoleDto roleDto = roleService.findByIdJdbc(id);
        model.addAttribute("role", roleDto);
        return "roleprofile";
    }

    @PostMapping("/updateRoleJpa")
    public String updateRoleJpa(Model model, @ModelAttribute RoleDto roleDto) {
        RoleDto updated = roleService.updateRole(roleDto);

        if (updated == null) {
            roleDto.setMessage("Role already exists");
            model.addAttribute("message", roleDto.getMessage());
            return "roleprofile";
        }

        roleDto.setMessage("Role updated successfully");
        model.addAttribute("message", roleDto.getMessage());
        return "roleprofile";
    }

    @PostMapping("/updateRoleJdbc")
    public String updateRoleJdbc(Model model, @ModelAttribute RoleDto roleDto) {

        if (roleService.updateRoleJdbc(roleDto) < 1) {
            model.addAttribute("message", roleDto.getMessage());
            return "roleprofile";
        }

        model.addAttribute("message", roleDto.getMessage());
        return "roleprofile";
    }
}
