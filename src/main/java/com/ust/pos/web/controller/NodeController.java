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
        model.addAttribute("rolesList", roleService.getRolesListJpa());
        return "addnode";
    }

    @PostMapping("/addnode")
    public String addNode(@ModelAttribute NodeDto nodeDto) {
        nodeService.addNode(nodeDto);
        return "redirect:/node/nodeslist";
    }

    @GetMapping("/nodeslist")
    public String nodesList(Model model) {
        model.addAttribute("nodesList", nodeService.listNodes());
        return "nodeslist";
    }

    @GetMapping("/editnode")
    public String editNode(@RequestParam long id, Model model, @ModelAttribute NodeDto nodeDto) {
        model.addAttribute("rolesList", roleService.getRolesListJpa());
        model.addAttribute("nodeDetails", nodeService.findNodeById(id));
        return "editnode";
    }

    @PostMapping("/editnode")
    public String editNode(@ModelAttribute NodeDto nodeDto) {
        nodeService.editNode(nodeDto);
        return "redirect:/node/nodeslist";
    }

    @GetMapping("/deletenode")
    public String deleteNode(@RequestParam long id) {
        nodeService.deleteNodeById(id);
        return "redirect:/node/nodeslist";
    }
}
