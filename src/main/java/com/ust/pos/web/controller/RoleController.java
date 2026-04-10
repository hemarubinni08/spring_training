package com.ust.pos.web.controller;

import com.ust.pos.dto.RoleDto;
import com.ust.pos.model.Role;
import com.ust.pos.model.RoleRepository;
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
    private RoleService roleService;

    @PostMapping("/addrole")
    public String roleAdd(Model model, @ModelAttribute RoleDto roleDto, RedirectAttributes redirectAttributes)
    {
        RoleDto roleDto1 = roleService.add(roleDto);
        model.addAttribute("role", roleDto1);
        return "redirect:/role/displayrole";
    }

    @GetMapping("/addrole")
    public String doAddition(Model model, @ModelAttribute RoleDto roleDto)
    {
        model.addAttribute("role", "manager");
        return "addrole";
    }

    @GetMapping("/displayrole")
    public String displayRoles(Model model, @ModelAttribute RoleDto roleDto)
    {
        List<RoleDto> listOfRoles = roleService.display();
        model.addAttribute("roles", listOfRoles);
        return "displayrole";
    }

    @GetMapping("/deleterole")
    public String deleteProfile(Model model, @RequestParam long id, RedirectAttributes redirectAttributes)
    {
        roleService.deleteRole(id);
        redirectAttributes.addFlashAttribute("msg", "Role successfully deleted");
        return "redirect:/role/displayrole";
    }

    @PostMapping("/updaterole")
    public String updaterole(Model model, @ModelAttribute RoleDto roleDto)
    {
        RoleDto roleDto1 = roleService.update(roleDto);
        model.addAttribute("role", roleDto1);
        return "redirect:/role/displayrole";
    }

    @GetMapping("/updaterole")
    public String doupdaterole(Model model, @RequestParam long id)
    {
        RoleDto roleDto = roleService.findId(id);
        model.addAttribute("role", roleDto);
        return "updaterole";
    }
}
