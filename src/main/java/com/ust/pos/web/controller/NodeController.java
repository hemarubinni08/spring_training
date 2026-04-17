package com.ust.pos.web.controller;

import com.ust.pos.dto.NodeDto;
import com.ust.pos.service.NodeService;
import com.ust.pos.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller

@RequestMapping("/node")
public class NodeController {
    @Autowired
    NodeService nodeService;
    @Autowired
    RoleService roleService;

    @GetMapping("/addNodeJpa")
    public String addNodeJpa(Model model, @ModelAttribute NodeDto nodeDto) {
        model.addAttribute("roles", roleService.findAllRoles());
        return "addNodeJpa";
    }

    @PostMapping("/addNodeJpa")
    public String addNodesJpa(Model model, @ModelAttribute NodeDto nodeDto) {
        boolean state = nodeService.addNode(nodeDto);
        if (state) {
            return "redirect:/node/displayNodeJpa";
        } else {
            model.addAttribute("message", "Node already exist");
            return "failed";
        }
    }

    @GetMapping("/displayNodeJpa")
    public String getAllRolesJpa(Model model) {
        List<NodeDto> nodeDtoList = nodeService.findAllNode();
        model.addAttribute("nodeDto", nodeDtoList);
        return "displayNodejpa";
    }

    @GetMapping("/getNodeDetails/{id}")
    public String displayNodeJpa(Model model, @PathVariable Long id) {
        NodeDto nodeDto1 = nodeService.getNodeById(id);
        model.addAttribute("node", nodeDto1);
        model.addAttribute("nodeDto", new NodeDto());
        model.addAttribute("roles", roleService.findAllRoles());
        return "editNodeJpa";
    }

    @PostMapping("/updateNode")
    public String updateRole(Model model, @ModelAttribute NodeDto nodeDto) {
        boolean state = nodeService.updateNode(nodeDto);
        if (state) {
            return "redirect:/node/displayNodeJpa";
        } else {
            model.addAttribute("message", "Role already exist");
            return "failed";
        }
    }

    @GetMapping("/deleteNodeJpa")
    public String deleteNodeJpa(@RequestParam Long id) {
        nodeService.deleteNodeByIdJpa(id);
        return "redirect:/node/displayNodeJpa";
    }
}