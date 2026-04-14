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
        return "addNode";
    }

    @PostMapping("/addnodes")
    public String addNode(
            @ModelAttribute("node") NodeDto nodeDto,
            Model model) {

        boolean added = nodeService.createNode(nodeDto);

        if (!added) {
            model.addAttribute("errorMessage", "Node name already exists");
        } else {
            model.addAttribute("successMessage", "Node added successfully");
        }

        model.addAttribute("node", new NodeDto());
        model.addAttribute("nodes", nodeService.getAllNodes());
        return "addNode";
    }

    @PostMapping("/updateNode")
    public String updateNode(
            @ModelAttribute("node") NodeDto nodeDto,
            Model model) {

        boolean updated = nodeService.updateNode(nodeDto);

        if (!updated) {
            model.addAttribute("errorMessage", "Node name already exists");
        } else {
            model.addAttribute("successMessage", "Node updated successfully");
        }

        model.addAttribute("node", new NodeDto());
        model.addAttribute("nodes", nodeService.getAllNodes());
        return "addNode";
    }

    @GetMapping("/deleteNode/{id}")
    public String deleteNode(@PathVariable Long id) {
        nodeService.deleteNode(id);
        return "redirect:/node/addnodes";
    }
}