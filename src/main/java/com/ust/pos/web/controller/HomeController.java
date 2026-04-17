package com.ust.pos.web.controller;

import com.ust.pos.service.NodeService;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/")
public class HomeController {
    @Autowired
    NodeService nodeService;
    @Autowired
    ModelMapper modelMapper;

    @GetMapping
    public String home(Model model) {
        model.addAttribute("nodes", nodeService.listAllNodes());
        return "home";
    }

    @GetMapping("/login")
    public String getlogin() {
        return "login";
    }
}