package com.ust.pos.web.controller;

import com.ust.pos.dto.NodeDto;
import com.ust.pos.service.impl.NodeServiceImpl;
import com.ust.pos.service.impl.RoleServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/node")

public class NodeController {

    @Autowired
    NodeServiceImpl nodeService;

    @Autowired
    RoleServiceImpl roleService;

    @GetMapping("/addNode")
    public String showNode(Model model) {

        model.addAttribute("nodeDto", new NodeDto());
        model.addAttribute("roles", roleService.getAllRoles());
        return "addNode";
    }

    @PostMapping("/addNode")
    public String processNode(Model model, @ModelAttribute("nodeDto") NodeDto nodeDto) {

        try {
            nodeService.addNode(nodeDto);
            return "redirect:/node/showAllNodes";

        } catch (RuntimeException ex) {

            model.addAttribute("errorMessage", ex.getMessage());
            return "addNode";
        }
    }

    @GetMapping("/showAllNodes")
    public String showAllNodes(Model model) {

        model.addAttribute("node", nodeService.getAllNodes());
        return "showAllNodes";
    }

    @GetMapping("/deleteNode")
    public String deleteNode(@RequestParam long id) {

        nodeService.deleteById(id);
        return "redirect:/node/showAllNodes";
    }

    @GetMapping("/editNode")
    public String editNode(@RequestParam long id, Model model) {

        NodeDto nodeDto = nodeService.getNodeById(id);
        model.addAttribute("node", nodeDto);
        model.addAttribute("roles", roleService.getAllRoles());
        return "editNode";
    }

    @PostMapping("/saveNode")
    public String saveNode(NodeDto nodeDto, Model model) {

        NodeDto savedNode = nodeService.updateNode(nodeDto);
        model.addAttribute("savedNode", savedNode);
        return "redirect:/node/showAllNodes";
    }
}
