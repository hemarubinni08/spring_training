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
        List<Node> nodes = nodeRepository.findAll();
        List<NodeDto> result = new ArrayList<>();
        for (Node node : nodes) {
            result.add(modelMapper.map(node, NodeDto.class));
        }
        return result;
    }

    @Override
    public boolean addNode(NodeDto nodeDto) {
        if (nodeRepository.existsByName(nodeDto.getName())) {
            return false;
        }
        Node node = modelMapper.map(nodeDto, Node.class);
        nodeRepository.save(node);
        return true;
    }

    @Override
    public void updateNode(NodeDto nodeDto) {
        Optional<Node> nodeOpt = nodeRepository.findById(nodeDto.getId());

        if (nodeOpt.isEmpty()) {
            return;
        }

        Node existingNode = nodeOpt.get();

        if (!existingNode.getName().equalsIgnoreCase(nodeDto.getName())) {
            if (nodeRepository.existsByName(nodeDto.getName())) {
                return;
            }
        }

        modelMapper.map(nodeDto, existingNode);
        nodeRepository.save(existingNode);
    }

    public void deleteNode(Long id) {
        nodeRepository.deleteById(id);
    }

    public NodeDto getNodeProfile(Long id) {
        Optional<Node> nodeOpt = nodeRepository.findById(id);
        return nodeOpt.map(node -> modelMapper.map(node, NodeDto.class)).orElse(null);
    }
}