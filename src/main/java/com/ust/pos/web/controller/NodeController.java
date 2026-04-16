package com.ust.pos.web.controller;

import com.ust.pos.dto.NodeDto;
import com.ust.pos.service.NodeService;
import com.ust.pos.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
@RequestMapping("/node")
public class NodeController {
    @Autowired
    NodeService nodeService;
    @Autowired
    RoleService roleService;

    @GetMapping("/addNode")
    public String addNode(Model model) {
        model.addAttribute("roles", roleService.getRoles());
        return "addNode";
    }

    @PostMapping("/addNode")
    public String doAddNode(RedirectAttributes ra, @ModelAttribute NodeDto nodeDto) {
        nodeService.addNode(nodeDto);
        ra.addFlashAttribute("message", nodeDto.getMessage());
        ra.addFlashAttribute("success", nodeDto.isSuccess());
        return "redirect:/node/getAllNodes";
    }

    @GetMapping("/getAllNodes")
    public String getAllNodes(Model model) {
        List<NodeDto> nodeDtoList = nodeService.getNodes();
        model.addAttribute("node", nodeDtoList);
        return "getAllNodes";
    }

    @GetMapping("/deleteNode")
    public String deleteNode(@RequestParam Long id) {
        nodeService.deleteDetailsNode(id);
        return "redirect:/node/getAllNodes";
    }

    @PostMapping("/updateNode")
    public String updateNode(RedirectAttributes ra, @ModelAttribute NodeDto nodeDto) {
        nodeService.updateValueNode(nodeDto);
        ra.addFlashAttribute("toastMessage", nodeDto.getMessage());
        ra.addFlashAttribute("toastType", nodeDto.isSuccess() ? "success" : "error");
        return "redirect:/node/getAllNodes";
    }

    @GetMapping("/profileNode")
    public String profileNode(Model model, @RequestParam Long id) {
        NodeDto nodeDto = nodeService.findAllNodes(id);
        model.addAttribute("roles", roleService.getRoles());
        model.addAttribute("node", nodeDto);
        return "profileNode";
    }
}