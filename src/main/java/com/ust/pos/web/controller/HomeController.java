package com.ust.pos.web.controller;

import com.ust.pos.dto.NodeDto;
import com.ust.pos.service.NodeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/")
public class HomeController {
    @Autowired
    NodeService nodeService;

    @GetMapping("/")
    public String displayhome(Model model, @ModelAttribute NodeDto nodeDto) {
        List<NodeDto> listofnodes = nodeService.display();
        model.addAttribute("nodes", listofnodes);
        return "home";
    }
}