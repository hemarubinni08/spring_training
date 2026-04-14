package com.ust.pos.web.controller;

import com.ust.pos.dto.NodeDto;
import com.ust.pos.dto.RoleDto;
import com.ust.pos.service.NodeService;
import com.ust.pos.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.BeanDefinitionDsl;
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
    public String addNode(Model model, @ModelAttribute NodeDto nodeDto) {
        List<RoleDto> roles = roleService.findAllRoles();
        model.addAttribute("name", "Ritu");
        model.addAttribute("nodeDto", new NodeDto());
        model.addAttribute("role", roles);
        return "addNode";
    }

    @PostMapping("/addNode")
    public String addingNode(Model model, @ModelAttribute NodeDto nodeDto) {
        NodeDto nodeDto1 = nodeService.addNode(nodeDto);
        model.addAttribute("node", nodeDto1);
        if (nodeDto1.isSuccess()) {
            model.addAttribute("name", "Add node Successful");
        } else {
            model.addAttribute("name", "Node Already existed");
        }
        return "successNode";
    }

    @GetMapping("/update")
    public String updateNode(Model model, @RequestParam Long id, String path) {
        NodeDto nodeDto = nodeService.getNode(id);
        List<RoleDto> roles = roleService.findAllRoles();
        model.addAttribute("node", nodeDto);
        model.addAttribute("roles", roles);
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
        return "redirect:/node/allNode";
    }

    @GetMapping("/allNode")
    public String allNode(Model model) {
        model.addAttribute("node", nodeService.findAllNode());
        return "allNode";
    }

    @GetMapping("/deleteNode")
    public String deleteNode(Model model, @RequestParam Long id) {
        nodeService.deleteNode(id);
        return "redirect:/node/allNode";
    }
}
