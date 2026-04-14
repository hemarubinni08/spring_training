package com.ust.pos.web.controller;

import com.ust.pos.dto.NodeDto;
import com.ust.pos.service.impl.NodeService;
import com.ust.pos.service.impl.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/node")
public class NodeController {
    @Autowired
    NodeService nodeService;
    @Autowired
    RoleService roleService;

    @PostMapping("/addNode")
    public String addingNode(Model model, @ModelAttribute NodeDto nodeDto) {
        nodeService.addNode(nodeDto);
        model.addAttribute("node", "node added successfully");
        model.addAttribute("roles", roleService.findAllRoles());
        return "redirect:/node/nodeList";
    }

    @GetMapping("/addNode")
    public String addNode(Model model, @ModelAttribute NodeDto nodeDto) {
        nodeService.addNode(nodeDto);
        model.addAttribute("node", "node added successfully");
        model.addAttribute("roles", roleService.findAllRoles());
        return "addNode";
    }

    @GetMapping("/nodeList")
    public String allNodes(Model model) {
        model.addAttribute("nodes", nodeService.findAllNodes());
        model.addAttribute("roles", roleService.findAllRoles());
        return "allNodes";
    }

    @GetMapping("/deleteNode")
    public String deleteNode(Model model, @RequestParam long id) {
        nodeService.deleteById(id);
        return "redirect:/node/nodeList";
    }

    @GetMapping("/getNode")
    public String getRole(Model model, @RequestParam long id) {
        NodeDto nodeDto = nodeService.findById(id);
        model.addAttribute("node", nodeDto);
        model.addAttribute("roles", roleService.findAllRoles());
        return "updateNode";
    }

    @PostMapping("/updateNode")
    public String update(Model model, @ModelAttribute NodeDto nodeDto) {
        if (!nodeService.updateData(nodeDto)) {
            model.addAttribute("message", "node already exists");
        } else {
            return "redirect:/node/nodeList";
        }
        return "success";
    }
}
