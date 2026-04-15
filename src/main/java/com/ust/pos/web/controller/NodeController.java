package com.ust.pos.web.controller;

import com.ust.pos.dto.NodeDto;
import com.ust.pos.service.NodeService;
import com.ust.pos.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/node")
public class NodeController {

    @Autowired
    private NodeService nodeService;

    @Autowired
    private RoleService roleService;


    @PostMapping("/add")
    public String addNode(@ModelAttribute NodeDto nodeDto, RedirectAttributes redirectAttributes) {
        NodeDto response = nodeService.addNode(nodeDto);
        redirectAttributes.addFlashAttribute("message", response.getMessage());
        redirectAttributes.addFlashAttribute("colour", response.getColour());
        return "redirect:/node/list";
    }

    @GetMapping("/list")
    public String nodesList(Model model) {
        model.addAttribute("nodeDetailsList", nodeService.getAllNodes());
        model.addAttribute("rolesList", roleService.getAllRoleNames());
        return "nodesList";
    }

    @GetMapping("/profile/{id}")
    public String nodeProfile(@PathVariable long id, Model model) {
        model.addAttribute("rolesList", roleService.getAllRoleNames());
        model.addAttribute("nodeDto", nodeService.getNodeById(id));
        return "nodeProfile";
    }

    @GetMapping("/update")
    public String updateNodefetch(@ModelAttribute NodeDto nodeDto, Model model,
                                  RedirectAttributes redirectAttributes) {

        NodeDto response = nodeService.updateNode(nodeDto);
        model.addAttribute("rolesList", roleService.getAllRoleNames());
        redirectAttributes.addFlashAttribute("message", response.getMessage());
        redirectAttributes.addFlashAttribute("colour", response.getColour());

        return "nodeProfile";
    }

    @PostMapping("/update")
    public String updateNode(@ModelAttribute NodeDto nodeDto,
                             RedirectAttributes redirectAttributes) {

        NodeDto response = nodeService.updateNode(nodeDto);

        redirectAttributes.addFlashAttribute("message", response.getMessage());
        redirectAttributes.addFlashAttribute("colour", response.getColour());

        return "redirect:/node/profile/" + nodeDto.getId();
    }

    @GetMapping("/delete/{id}")
    public String deleteNode(@PathVariable long id, RedirectAttributes redirectAttributes) {
        nodeService.deleteNode(id);
        redirectAttributes.addFlashAttribute("message", "Node deleted successfully!");
        redirectAttributes.addFlashAttribute("colour", "green");
        return "redirect:/node/list";
    }
}