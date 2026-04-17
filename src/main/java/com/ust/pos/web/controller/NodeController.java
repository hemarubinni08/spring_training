package com.ust.pos.web.controller;

import com.ust.pos.dto.NodeDto;
import com.ust.pos.model.Node;
import com.ust.pos.service.NodeService;
import com.ust.pos.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/nodes")
public class NodeController {

    @Autowired
    private NodeService nodeService;

    @Autowired
    private RoleService roleService;

    @GetMapping("/displaynodes")
    public String getAllNodeRecords(Model model, @ModelAttribute NodeDto nodeDto) {
        List<NodeDto> nodes = nodeService.retrieveAllNodes();
        model.addAttribute("nodes", nodes);
        return "noderecords";
    }

    @GetMapping("/addnodes")
    public String addNodes(Model model, @ModelAttribute NodeDto nodeDto) {
        model.addAttribute("nodeDto", new NodeDto());
        model.addAttribute("roles", roleService.retrieveAllRecords());
        return "addnode";
    }

    @PostMapping("/addnodes")
    public String addNode(Model model, @ModelAttribute NodeDto nodeDto) {

        if (nodeService.addNode(nodeDto)) {
            return "redirect:/nodes/displaynodes";
        } else {
            return "failednode";
        }
    }

    @GetMapping("/deletenodes")
    public String deleteNode(@RequestParam("id") long id) {
        nodeService.deleteUsersById(id);
        return "redirect:/nodes/displaynodes";
    }

    @GetMapping("/update")
    public String editNode(@RequestParam long id, Model model) {
        Node node = nodeService.getNodeById(id).orElseThrow(() -> new RuntimeException("Node not Found"));
        model.addAttribute("node", node);
        model.addAttribute("roles", roleService.retrieveAllRecords());
        return "updatenode";
    }

    @PostMapping("/updatenode")
    public String updateNode(@ModelAttribute NodeDto nodeDto) {
        nodeService.updateNode(nodeDto);
        return "redirect:/nodes/displaynodes";
    }
}

