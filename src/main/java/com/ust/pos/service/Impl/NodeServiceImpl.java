package com.ust.pos.service.Impl;

import com.ust.pos.dto.NodeDto;
import com.ust.pos.model.Node;
import com.ust.pos.model.NodeRepository;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class NodeServiceImpl implements NodeService {
    @Autowired
    private final NodeRepository nodeRepository;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Autowired
    private final ModelMapper modelMapper;

    public NodeServiceImpl(NodeRepository nodeRepository, ModelMapper modelMapper) {
        this.nodeRepository = nodeRepository;
        this.modelMapper = modelMapper;
    }

    @Override
    public NodeDto addNode(NodeDto nodeDto) {
        if (nodeRepository.existsByName(nodeDto.getName())) {
            nodeDto.setMessage("Node Already Exist!");
            return nodeDto;
        }
        Node node = new Node();
        modelMapper.map(nodeDto, node);
        nodeRepository.save(node);
        return nodeDto;
    }


    @Override
    public void deleteNode(Long id) {
        nodeRepository.deleteById(id);
    }

    @Override
    public NodeDto findById(Long id) {
        Node node = nodeRepository.findById(id).orElseThrow();
        return modelMapper.map(node, NodeDto.class);
    }

    @Override
    public NodeDto editNode(NodeDto nodeDto) {
        Node node = nodeRepository.findById(nodeDto.getId()).orElseThrow();
        if (!nodeDto.getName().equalsIgnoreCase(node.getName())) {
            if (nodeRepository.existsByName(nodeDto.getName())) {
                nodeDto.setMessage("Node Already Exist!");
                return nodeDto;
            } else {
                node.setName(nodeDto.getName());
            }
        }
        node.setPath(nodeDto.getPath());
        node.setRoles(nodeDto.getRoles());
        nodeRepository.save(node);
        return nodeDto;
    }

    @Override
    public List<NodeDto> getAllNode() {
        List<Node> node = nodeRepository.findAll();
        List<NodeDto> totalNode = new ArrayList<>();
        for (Node i : node) {
            totalNode.add(modelMapper.map(i, NodeDto.class));
        }
        return totalNode;
    }
}
