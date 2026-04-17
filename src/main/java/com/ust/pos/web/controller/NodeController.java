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
    NodeService nodeService;
    @Autowired
    RoleService roleService;

    @GetMapping("/addNode")
    public String addNodes(Model model, @ModelAttribute NodeDto nodeDto) {
        model.addAttribute("roles", roleService.getAllUsersRoles());
        return "registerNode";
    }

    @PostMapping("/addNode")
    public String addNodes1(Model model, @ModelAttribute NodeDto nodeDto) {
        if (nodeService.addNode(nodeDto)) {
            return "nodeSuccess";
        }
        return "nodeFail";
    }

    @GetMapping("/displayNode")
    public String displayNodes(Model model, @ModelAttribute NodeDto nodeDto) {
        model.addAttribute("nodes", nodeService.displayNode());
        return "displayNodes";
    }

    @GetMapping("/editNode/{id}")
    public String editNode1(Model model, @PathVariable long id) {
        NodeDto nodeDto1 = nodeService.findByIdNode(id);
        model.addAttribute("roles", roleService.getAllUsersRoles());
        model.addAttribute("nodeDto", nodeDto1);

        return "nodeProfile";
    }

    @PostMapping("/editNode")
    public String editNode(Model model, @ModelAttribute NodeDto nodeDto) {
        if (nodeService.editNode(nodeDto)) {
            return "nodeSuccess";
        }
        return "nodeFail";
    }

    @GetMapping("/deleteNode/{id}")
    public String deleteNode(Model model, @PathVariable long id) {
        nodeService.deleteByIdNode(id);

        return ("redirect:/node/displayNode");
    }
}