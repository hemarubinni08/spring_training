package com.ust.pos.service.impl;

import com.ust.pos.dto.NodeDto;
import com.ust.pos.model.Node;
import com.ust.pos.model.NodeRepository;
import com.ust.pos.model.Role;
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
    NodeRepository nodeRepository;

    @Autowired
    ModelMapper modelMapper;

    @Override
    public boolean addNode(NodeDto nodeDto) {
        Node ExistingNode = nodeRepository.findByName(nodeDto.getName());
        if (ExistingNode==null){
            Node node = modelMapper.map(nodeDto,Node.class);
            nodeRepository.save(node);
            return true;
        }
        return false;
    }

    @Override
    public List<NodeDto> getAllNodes() {
        List<Node> nodeList = nodeRepository.findAll();
        List<NodeDto> nodeDtoList = new ArrayList<>();
        for (Node node : nodeList){
            NodeDto nodeDto = modelMapper.map(node, NodeDto.class);
            nodeDtoList.add(nodeDto);
        }
        return nodeDtoList;
    }

    @Override
    public void deleteNodeById(Long id) {
        nodeRepository.deleteById(id);
    }

    @Override
    public NodeDto getNodeDetails(Long id) {
        Optional<Node> nodeOptional = nodeRepository.findById(id);
        Node  node = nodeOptional.get();
        NodeDto nodeDto = modelMapper.map(node,NodeDto.class);
        return nodeDto;
    }

    @Override
    public boolean updateNode(NodeDto nodeDto) {
        Optional<Node> node = nodeRepository.findById(nodeDto.getId());
        Node nodeWithSameName = nodeRepository.findByName(nodeDto.getName());

        if (nodeWithSameName==null){
            node.get().setRoleIds(null);
            modelMapper.map(nodeDto,node.get());
            nodeRepository.save(node.get());
            return true;
        }
        else {
            if (nodeWithSameName.getId() == node.get().getId()){
                node.get().setRoleIds(null);
                modelMapper.map(nodeDto,node.get());
                nodeRepository.save(node.get());
                return true;
            }
        }
        return false;
    }
}
