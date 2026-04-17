package com.ust.pos.web.controller;

import com.ust.pos.dto.NodeDto;
import com.ust.pos.service.NodeService;
import com.ust.pos.service.UserService;
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
    private NodeService nodeService;

    @Autowired
    private UserService userService;

    @GetMapping("/")
    public String homePage(Model model, @ModelAttribute NodeDto nodeDto) {

        List<NodeDto> nodes = nodeService.retrieveAllNodes();
        model.addAttribute("nodes", nodes);

        return "homepage";
    }

    @GetMapping("/login")
    public String doLogin(Model model) {

        return "login";
    }
}
