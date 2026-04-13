package com.ust.pos.web.controller;

import com.ust.pos.dto.NodeDto;
import com.ust.pos.dto.RoleDto;
import com.ust.pos.service.NodeService;
import org.modelmapper.ModelMapper;
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
    private ModelMapper modelMapper;
    @GetMapping("/addnode")
    public String node(Model model, @ModelAttribute RoleDto roleDto){
        return "addNode";
    }
    @PostMapping("/addnode")
    public String addNode(Model model, @ModelAttribute NodeDto nodeDto){
        boolean success= nodeService.addNode(nodeDto);
        return "redirect:/node/listallnodes";
    }
    @GetMapping("/listallnodes")
    public String getAllNodes(Model model){
        model.addAttribute("nodes",nodeService.getAllNodes());
        return "listAllNodes";
    }
    @GetMapping("/deletenode/{id}")
    public String deleteNode(Model model, @PathVariable Long id){
        nodeService.deleteNode(id);
        return "redirect:/node/listallnodes";
    }
    @GetMapping("/nodeprofile/{id}")
    public String nodeProfile(Model model, @PathVariable Long id){
        model.addAttribute("node",nodeService.getNodeProfile(id));
        return "nodeProfile";
    }
    @PostMapping("/updatenode")
    public String updateNode(Model model,@ModelAttribute NodeDto nodeDto){
        nodeService.updateNode(nodeDto);
        return "redirect:/node/listallnodes";
    }


}
