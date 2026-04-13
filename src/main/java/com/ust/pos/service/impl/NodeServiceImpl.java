package com.ust.pos.service.impl;

import com.ust.pos.dto.NodeDto;
import com.ust.pos.model.Node;
import com.ust.pos.model.NodeRepository;
import com.ust.pos.service.NodeService;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
public class NodeServiceImpl implements NodeService {
    @Autowired
    private NodeRepository nodeRepository;

    @Autowired
    private ModelMapper modelMapper;


    @Override
    public List<NodeDto> getAllNodes() {
        List<Node> nodesList=nodeRepository.findAll();
        List<NodeDto> nodeDtosList=new ArrayList<>();
        for (Node node:nodesList){
            nodeDtosList.add(modelMapper.map(node,NodeDto.class));
        }
        return nodeDtosList;
    }

    @Override
    public boolean addNode(NodeDto nodeDto) {
        boolean existingNode=nodeRepository.existsByName(nodeDto.getName());
        if(existingNode){
            return false;
        }
        else {
            Node node=modelMapper.map(nodeDto,Node.class);
            nodeRepository.save(node);
            return true;
        }

    }

    @Override
    public void updateNode(NodeDto nodeDto) {
        Optional<Node> node=nodeRepository.findById(nodeDto.getId());
        if (node.isPresent()){
//            Node existingNode=node.get();
//            if(existingNode.getName().equalsIgnoreCase(nodeDto.getName())){
//                if (nodeRepository.findByName(NodeDto.getName())==null)
//                modelMapper.map(nodeDto,Node.class);
//
//            }
            Node updatedNode=modelMapper.map(nodeDto,Node.class);
            nodeRepository.save(updatedNode);
        }
    }

    public void deleteNode(Long id) {
        nodeRepository.deleteById(id);
    }

    public NodeDto getNodeProfile(Long id) {
        Optional<Node> node=nodeRepository.findById(id);
        NodeDto nodeDto=modelMapper.map(node,NodeDto.class);
        return nodeDto;
    }
}
