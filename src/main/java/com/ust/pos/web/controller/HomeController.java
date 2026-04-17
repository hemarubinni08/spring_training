package com.ust.pos.web.controller;

import com.ust.pos.dto.NodeDto;
import com.ust.pos.service.impl.NodeServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import java.util.List;

@Controller
@RequestMapping("/")

public class HomeController {

    @Autowired
    NodeServiceImpl nodeService;

    @GetMapping("")
    public String showHomePage(Model model) {

        List<NodeDto> nodes = nodeService.getAllNodes();
        model.addAttribute("nodes", nodes);
        return "home";
    }

    @GetMapping("/login")
    public String doLogin(Model model) {

        return "login";
    }
}
