package com.ust.pos.web.controller;

import com.ust.pos.dto.RoleDto;
import com.ust.pos.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
@RequestMapping("/role")
public class RoleController {
    @Autowired
    RoleService roleService;

    @PostMapping("/addRole")
    public String registerRole(RedirectAttributes ra, @ModelAttribute RoleDto roleDto) {
        roleService.addRole(roleDto);
        ra.addFlashAttribute("message", roleDto.getMessage());
        ra.addFlashAttribute("success", roleDto.isSuccess());
        return "redirect:/role/getAllRole";
    }

    @GetMapping("/addRole")
    public String doRegisterRole() {
        return "registerRole";
    }

    @GetMapping("/getAllRole")
    public String getAllRole(Model model) {
        List<RoleDto> roles = roleService.getRoles();
        model.addAttribute("roles", roles);
        return "roleDetails";
    }

    @PostMapping("/editRole")
    public String editRole(RedirectAttributes ra, @ModelAttribute RoleDto roleDto) {
        roleService.updateValueRole(roleDto);
        ra.addFlashAttribute("message", roleDto.getMessage());
        ra.addFlashAttribute("success", roleDto.isSuccess());
        return "redirect:/role/getAllRole";
    }

    @GetMapping("/getAllRoleJdbc")
    public String getAllRoleJdbc(Model model) {
        List<RoleDto> roles = roleService.getRolesJdbc();
        model.addAttribute("roles", roles);
        return "roleDetailsJdbc";
    }

    @GetMapping("/profilePageRole")
    public String profilePageRole(Model model, @RequestParam Long id) {
        RoleDto roleDto = roleService.findDetailsIdRole(id);
        model.addAttribute("role", roleDto);
        return "profilePageRole";
    }

    @GetMapping("/profilePageRoleJdbc")
    public String profilePageRoleJdbc(Model model, @RequestParam Long id) {
        RoleDto roleDto = roleService.findDetailsIdRoleJdbc(id);
        model.addAttribute("role", roleDto);
        return "profilePageRoleJdbc";
    }

    @GetMapping("/deletePageRole")
    public String deletePageRole(@RequestParam Long id) {
        roleService.deleteDetailsRole(id);
        return "redirect:/role/getAllRole";
    }

    @PostMapping("/addRoleJdbc")
    public String addRoleJdbc(RedirectAttributes ra, @ModelAttribute RoleDto roleDto) {
        String message = roleService.addRoleJdbc(roleDto);
        if ("Successfully created".equals(message)) {
            ra.addFlashAttribute("toastMessage", message);
            ra.addFlashAttribute("toastType", "success");
            return "redirect:/role/getAllRoleJdbc";
        } else {
            ra.addFlashAttribute("toastMessage", message == null ? "Role already exists!" : message);
            ra.addFlashAttribute("toastType", "error");
            return "redirect:/role/getAllRoleJdbc";
        }

    }

    @GetMapping("/addRoleJdbc")
    public String doAddRoleJdbc() {
        return "registerRoleJdbc";
    }

    @GetMapping("/deletePageRoleJdbc")
    public String deletePageRoleJdbc(@RequestParam Long id) {
        roleService.deleteDetailsRoleJdbc(id);
        return "redirect:/role/getAllRoleJdbc";
    }

    @PostMapping("/editRoleJdbc")
    public String updateJdbcRole(RedirectAttributes ra, @ModelAttribute RoleDto roleDto) {
        RoleDto result = roleService.updateValueRoleJdbc(roleDto);

        ra.addFlashAttribute("toastMessage", result.getMessage());
        ra.addFlashAttribute("toastType", result.isSuccess() ? "success" : "error");

        if (result.isSuccess()) {
            return "redirect:/role/getAllRoleJdbc";
        } else {
            return "redirect:/role/profilePageRoleJdbc?id=" + roleDto.getId();
        }
    }
}