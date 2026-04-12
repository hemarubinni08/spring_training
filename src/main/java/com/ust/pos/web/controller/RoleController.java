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

    @GetMapping("/addRole")
    public String createRole(Model model){
        model.addAttribute("roleDto",new RoleDto());
        return "addRole";
    }

    @PostMapping("/addRole")
    public String createRole(Model model, @ModelAttribute RoleDto roleDto){
        boolean state = roleService.createRole(roleDto);
        String status = "";
        if (state) {
            status = "Success";
        } else {
            status = "Role already exist";
        }
        model.addAttribute("state", status);
        model.addAttribute("linkPage", "/role/addRole");
        return "success";
    }

    @GetMapping("/getAllRoles")
    public String getAllRoles(Model model){
        List<RoleDto> roleDtoList = roleService.roleList();
        model.addAttribute("roleDtoList", roleDtoList);
        return "displayRoles";
    }

    @GetMapping("/deleteRoleById/{id}")
    public String deleteRole(Model model, @PathVariable Long id){
        roleService.deleteRole(id);
        return "redirect:/role/getAllRoles";
    }

    @GetMapping("/deleteRoleByIdJdbc/{id}")
    public String deleteRoleJdbc(Model model, @PathVariable Long id){
        roleService.deleteRoleJdbc(id);
        return "redirect:/role/getAllRoles";
    }

    @GetMapping("/getRoleDetails/{id}")
    public String getRoleDetails(Model model,@PathVariable Long id){
        RoleDto roleDtoNew = roleService.getRoleDetailsByid(id);
        model.addAttribute("role", roleDtoNew);
        model.addAttribute("roleDto", new RoleDto());
        return "roleDetails";
    }

    @PostMapping("/updateRole/{id}")
    public String updateRole( Model model, @ModelAttribute RoleDto roleDto){
        boolean state = roleService.updateRole(roleDto);
        if(state){
            return "redirect:/role/getAllRoles";
        }else {
            model.addAttribute("state","Role already exist");
            model.addAttribute("linkPage", "/role/getAllRoles");
         return "success";
        }
    }
    @PostMapping("/updateRoleJdbc/{id}")
    public String updateRoleJdbc( Model model, @ModelAttribute RoleDto roleDto){
        System.out.println("updated by JDBC");
        boolean state = roleService.updateRoleJdbc(roleDto);
        if(state){
            return "redirect:/role/getAllRoles";
        }else {
            model.addAttribute("state","Role already exist");
            model.addAttribute("linkPage", "/role/getAllRoles");
            return "success";
        }
    }
}
