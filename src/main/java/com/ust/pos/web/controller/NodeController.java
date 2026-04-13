package com.ust.pos.web.controller;

import com.ust.pos.dto.NodeDto;
import com.ust.pos.service.NodeService;
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

    // ================= ADD =================

    @PostMapping("/addNode")
    public String addNode(@ModelAttribute NodeDto nodeDto,
                          RedirectAttributes redirectAttributes) {

        // ✅ USE SERVICE RESULT (important)
        NodeDto response = nodeService.addNode(nodeDto);

        redirectAttributes.addFlashAttribute("message", response.getMessage());
        redirectAttributes.addFlashAttribute("colour", response.getColour());

        return "redirect:/node/nodesList";
    }

    // ================= LIST =================

    @GetMapping("/nodesList")
    public String nodesList(Model model) {
        model.addAttribute("nodesList", nodeService.getAllNodes());
        return "nodesList";
    }

    // ================= DELETE =================

    @GetMapping("/deletenode/{id}") // ✅ matches JSP
    public String deleteNode(@PathVariable long id,
                             RedirectAttributes redirectAttributes) {

        nodeService.deleteNode(id);
        redirectAttributes.addFlashAttribute("message", "Node deleted successfully!");
        redirectAttributes.addFlashAttribute("colour", "green");

        return "redirect:/node/nodesList";
    }

    // ================= UPDATE =================

    @PostMapping("/updateNode")
    public String updateNode(@ModelAttribute NodeDto nodeDto,
                             RedirectAttributes redirectAttributes) {

        NodeDto response = nodeService.updateNode(nodeDto);

        redirectAttributes.addFlashAttribute("message", response.getMessage());
        redirectAttributes.addFlashAttribute("colour", response.getColour());

        return "redirect:/node/nodeProfile/" + nodeDto.getId();
    }

    // ================= PROFILE =================

    @GetMapping("/nodeProfile/{id}")
    public String nodeProfile(@PathVariable long id, Model model) {
        model.addAttribute("nodeDto", nodeService.getNode(id));
        return "nodeProfile";
    }
}