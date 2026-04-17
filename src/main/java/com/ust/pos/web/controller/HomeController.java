package com.ust.pos.web.controller;

import com.ust.pos.dto.NodeDto;
import com.ust.pos.service.NodeService;
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
    NodeService nodeService;

    @GetMapping("/")
    public String home(Model model) {
        List<NodeDto> nodeDtos = nodeService.getAllNodes();
        model.addAttribute("nodeDtos", nodeDtos);
        return "home";
    }
}