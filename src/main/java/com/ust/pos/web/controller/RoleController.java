package com.ust.pos.web.controller;

import com.ust.pos.dto.RoleDto;
import com.ust.pos.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequestMapping("/role")

public class RoleController {
    @Autowired
    RoleService roleService;

    @GetMapping("/addrolejpa")
    public String addRoleJpa(Model model) {
        model.addAttribute("roleDto", new RoleDto());
        return "addrolejpa";
    }

    @PostMapping("/addrolejpa")
    public String addRoleJpa(Model model, @ModelAttribute RoleDto roleDto) {
        boolean result = roleService.addRoleJpa(roleDto);
        if (result) {
            model.addAttribute("message", "Updation Successful");
        } else {
            model.addAttribute("message", "Updation Unsuccessfull: Username Already Exists");
        }
        return "successroles";
    }

    @GetMapping("/allrolesjpa")
    public String getAllRolesJpa(Model model) {
        List<RoleDto> roleDtoList = roleService.findAllRolesJpa();
        model.addAttribute("roleDtos", roleDtoList);
        return "allrolesjpa";
    }


    @GetMapping("/addrolejdbc")
    public String addRoleJdbc(Model model) {
        model.addAttribute("roleDto", new RoleDto());
        return "addrolejdbc";
    }

    @PostMapping("/addrolejdbc")
    public String addRoleJdbc(Model model, @ModelAttribute RoleDto roleDto) {
        boolean result = roleService.addRoleJdbc(roleDto);
        if (result) {
            model.addAttribute("message", "Updation Successful");
        } else {
            model.addAttribute("message", "Updation Unsuccessfull: Username Already Exists");
        }
        return "successroles";
    }

    @GetMapping("/allrolesjdbc")
    public String getAllRolesJdbc(Model model) {
        List<RoleDto> roleDtoList = roleService.findAllRolesJdbc();
        model.addAttribute("roleDtos", roleDtoList);
        return "allrolesjdbc";
    }

    @GetMapping("/deleteRoleJpa")
    public String deleteRoleJpa(@RequestParam Long id) {
        roleService.deleteByIdJpa(id);
        return "redirect:/role/allrolesjpa";
    }

    @GetMapping("/deleteRoleJdbc")
    public String deleteRoleJdbc(@RequestParam Long id) {
        roleService.deleteByIdJdbc(id);
        return "redirect:/role/allrolesjdbc";
    }

    @GetMapping("/updaterolejpa")
    public String updateRoleJpa(Model model, @RequestParam Long id) {
        RoleDto roleDto = roleService.getByIdJpa(id);
        model.addAttribute("roleDto", roleDto);
        return "updaterolejpa";
    }

    @PostMapping("/updaterolejpa")
    public String updateRoleJpa(Model model, @ModelAttribute("roleDto") RoleDto roleDto) {
        boolean result = roleService.updateRoleJpa(roleDto);
        if (result) {
            model.addAttribute("message", "Updation Successful");
        } else {
            model.addAttribute("message", "Updation Unsuccessfull");
        }
        return "successroles";
    }

    @GetMapping("/updaterolejdbc")
    public String updateRoleJdbc(Model model, @RequestParam Long id) {
        RoleDto roleDto = roleService.getByIdJdbc(id);
        model.addAttribute("roleDto", roleDto);
        return "updaterolejdbc";
    }


    @PostMapping("/updaterolejdbc")
    public String updateRoleJdbc(Model model, @ModelAttribute("roleDto") RoleDto roleDto) {
        boolean result = roleService.updateRoleJdbc(roleDto);
        if (result) {
            model.addAttribute("message", "Updation Successful");
        } else {
            model.addAttribute("message", "Updation Unsuccessfull");
        }
        return "successroles";
    }
}