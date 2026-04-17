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
    RoleService roleService;

    @GetMapping("/addrolejpa")
    public String addRoleJpa(Model model, @ModelAttribute RoleDto roleDto) {
        return "addRole";
    }

    @PostMapping("/addrolejpa")
    public String addRolesJpa(Model model, @ModelAttribute RoleDto roleDto) {
        boolean state = roleService.addRole(roleDto);
        if (state) {
            return "redirect:/role/displayjpa";
        } else {
            model.addAttribute("message", "Role already exist");
            return "failed";
        }
    }

    @GetMapping("/displayjpa")
    public String getAllRolesJpa(Model model) {
        List<RoleDto> roleDtoList = roleService.findAllRoles();
        model.addAttribute("roleDto", roleDtoList);
        return "displayjpa";
    }

    @GetMapping("/getRoleDetails/{id}")
    public String displayrolejpa(Model model, @PathVariable Long id) {
        RoleDto roleDto1 = roleService.getRoleById(id);
        model.addAttribute("role", roleDto1);
        model.addAttribute("roleDto", new RoleDto());
        return "editRoleJpa";
    }

    @GetMapping("/deleteRoleJpa")
    public String deleteRoleJpa(@RequestParam Long id) {
        roleService.deleteByIdJpa(id);
        return "redirect:/role/displayjpa";
    }

    @GetMapping("/addrolejdbc")
    public String addRolejdbc(Model model) {
        model.addAttribute("roleDto", new RoleDto());
        return "addrolejdbc";
    }

    @PostMapping("/addrolejdbc")
    public String addRolejdbc(Model model, @ModelAttribute RoleDto roleDto) {
        boolean result = roleService.addRoleJdbc(roleDto);
        if (result) {
            model.addAttribute("message", "updation success");
        } else {
            model.addAttribute("message", "updation unsuccess");
        }
        return "redirect:/role/allrolesjdbc";
    }

    @GetMapping("/allrolesjdbc")
    public String getAllRolesJdbc(Model model) {
        List<RoleDto> roleDtoList = roleService.findAllRolesJdbc();
        model.addAttribute("roleDto", roleDtoList);
        return "allrolesjdbc";
    }

    @GetMapping("/deleteRoleJdbc")
    public String deleteRoleJdbc(@RequestParam Long id) {
        roleService.deleteByIdJdbc(id);
        return "redirect:/role/allrolesjdbc";
    }

    @PostMapping("/updateRole")
    public String updateRoles(Model model, @ModelAttribute RoleDto roleDto) {
        boolean state = roleService.updateByIdJdbc(roleDto);
        if (state) {
            return "redirect:/role/displayjpa";
        } else {
            model.addAttribute("message", "Role already exist");
            return "failed";
        }
    }
}