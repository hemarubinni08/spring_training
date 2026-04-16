package com.ust.pos.web.controller;

import com.ust.pos.dto.NodeDto;
import com.ust.pos.service.Impl.NodeService;
import com.ust.pos.service.Impl.RoleService;
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

    @GetMapping("/addNode")
    public String addNode(Model model) {
        model.addAttribute("node", new NodeDto());
        model.addAttribute("roleList", roleService.findAllRoles());
        return "addNode";
    }

    @PostMapping("/addNode")
    public String addNode(Model model, @ModelAttribute NodeDto nodeDto) {
        NodeDto node = nodeService.addNode(nodeDto);
        model.addAttribute("node", node);
        if (node.getMessage() == null) {
            model.addAttribute("success", "Node added successfully");
        }
        return "addNode";
    }

    @GetMapping("/getAllNode")
    public String getAllNode(Model model) {
        List<NodeDto> node = nodeService.getAllNode();
        model.addAttribute("node", node);
        return "getAllNode";
    }

    @GetMapping("/deleteNode")
    public String deleteNode(Model model, @RequestParam Long id) {
        nodeService.deleteNode(id);
        return "redirect:/node/getAllNode";
    }

    @GetMapping("/editNode")
    public String editNode(@RequestParam Long id, Model model) {
        NodeDto node = nodeService.findById(id);
        model.addAttribute("node", node);
        model.addAttribute("roleList", roleService.findAllRoles());
        return "editNode";
    }

    @PostMapping("/editNode")
    public String editNodePost(@RequestParam Long id, Model model, NodeDto nodeDto) {
        NodeDto node = nodeService.editNode(nodeDto);
        model.addAttribute("node", node);
        model.addAttribute("roleList", roleService.findAllRoles());
        if (node.getMessage() == null) {
            model.addAttribute("success", "Node updated successfully");
        } else {
            model.addAttribute("error", node.getMessage());
        }
        return "editNode";
    }
}
