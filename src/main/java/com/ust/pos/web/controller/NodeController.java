package com.ust.pos.web.controller;

import com.ust.pos.dto.NodeDto;
import com.ust.pos.dto.RoleDto;
import com.ust.pos.model.Node;
import com.ust.pos.service.NodeService;
import com.ust.pos.service.RoleService;
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

    @GetMapping("/addNode")
    public String addNode(Model model){
        List<RoleDto> roleDtoList = roleService.roleList();
        model.addAttribute("roleDtoList",roleDtoList);
        model.addAttribute("nodeDto", new NodeDto());
        return "addNode";
    }

    @PostMapping("/addNode")
    public String addNode(Model model, @ModelAttribute NodeDto nodeDto){
        boolean state = nodeService.addNode(nodeDto);
        String status = "";
        if (state) {
            status = "Success";
        } else {
            status = "Node already exist";
        }
        model.addAttribute("state", status);
        model.addAttribute("linkPage", "/node/addNode");
        return "success";
    }

    @GetMapping("/getAllNodes")
    public String getAllNodes(Model model){
        List<NodeDto> nodeDtoList = nodeService.getAllNodes();
        model.addAttribute("nodeDtoList", nodeDtoList);
        return "displayNodes";
    }

    @GetMapping("/deleteNodeById/{id}")
    public String deleteNodeById(@PathVariable Long id){
        nodeService.deleteNodeById(id);
        return "redirect:/node/getAllNodes";
    }

    @GetMapping("/updateNodeByid/{id}")
    public String updateNodeByid(Model model, @PathVariable Long id){
        NodeDto nodeDto = nodeService.getNodeDetails(id);
        model.addAttribute("nodeDto", nodeDto);
      //  model.addAttribute("nodeDto", new NodeDto());
        List<RoleDto> roleDtoList = roleService.roleList();
        model.addAttribute("roleDtoList",roleDtoList);
        return "nodeDetails";
    }

    @PostMapping("/updateNodeByid/{id}")
    public String updateNodeByid(Model model, @ModelAttribute NodeDto nodeDto){
        boolean state = nodeService.updateNode(nodeDto);
        if(state){
            return "redirect:/node/getAllNodes";
        }else {
            model.addAttribute("state","Node already exist");
            model.addAttribute("linkPage", "/node/getAllNodes");
            return "success";
        }
    }
}
