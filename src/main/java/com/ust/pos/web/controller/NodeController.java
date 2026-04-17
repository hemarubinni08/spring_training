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

    @GetMapping("/addNode")
    public String AddNodePage(Model model, @ModelAttribute NodeDto nodeDto) {
        model.addAttribute("node", nodeDto);
        model.addAttribute("roles", roleService.listAllRoles());
        return "addNode";
    }

    @PostMapping("/addNode")
    public String saveNode(Model model, @ModelAttribute NodeDto nodeDto) {
        NodeDto result = nodeService.addNode(nodeDto);
        if (result == null) {
            model.addAttribute("error", "Role already exists");
            return "addNode";
        }
        model.addAttribute("message", "addedd successfully");
        return "addNode";
    }

    @GetMapping("list")
    public String listNodes(Model model) {
        model.addAttribute("nodes", nodeService.listAllNodes());
        return "listAllNodes";
    }

    @GetMapping("/delete/{id}")
    public String deleteNode(@PathVariable Long id) {
        nodeService.deleteNodeById(id);
        return "redirect:/node/list";
    }

    @GetMapping("/edit/{id}")
    public String editNode(@PathVariable Long id, Model model) {
        model.addAttribute("nodeDto", nodeService.getNodeById(id));
        model.addAttribute("roles", roleService.listAllRoles());
        return "updateNode";
    }

    @PostMapping("/update")
    public String updateNode(@ModelAttribute NodeDto nodeDto, Model model) {
        if (nodeService.nodeFindsForUpdate(nodeDto.getName(), nodeDto.getId())) {
            model.addAttribute("error", "Node name already exists");
            model.addAttribute("nodeDto", nodeDto);
            return "updateNode";
        }
        nodeService.updateNode(nodeDto);
        return "redirect:/node/list?msg=updated";
    }
}