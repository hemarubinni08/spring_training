package com.ust.pos.web.controller;

import com.ust.pos.dto.NodeDto;
import com.ust.pos.service.NodeService;
import jakarta.annotation.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/node")
public class NodeController {

    @Resource
    private NodeService nodeService;

    @GetMapping("/addNode")
    public String showNodeForm(Model model) {
        model.addAttribute("nodeDto", new NodeDto());
        return "addNode";
    }

    @PostMapping("/add")
    public String saveNode(@ModelAttribute NodeDto nodeDto, Model model) {
        NodeDto saved = nodeService.addNodeData(nodeDto);

        if (saved == null) {
            model.addAttribute("msg", "Node already exists");
        } else {
            model.addAttribute("msg", "Node added successfully");
        }

        model.addAttribute("nodeDto", new NodeDto());
        return "addNode";
    }

    @GetMapping("/nodes")
    public String nodeDetails(Model model) {
        model.addAttribute("nodes", nodeService.fetchNode());
        return "nodes";
    }

    @GetMapping("/deleteNode/{id}")
    public String deleteNode(@PathVariable Long id) {
        nodeService.deleteById(id);
        return "redirect:/node/nodes";
    }

    @GetMapping("/getNode/{id}")
    public String getNode(Model model, @PathVariable Long id) {
        model.addAttribute("node", nodeService.findById(id));
        return "nodeprofile";
    }

    @PostMapping("/updateByNode")
    public String updateByNode(@ModelAttribute NodeDto nodeDto, Model model) {
        boolean updated = nodeService.updateByNode(nodeDto);

        if (updated) {
            return "redirect:/node/nodes";
        }

        model.addAttribute("msg", "Update failed (duplicate name)");
        model.addAttribute("node", nodeDto);
        return "nodeprofile";
    }
}
