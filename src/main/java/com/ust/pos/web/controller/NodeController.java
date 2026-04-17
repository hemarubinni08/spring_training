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
    public String addNodeController(Model model) {

        model.addAttribute("roles", roleService.listRoles());

        return "addnode";
    }

    @PostMapping("/addnode")
    public String addNodePost(Model model, @ModelAttribute NodeDto nodeDto) {

        if (nodeService.existsByPath(nodeDto.getPath())) {
            return null;
        }

        nodeService.addNode(nodeDto);

        return "redirect:/node/listnodes";
    }

    @GetMapping("/listnodes")
    public String listAllNodes(Model model) {

        model.addAttribute("nodes", nodeService.listAllNodes());
        model.addAttribute("roles", roleService.listRoles());

        return "listnodes";
    }

    @GetMapping("/updatenode/{id}")
    public String updateNodeController(Model model, @PathVariable Long id) {

        model.addAttribute("roles", roleService.listRoles());
        model.addAttribute("node", nodeService.getNodeById(id));

        return "updatenode";
    }

    @PostMapping("/updatenode")
    public String updateNodeController(Model model, @ModelAttribute NodeDto nodeDto) {

        if (nodeService.updateNode(nodeDto) == null) {

            model.addAttribute("message", "Path Already exists");
            model.addAttribute("path", "/node/listnodes");
        }

        model.addAttribute("message", "Path Update Successfull");
        model.addAttribute("path", "/node/listnodes");

        return "commonsuccess";
    }

    @GetMapping("/deletenode/{id}")
    public String deleteNode(Model model, @PathVariable Long id) {

        if (nodeService.existsByIdService(id)) {

            nodeService.deleteNode(id);
            model.addAttribute("message", "Deleted Successfuly");
            model.addAttribute("path", "/node/listnodes");

            return "commonsuccess";
        }

        model.addAttribute("message", "Already exists");
        model.addAttribute("path", "/node/listnodes");

        return "failed";
    }
}
