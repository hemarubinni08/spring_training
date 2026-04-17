package com.ust.pos.web.controller;

import com.ust.pos.dto.NodeDto;
import com.ust.pos.service.NodeService;
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

    @PostMapping("/addnode")
    public String nodeAdd(Model model, @ModelAttribute NodeDto nodeDto)
    {
        NodeDto nodeDto1 = nodeService.add(nodeDto);
        if(nodeDto1.getMessage() != null)
        {
            model.addAttribute("node", nodeDto1);
            return "addnode";
        }
        model.addAttribute("node", nodeDto1);
        return "redirect:/node/displaynode";
    }

    @GetMapping("/addnode")
    public String donodeAdd(Model model, @ModelAttribute NodeDto nodeDto)
    {
        model.addAttribute("node", nodeDto);
        return "addnode";
    }

    @GetMapping("/displaynode")
    public String displaynode(Model model, @ModelAttribute NodeDto nodeDto)
    {
        List<NodeDto> listofnodes = nodeService.display();
        model.addAttribute("nodes", listofnodes);
        return "displaynode";
    }

    @GetMapping("/deletenode")
    public String deletenode(Model model, @RequestParam long id, RedirectAttributes redirectAttributes)
    {
        nodeService.delete(id);
        redirectAttributes.addFlashAttribute("msg", "Node successfully deleted");
        return "redirect:/node/displaynode";
    }

    @PostMapping("/updatenode")
    public String updatenode(Model model, @ModelAttribute NodeDto nodeDto)
    {
        NodeDto nodeDto1 = nodeService.update(nodeDto);
        if(nodeDto1.getMessage()!=null)
        {
            model.addAttribute("node", nodeDto1);
            return "updatenode";
        }
        model.addAttribute("node", nodeDto1);
        return "redirect:/node/displaynode";
    }

    @GetMapping("/updatenode")
    public String doupdatenode(Model model, @RequestParam long id)
    {
        NodeDto nodeDto = nodeService.findId(id);
        model.addAttribute("node", nodeDto);
        return "updatenode";
    }
}
