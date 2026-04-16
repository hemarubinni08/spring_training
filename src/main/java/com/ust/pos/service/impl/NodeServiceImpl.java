package com.ust.pos.service.impl;

import com.ust.pos.dto.NodeDto;
import com.ust.pos.model.Node;
import com.ust.pos.model.NodeRepository;
import com.ust.pos.service.NodeServiceInterface;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service

public class NodeServiceImpl implements NodeServiceInterface {

    @Autowired
    private NodeRepository nodeRepository;

    @Autowired
    private ModelMapper modelMapper;


    @Override
    public void addNode(NodeDto nodeDto) {

        String name = nodeDto.getName().trim();

        if (nodeRepository.existsByNameIgnoreCase(name)) {
            throw new RuntimeException("Node name already exists!");
        }

        nodeDto.setName(name); // optional but good practice
        Node node = modelMapper.map(nodeDto, Node.class);
        node.setRoles(nodeDto.getRoles());
        nodeRepository.save(node);
    }

    @Override
    public List<NodeDto> getAllNodes() {

        return nodeRepository.findAll()
                .stream()
                .map(node -> modelMapper.map(node, NodeDto.class))
                .toList();
    }

    @Override
    public void deleteById(long id) {nodeRepository.deleteById(id);}

    @Override
    public NodeDto getNodeById(long id) {

        Node node = nodeRepository.findById(id);
        return modelMapper.map(node, NodeDto.class);
    }

    @Override
    public NodeDto updateNode(NodeDto nodeDto) {

        Node existingNode = nodeRepository.findById(nodeDto.getId());
        modelMapper.map(nodeDto, existingNode);
        nodeRepository.save(existingNode);
        existingNode.setRoles(nodeDto.getRoles());
        return modelMapper.map(existingNode, NodeDto.class);
    }
}
