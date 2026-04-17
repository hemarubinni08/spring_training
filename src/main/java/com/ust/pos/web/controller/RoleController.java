package com.ust.pos.web.controller;

import com.ust.pos.dto.RoleDto;
import com.ust.pos.model.Role;
import com.ust.pos.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/roles")
public class RoleController {

    @Autowired
    private RoleService roleService;

    @GetMapping("/displayroles")
    public String getAllRoleRecords(Model model, @ModelAttribute RoleDto roleDto) {
        List<RoleDto> roles = roleService.retrieveAllRecords();
        model.addAttribute("roles", roles);
        return "rolerecords";
    }

    @GetMapping("/deleteroles")
    public String deleteProfile(@RequestParam("id") long id) {
        roleService.deleteUsersById(id);
        return "redirect:/roles/displayroles";
    }

    @GetMapping("/addroles")
    public String addProfile(Model model, @ModelAttribute RoleDto roleDto) {
        model.addAttribute("roleDto", new RoleDto());
        return "addrole";
    }

    @PostMapping("/addroles")
    public String addRole(Model model, @ModelAttribute RoleDto roleDto) {

        if (roleService.addRole(roleDto)) {
            return "redirect:/roles/displayroles";
        } else {
            return "failed";
        }
    }


    @GetMapping("/update")
    public String editRole(@RequestParam long id, Model model) {
        Role role = roleService.getRoleById(id).orElseThrow(() -> new RuntimeException("Role not Found"));
        model.addAttribute("role", role);
        return "updaterole";
    }

    @PostMapping("/updaterole")
    public String updateRole(@ModelAttribute RoleDto roleDto) {
        roleService.updateRole(roleDto);
        return "redirect:/roles/displayroles";
    }

    @GetMapping("/addrolesjdbc")
    public String addProfileJdbc(Model model, @ModelAttribute RoleDto roleDto) {
        model.addAttribute("roleDto", new RoleDto());
        return "addrole";
    }

    @PostMapping("/addrolesjd")
    public String addRoleJd(Model model, @ModelAttribute RoleDto roleDto) {

        if (roleService.addRoleJdbc(roleDto)) {
            return "redirect:/roles/displayroles";
        } else {
            return "failed";
        }
    }

    @GetMapping("/deleterolesjdbc")
    public String deleteProfileJdbc(Model model, @ModelAttribute RoleDto roleDto) {
        roleService.deleteUsersByIdJdbc(roleDto.getId());
        return "redirect:/roles/displayroles";
    }

    @GetMapping("/updateJdbc")
    public String editRoleJdbc(@RequestParam long id, Model model) {
        Role role = roleService.findByIdJdbc(id).orElseThrow(() -> new RuntimeException("Role not Found"));
        model.addAttribute("role", role);
        return "updaterolejdbc";
    }

    @PostMapping("/updaterolejdbc")
    public String updateRoleJdbc(@ModelAttribute RoleDto roleDto) {
        roleService.updateRoleJdbc(roleDto);
        return "redirect:/roles/displayroles";
    }
}


