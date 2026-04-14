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

    @GetMapping("/addnode")
    public String addNode(Model model) {
        model.addAttribute("rolesList", roleService.getAllRoles());
        model.addAttribute("nodeDto", new NodeDto());
        return "addNode";
    }

    @PostMapping("/addnode")
    public String addNode(@ModelAttribute NodeDto nodeDto) {
        nodeService.addNode(nodeDto);
        return "redirect:/node/listallnodes";
    }

    @GetMapping("/listallnodes")
    public String getAllNodes(Model model) {
        model.addAttribute("rolesList",roleService.getAllRoles());
        model.addAttribute("nodes", nodeService.getAllNodes());
        return "listAllNodes";
    }

    @GetMapping("/nodeprofile/{id}")
    public String nodeProfile(Model model, @PathVariable Long id) {
        model.addAttribute("rolesList", roleService.getAllRoles());
        model.addAttribute("node", nodeService.getNodeProfile(id));
        return "nodeProfile";
    }

    @PostMapping("/updatenode")
    public String updateNode(@ModelAttribute NodeDto nodeDto) {
        nodeService.updateNode(nodeDto);
        return "redirect:/node/listallnodes";
    }

    @GetMapping("/deletenode/{id}")
    public String deleteNode(@PathVariable Long id) {
        nodeService.deleteNode(id);
        return "redirect:/node/listallnodes";
    }
}