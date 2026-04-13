package com.ust.pos.web.controller;


import com.ust.pos.dto.NodeDto;
import com.ust.pos.dto.RoleDto;
import com.ust.pos.service.NodeService;
import com.ust.pos.service.RoleService;
import com.ust.pos.service.impl.NodeServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/node")
public class NodeController {
    @Autowired
    NodeService nodeService;
    @Autowired
    RoleService roleService;
    @PostMapping("/addNode")
    public String addNode(Model model, @ModelAttribute NodeDto nodeDto){
        NodeDto nodeDto1 = nodeService.addNode(nodeDto);
        if(nodeDto1.isSuccess()){
            model.addAttribute("node","Node Added Successfully");
        }
        else{
            model.addAttribute("node","Node Already Exist");
        }
        return ("successNode");
    }
    @GetMapping("/addNode")
    public String addNode1(Model model , @ModelAttribute NodeDto nodeDto){
        model.addAttribute("roles",roleService.getAllRoles());
        return("addNode");
    }
    @GetMapping("/listOfNodes")
    public String listOfNodes(Model model){
        List<NodeDto> nodeDtos = nodeService.getAll();
        model.addAttribute("node",nodeDtos);
        return ("allNodes");
    }
    @GetMapping("/deleteNode")
    public String deleteNode(Model model , @RequestParam long id){
        nodeService.deleteNode(id);
        model.addAttribute("node","Deleted Successfully");
        return("redirect:/node/listOfNodes");
    }
    @PostMapping("/updateNode")
    public String updateNode(Model model , @ModelAttribute NodeDto nodeDto){
        NodeDto nodeDto1 = nodeService.updateNode(nodeDto);
        if(nodeDto1.isSuccess()){
            model.addAttribute("node","Node already Exists");
        }
        else{
            model.addAttribute("node", "Node Updates Successfully");
        }
        return("redirect:/node/listOfNodes");
    }
    @GetMapping("updateNode")
    public String updateNode1(Model model, @RequestParam long id){
        NodeDto nodeDto = nodeService.getById(id);
        model.addAttribute("node",nodeDto);
        return ("updateNode");
    }
}
