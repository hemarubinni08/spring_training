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
    public NodeDto addNode(NodeDto nodeDto) {
        if (nodeRepository.existsByName(nodeDto.getName())) {
            nodeDto.setMessage("Name Already exists");
            nodeDto.setSuccess(false);
            return nodeDto;
        }
        Node node = modelMapper.map(nodeDto, Node.class);
        nodeRepository.save(node);
        nodeDto.setMessage("success");
        nodeDto.setSuccess(true);
        return nodeDto;
    }

    @Override
    public List<NodeDto> getNodes() {
        List<Node> nodes = nodeRepository.findAll();
        List<NodeDto> nodeDtos = new ArrayList<>();
        for (Node node : nodes) {
            nodeDtos.add(modelMapper.map(node, NodeDto.class));
        }
        return nodeDtos;
    }

    @Override
    public void deleteDetailsNode(Long id) {
        nodeRepository.deleteById(id);

    }

    @Override
    public NodeDto updateValueNode(NodeDto nodeDto) {
        Optional<Node> node1 = nodeRepository.findById(nodeDto.getId());
        if (node1.isPresent()) {
            Node node = node1.get();
            if (!node.getName().equals(nodeDto.getName())) {
                if (nodeRepository.existsByName(nodeDto.getName())) {
                    nodeDto.setMessage("Name Already Exists");
                    nodeDto.setSuccess(false);
                    return nodeDto;
                }
            }
        }
        Node node = modelMapper.map(nodeDto, Node.class);
        nodeRepository.save(node);
        nodeDto.setMessage("Modified");
        nodeDto.setSuccess(true);
        return nodeDto;
    }

    @Override
    public NodeDto findAllNodes(Long id) {
        Optional<Node> node = nodeRepository.findById(id);
        return modelMapper.map(node, NodeDto.class);
    }
}