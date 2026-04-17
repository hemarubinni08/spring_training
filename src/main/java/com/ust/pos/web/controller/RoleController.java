package com.ust.pos.web.controller;

import com.ust.pos.dto.RoleDto;
import com.ust.pos.service.RoleService;
import jakarta.annotation.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/role")
public class RoleController {
    @Resource
    RoleService roleService;

    @GetMapping("/addRole")
    public String showRoleForm(Model model) {
        model.addAttribute("roleDto", new RoleDto());
        return "addrole";
    }

    @PostMapping("/addRole")
    public String saveRole(@ModelAttribute RoleDto roleDto,
                           Model model) {
        RoleDto savedRole = roleService.addRoleData(roleDto);

        if (savedRole == null) {
            model.addAttribute("msg", "Role already exists");
            return "addrole";
        }

        model.addAttribute("msg", "Role added successfully");
        model.addAttribute("role", new RoleDto());
        return "addrole";
    }

    @GetMapping("/roles")
    public String roleDetails(Model model) {
        List<RoleDto> roles = roleService.fetchRole();
        model.addAttribute("roles", roles);
        return "roles";
    }

    @GetMapping("/deleteRole/{id}")
    public String deleteRole(@PathVariable Long id) {
        roleService.deleteById(id);
        return "redirect:/role/roles";
    }

    @GetMapping("/getRole/{id}")
    public String getRole(Model model, @PathVariable Long id) {
        RoleDto roleDto = roleService.findById(id);
        model.addAttribute("role", roleDto);
        return "roleprofile";
    }

    @PostMapping("/updateByRole/{id}")
    public String updateByRole(Model model, @ModelAttribute RoleDto roleDto) {
        boolean result = roleService.updateByRole(roleDto);

        if (result) {
            return "redirect:/role/roles";
        } else {
            model.addAttribute("msg", "failed, role exists");
            return "success";
        }
    }

    @PostMapping("/updateByRoleJdbc/{id}")
    public String updateByRoleJdbc(Model model, @ModelAttribute RoleDto roleDto) {
        System.out.println("updated by JDBC");
        boolean result = roleService.updateByRoleJdbc(roleDto);

        if (result) {
            return "redirect:/role/roles";
        } else {
            model.addAttribute("msg", "failed, role exists");
            return "success";
        }
    }
}
