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
    ModelMapper modelMapper;
    @Autowired
    private NodeRepository nodeRepository;

    @Override
    public NodeDto addNode(NodeDto nodeDto) {
        Node existingNode = nodeRepository.findByName(nodeDto.getName());
        if (existingNode != null) {
            return null;
        }
        Node node = modelMapper.map(nodeDto, Node.class);
        Node savedNode = nodeRepository.save(node);
        return modelMapper.map(savedNode, NodeDto.class);
    }

    @Override
    public List<NodeDto> getAllNodes() {
        List<Node> nodes = nodeRepository.findAll();
        return nodes.stream().map(node -> modelMapper.map(node, NodeDto.class))
                .collect(Collectors.toList());
    }

    @Override
    public void deleteNode(Long id) {
        nodeRepository.deleteById(id);
    }

    @Override
    public NodeDto findById(Long id) {
        Optional<Node> node = nodeRepository.findById(id);
        return modelMapper.map(node, NodeDto.class);
    }

    @Override
    public NodeDto updateNode(NodeDto nodeDto) {

        if (nodeDto.getId() == null) {
            return null;
        }

        Node existingNode = nodeRepository.findById(nodeDto.getId()).orElse(null);

        if (existingNode == null) {
            return null;
        }

        String newName = nodeDto.getName().trim();
        String newPath = nodeDto.getPath().trim();
        String newRole = nodeDto.getRole().trim();
        String newRoles = nodeDto.getRoles().trim();
        Node nodeByName = nodeRepository.findByName(newName);

        if (nodeByName != null && !nodeByName.getId().equals(existingNode.getId())) {

            return null;
        }

        existingNode.setName(newName);
        existingNode.setPath(newPath);
        existingNode.setRole(newRole);
        existingNode.setRoles(newRoles);
        Node updatedNode = nodeRepository.save(existingNode);
        return modelMapper.map(updatedNode, NodeDto.class);
    }

}
