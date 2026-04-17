package com.ust.pos.web.controller;

import com.ust.pos.dto.NodeDto;
import com.ust.pos.service.NodeService;
import com.ust.pos.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequestMapping("/node")

public class NodeController {
    @Autowired
    NodeService nodeService;

    @Autowired
    RoleService roleService;

    @PostMapping("/add")
    public String add(Model model, @ModelAttribute NodeDto nodeDto) {
        NodeDto result = nodeService.addNode(nodeDto);
        return "redirect:/node/allnodes";
    }

    @GetMapping("/add")
    public String add(Model model) {
        model.addAttribute("nodeDto", new NodeDto());
        model.addAttribute("roles", roleService.findAllRolesJpa());
        return "add";
    }

    @GetMapping("/allnodes")
    public String allNodes(Model model) {
        List<NodeDto> nodeDtoList = nodeService.getAllNodes();
        model.addAttribute("nodeDtos", nodeDtoList);
        return "allnodes";
    }

    @GetMapping("/delete")
    public String delete(@RequestParam Long id) {
        nodeService.deleteNode(id);
        return "redirect:/node/allnodes";
    }

    @PostMapping("/update")
    public String update(Model model, @ModelAttribute("nodeDto") NodeDto nodeDto) {
        nodeService.updateNode(nodeDto);
        return "redirect:/node/allnodes";
    }

    @GetMapping("/update")
    public String update(Model model, @RequestParam Long id) {
        NodeDto nodeDto = nodeService.getNodeById(id);
        model.addAttribute("nodeDto", nodeDto);
        model.addAttribute("roles", roleService.findAllRolesJpa());
        return "update";
    }
}