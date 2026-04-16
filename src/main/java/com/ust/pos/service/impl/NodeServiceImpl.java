package com.ust.pos.service.impl;

import com.ust.pos.dto.NodeDto;
import com.ust.pos.model.Node;
import com.ust.pos.model.NodeRepository;
import com.ust.pos.service.NodeService;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class NodeServiceImpl implements NodeService {
    @Autowired
    private NodeRepository nodeRepository;
    @Autowired
    private ModelMapper modelMapper;

    @Override
    public NodeDto addNode(NodeDto nodeDto) {
        Node node = modelMapper.map(nodeDto, Node.class);
        Node savedNode = nodeRepository.save(node);
        return modelMapper.map(savedNode, NodeDto.class);
    }

    @Override
    public List<NodeDto> listOfNodes() {
        List<Node> nodes = nodeRepository.findAll();
        return nodes.stream().map((node -> modelMapper.map(node, NodeDto.class))).toList();
    }

    @Override
    public NodeDto getNodeById(Long id) {
        Node node = nodeRepository.getById(id);
        return modelMapper.map(node, NodeDto.class);
    }

    @Override
    public NodeDto updateNode(NodeDto nodeDto) {
        Node existingNode = nodeRepository.findByName(nodeDto.getName());
        if (existingNode != null && !existingNode.getId().equals(nodeDto.getId())) {
            nodeDto.setSuccess(false);
            return nodeDto;
        }
        Node node = modelMapper.map(nodeDto, Node.class);
        nodeRepository.save(node);
        nodeDto.setSuccess(true);
        return nodeDto;
    }

    @Override
    public void deleteNode(Long id) {
        nodeRepository.deleteById(id);
    }

}

