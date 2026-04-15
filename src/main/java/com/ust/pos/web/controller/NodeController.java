package com.ust.pos.web.controller;

import com.ust.pos.dto.NodeDto;
import com.ust.pos.service.NodeService;
import com.ust.pos.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/node")
public class NodeController {

    @Autowired
    private NodeService nodeService;

    @Autowired
    private RoleService roleService;

    @GetMapping("/addnodes")
    public String showNodes(Model model) {
        model.addAttribute("node", new NodeDto());
        model.addAttribute("nodes", nodeService.getAllNodes());
        model.addAttribute("roles", roleService.getAllRoles());
        return "addNode";
    }

    @PostMapping("/addnodes")
    public String addNode(@ModelAttribute("node") NodeDto nodeDto,
                          Model model) {

        boolean added = nodeService.createNode(nodeDto);

        model.addAttribute("nodes", nodeService.getAllNodes());
        model.addAttribute("roles", roleService.getAllRoles());

        return "addNode";
    }

    @PostMapping("/updateNode")
    public String updateNode(@ModelAttribute("node") NodeDto nodeDto,
                             Model model) {

        boolean updated = nodeService.updateNode(nodeDto);

        model.addAttribute("nodes", nodeService.getAllNodes());
        model.addAttribute("roles", roleService.getAllRoles());

        return "addNode";
    }

    @GetMapping("/deleteNode/{id}")
    public String deleteNode(@PathVariable Long id) {
        nodeService.deleteNode(id);
        return "redirect:/node/addnodes";
    }
}