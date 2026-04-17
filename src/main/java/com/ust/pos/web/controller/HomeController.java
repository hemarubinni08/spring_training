package com.ust.pos.web.controller;

import com.ust.pos.dto.NodeDto;
import com.ust.pos.dto.RoleDto;
import com.ust.pos.dto.UserDto;
import com.ust.pos.service.NodeService;
import com.ust.pos.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/")
public class HomeController {

    @Autowired
    NodeService nodeService;

    @Autowired
    RoleService roleService;

    @GetMapping
    public String getHome(Model model){
        List<NodeDto> nodeDtoList = nodeService.getAllNodes();
        model.addAttribute("nodeDtoList", nodeDtoList);
        return "home";
    }

    @GetMapping("/login")
    public String getLogin(){
        return "login";
    }

}
