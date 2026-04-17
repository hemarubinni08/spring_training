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
    private NodeService nodeService;

    @Autowired
    private RoleService roleService;

    @PostMapping("/addNode")
    public String addNode(Model model, @ModelAttribute NodeDto nodeDto) {
        NodeDto nodeDto1 = nodeService.addNode(nodeDto);

        if (nodeDto1 == null) {
            model.addAttribute("message", "Node already exists");
            return "addnode";
        }

        model.addAttribute("message", "Node added");
        model.addAttribute("nodeDto", new NodeDto());
        return "addnode";
    }

    @GetMapping("/addNode")
    public String addRole(Model model) {
        model.addAttribute("nodeDto", new NodeDto());
        model.addAttribute("roles", roleService.getAllRoles());
        return "addnode";
    }

    @GetMapping("/nodes")
    public String getNodes(Model model) {
        List<NodeDto> nodeDtos = nodeService.getAllNodes();
        model.addAttribute("nodes", nodeDtos);
        return "nodes";
    }

    @GetMapping("/deleteNode/{id}")
    public String deleteNode(@PathVariable Long id) {
        nodeService.deleteNode(id);
        return "redirect:/node/nodes";
    }

    @GetMapping("/getNodeById")
    public String getNodeById(Model model, @RequestParam Long id) {
        NodeDto nodeDto = nodeService.findById(id);
        model.addAttribute("node", nodeDto);
        model.addAttribute("roles", roleService.getAllRoles());
        return "nodeprofile";
    }

    @PostMapping("/updateNode")
    public String updateNode(Model model, @ModelAttribute NodeDto nodeDto) {


        NodeDto updated = nodeService.updateNode(nodeDto);

        if (updated == null) {
            model.addAttribute("message", "Node already exists or not found");
            return "nodeprofile";
        }

        model.addAttribute("message", "Node updated successfully");
        return "nodeprofile";
    }
}
