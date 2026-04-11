package com.ust.pos.web.controller;

import org.eclipse.tags.shaded.org.apache.xpath.operations.Mod;
import org.springframework.ui.Model;
import com.ust.pos.dto.RoleDto;
import com.ust.pos.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.Banner;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller

@RequestMapping("/role")
public class RoleController {
    @Autowired
    RoleService roleService;
    @PostMapping("/addRole")
    public String addRole(Model model , @ModelAttribute RoleDto roleDto){
        roleService.addRole(roleDto);
        if(roleDto.isSuccess()) {
            model.addAttribute("role", "Role Added Successfully");
        }
        else {
            model.addAttribute("role" , "Role Already Exist");
        }
        return "successRole";
    }
    @GetMapping("/addRole")
    public String addRole1(Model model ,@ModelAttribute RoleDto roleDto){
        model.addAttribute("role", "Add Role");
        return "addRole";
    }
    @PostMapping("/addRoleJdbc")
    public String addRoleJdbc(Model model, @ModelAttribute RoleDto roleDto){
        roleService.addRoleJdbc(roleDto);
        if(roleDto.isSuccess()){
            model.addAttribute("role", "Added Successfull");
        }
        else{
            model.addAttribute("role", "Role already exists");
        }
        return "successRole";
    }
    @GetMapping("/addRoleJdbc")
    public String addRoleJdbc1(Model model , @ModelAttribute RoleDto roleDto){
        model.addAttribute("role", "Add Role");
        return "addRole";
    }
    @GetMapping("/listOfRoles")
    public String listOfRoles(Model model){
        List<RoleDto> roleDtos = roleService.getAllRoles();
        model.addAttribute("role",roleDtos);
        return "AllRoles";
    }
    @GetMapping("/deleteById")
    public String deleteById(Model model , @RequestParam long id){
        roleService.deleteRole(id);
        return("redirect:/role/listOfRoles");
    }
    @GetMapping("/roleDetails/{id}")
    public String roleDetails(Model model,@PathVariable long id){
        RoleDto roleDto = roleService.roleDetails(id);
        model.addAttribute("role",roleDto);
        return "updateRole";
    }
    @PostMapping("/updateRole")
    public String updateRole(Model model, @ModelAttribute RoleDto roleDto){
        RoleDto roleDto1 = roleService.updateRole(roleDto);
        if(roleDto.isSuccess()){
            model.addAttribute("role", "Updated Successfully");
        }
        else{
            model.addAttribute("role" , "Role Already Exists");
        }
        return("redirect:/role/listOfRoles");
    }
    @GetMapping("/listOfRolesJdbc")
    public String listOfRolesJdbc(Model model){
        List<RoleDto> roleDtos = roleService.getAllRolesJdbc();
        model.addAttribute("role",roleDtos);
        return ("AllRoles");
    }
    @GetMapping("/deleteByIdJdbc")
    public String deleteByIdJdbc(Model model, @RequestParam long id){
        roleService.deleteByIdJdbc(id);
        model.addAttribute("role","Deleted Successfuly");
        return("redirect:/role/listOfRolesJdbc");
    }
    @PostMapping("/updateByJdbc")
    public String updateByJdbc(Model model, @ModelAttribute RoleDto roleDto){
        roleService.updateByJdbc(roleDto);
        if(roleDto.isSuccess()){
            model.addAttribute("role", "Updated Successfully");
        }
        else{
            model.addAttribute("role" , "Role Already Exists");
        }
        return("redirect:/role/listOfRolesJdbc");
    }
}
