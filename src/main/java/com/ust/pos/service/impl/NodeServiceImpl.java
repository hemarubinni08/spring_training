package com.ust.pos.service.impl;

import com.ust.pos.dto.NodeDto;
import com.ust.pos.model.Node;
import com.ust.pos.model.NodeRepository;
import com.ust.pos.service.NodeService;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
public class NodeServiceImpl implements NodeService {
    @Autowired
    NodeRepository nodeRepository;
    @Autowired
    ModelMapper modelMapper;

    @Override
    public NodeDto addNode(NodeDto nodeDto) {
        Node existingNode = nodeRepository.findByName(nodeDto.getName());
        if (existingNode != null) {
            return null;
        }
        Node node = modelMapper.map(nodeDto, Node.class);
        Node savednode = nodeRepository.save(node);
        return modelMapper.map(savednode, NodeDto.class);
    }

    @Override
    public List<NodeDto> listAllNodes() {
        List<Node> nodes = nodeRepository.findAll();
        return nodes.stream()
                .map(node -> modelMapper.map(node, NodeDto.class))
                .collect(Collectors.toList());
    }

    @Override
    public void deleteNodeById(Long id) {
        nodeRepository.deleteById(id);
    }

    @Override
    public NodeDto getNodeById(Long id) {
        Optional<Node> node = nodeRepository.findById(id);
        return modelMapper.map(node, NodeDto.class);
    }

    @Override
    public boolean nodeFindsForUpdate(String name, Long id) {
        return nodeRepository.existsByNameAndIdNot(name, id); //update validation
    }

    @Override
    public void updateNode(NodeDto nodeDto) {
        Node node = modelMapper.map(nodeDto, Node.class);
        nodeRepository.save(node);
    }
}