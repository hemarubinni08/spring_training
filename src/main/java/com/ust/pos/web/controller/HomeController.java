package com.ust.pos.web.controller;



import com.ust.pos.service.impl.NodeService;
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

    @GetMapping()
    public String allnodes(Model model) {
        model.addAttribute("nodes", nodeService.findAllNodes());
        return "home";
    }
}
