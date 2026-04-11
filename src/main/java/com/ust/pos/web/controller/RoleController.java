package com.ust.pos.web.controller;

import com.ust.pos.dto.RoleDto;
import com.ust.pos.model.Role;
import com.ust.pos.model.RoleRepository;
import com.ust.pos.service.RoleService;
import org.eclipse.tags.shaded.org.apache.xpath.operations.Mod;
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
    public String roleAdd(Model model, @ModelAttribute RoleDto roleDto)
    {
        RoleDto roleDto1 = roleService.add(roleDto);
        if(roleDto1.getMessage() != null)
        {
            model.addAttribute("role", roleDto1);
            return "addrole";
        }
        model.addAttribute("role", roleDto1);
        return "redirect:/role/displayrole";
    }

    @GetMapping("/addrole")
    public String doAddition(Model model, @ModelAttribute RoleDto roleDto)
    {
        model.addAttribute("role", roleDto);
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
        if(roleDto1.getMessage() != null)
        {
            model.addAttribute("role", roleDto1);
            return "updaterole";
        }
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

    @PostMapping("/addrolejdbc")
    public String roleAddJDBC(Model model, @ModelAttribute RoleDto roleDto)
    {
        RoleDto roleDto1 = roleService.addRoleJDBC(roleDto);
        if(roleDto1.getMessage() != null)
        {
            model.addAttribute("role", roleDto1);
            return "addrolejdbc";
        }
        model.addAttribute("role", roleDto1);
        return "redirect:/role/displayrolejdbc";
    }

    @GetMapping("/addrolejdbc")
    public String doAdditionJDBC(Model model, @ModelAttribute RoleDto roleDto)
    {
        model.addAttribute("role", roleDto);
        return "addrolejdbc";
    }

    @GetMapping("/deleterolejdbc")
    public String deleterolejdbc(Model model, @RequestParam long id, RedirectAttributes redirectAttributes)
    {
        roleService.deleteRole(id);
        redirectAttributes.addFlashAttribute("msg", "Role successfully deleted");
        return "redirect:/role/displayrolejdbc";
    }

    @GetMapping("/displayrolejdbc")
    public String displayRolesjdbc(Model model, @ModelAttribute RoleDto roleDto)
    {
        List<RoleDto> listOfRoles = roleService.displayjdbc();
        model.addAttribute("roles", listOfRoles);
        return "displayrole";
    }

    @PostMapping("/updaterolejdbc")
    public String updaterolejdbc(Model model, @ModelAttribute RoleDto roleDto)
    {
        RoleDto roleDto1 = roleService.update(roleDto);
        if(roleDto1.getMessage() != null)
        {
            model.addAttribute("role", roleDto1);
            return "updaterolejdbc";
        }
        model.addAttribute("role", roleDto1);
        return "redirect:/role/displayrolejdbc";
    }

    @GetMapping("/updaterolejdbc")
    public String doupdaterolejdbc(Model model, @RequestParam long id)
    {
        RoleDto roleDto = roleService.findId(id);
        model.addAttribute("role", roleDto);
        return "updaterolejdbc";
    }
}
