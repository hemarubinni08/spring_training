package com.ust.pos.web.controller;

import com.ust.pos.dto.RoleDto;
import com.ust.pos.dto.UserDto;
import com.ust.pos.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/userrole")
public class RoleController {

    @Autowired
    private RoleService roleService;


    @GetMapping("/addrole")
    public String addRoleView(Model model) {

        model.addAttribute("userDto", new UserDto());

        return "roleregister";
    }

    @GetMapping("/listrole")
    public String listRoleView(Model model) {

        List<RoleDto> roleDtoList = roleService.listRoles();
        model.addAttribute("roles", roleDtoList);

        return "listroleoptionusers";
    }

    @PostMapping("/addrole")
    public String addRoleViewPost(Model model, @ModelAttribute RoleDto roleDto) {

        roleService.addRole(roleDto);
        model.addAttribute("message", "Role Created Successfully");
        model.addAttribute("message", "Already exists");

        return "commonsuccess";
    }

    @GetMapping("/deletebyname/{id}")
    public String deleteViewPost(Model model, @PathVariable Long id) {

        roleService.deleteRole(id);
        model.addAttribute("message", "Role Deleted Successfully");
        model.addAttribute("message", "Already exists");

        return "commonsuccess";
    }

    @GetMapping("/update/{id}")
    public String updateViewPost(Model model, @PathVariable Long id) {

        RoleDto roleDto = roleService.getRoleById(id);
        model.addAttribute("role", roleDto);

        return "updaterole";
    }

    @PostMapping("/update")
    public String updateViewPost(Model model,
                                 @ModelAttribute RoleDto roleDto) {

        if (roleService.updateRole(roleDto) == null) {
            model.addAttribute("message", "Already exists");
            return "failed";
        }

        model.addAttribute("message", "Role Updated Successfully");
        model.addAttribute("path", "/userrole/listrole");

        return "commonsuccess";
    }

    @GetMapping("/addrolejdbc")
    public String addRoleViewJdbc(Model model) {

        model.addAttribute("userDto", new UserDto());

        return "roleregister";
    }

    @PostMapping("/addrolejdbc")
    public String addRoleViewJdbcPost(Model model, @ModelAttribute RoleDto roleDto) {

        roleService.addRoleJdbc(roleDto);
        model.addAttribute("userDto", new UserDto());

        return "roleregister";
    }

    @GetMapping("/updatejdbc/{id}")
    public String updateViewPostJdbc(Model model, @PathVariable Long id) {
        RoleDto roleDto = roleService.getRoleByIdJdbc(id);
        model.addAttribute("role", roleDto);

        return "updaterole";
    }

    @PostMapping("/updatejdbc")
    public String updateViewPostJdbc(Model model,
                                     @ModelAttribute RoleDto roleDto) {

        if (!roleService.updateRoleJdbc(roleDto)) {

            model.addAttribute("message", "Already exists");
            model.addAttribute("path", "/userrole/listrole");
            return "failed";
        }

        model.addAttribute("role", roleDto);
        model.addAttribute("path", "/userrole/listrole");

        return "commonsuccess";
    }

    @GetMapping("/deletebyid/{id}")
    public String deleteByIdJdbc(Model model, @PathVariable Long id) {

        if (roleService.deleteByIdJdbc(id)) {

            model.addAttribute("message", "Deleted Successfuly");
            model.addAttribute("path", "/userrole/listrole");

            return "commonsuccess";
        }

        model.addAttribute("message", "Already exists");
        model.addAttribute("path", "/userrole/listrole");

        return "failed";
    }
}
