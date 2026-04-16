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

    @GetMapping("/add")
    public String showAddNodePage(Model model) {
        model.addAttribute("nodeDto", new NodeDto());
        model.addAttribute("roles", roleService.getAllRolesJpa());
        return "addNode";
    }

    @PostMapping("/save")
    public String saveNode(@ModelAttribute NodeDto nodeDto, Model model) {
        NodeDto savedNode = nodeService.addNode(nodeDto);
        model.addAttribute("node", savedNode);
        return "successNode";
    }

    @GetMapping("/list")
    public String allNodes(Model model) {
        model.addAttribute("nodes", nodeService.listOfNodes());
        return "allNodes";
    }

    @GetMapping("/delete")
    public String delete(@RequestParam Long id) {
        nodeService.deleteNode(id);
        return "redirect:/node/list";
    }


    @GetMapping("/update")
    public String updateNode(Model model, @RequestParam Long id, String path) {
        NodeDto nodeDto = nodeService.getNodeById(id);
        model.addAttribute("node", nodeDto);
        model.addAttribute("roles", roleService.getAllRolesJpa());
        return "updateNode";
    }

    @PostMapping("/updateNode")
    public String updateNode(Model model, @ModelAttribute NodeDto nodeDto) {
        NodeDto nodeDto1 = nodeService.updateNode(nodeDto);
        model.addAttribute("node", nodeDto1);
        if (nodeDto1.isSuccess()) {
            model.addAttribute("name", "Add node Successful");
        } else {
            model.addAttribute("name", "Node Already existed");
        }
        return "redirect:/node/list";
    }
}