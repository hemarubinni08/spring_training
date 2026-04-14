package com.ust.pos.web.controller;

import com.ust.pos.service.NodeService;
import com.ust.pos.service.RoleService;
import com.ust.pos.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

    @Autowired
    private NodeService nodeService;

    @Autowired
    private UserService userService;

    @Autowired
    private RoleService roleService;

    @GetMapping("/")
    public String home(Model model) {

        model.addAttribute("nodes", nodeService.getAllNodes());
        model.addAttribute("users", userService.getUsers());
        model.addAttribute("roles", roleService.getAllRoles());

        return "home";
    }
}