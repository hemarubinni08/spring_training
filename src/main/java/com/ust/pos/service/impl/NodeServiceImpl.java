package com.ust.pos.service.impl;


import com.ust.pos.dto.NodeDto;
import com.ust.pos.model.Node;
import com.ust.pos.model.NodeRepository;
import com.ust.pos.service.NodeService;
import jakarta.transaction.Transactional;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
@Component
@Transactional
public class NodeServiceImpl implements NodeService {
    @Autowired
    NodeRepository nodeRepository;
    @Autowired
    ModelMapper modelMapper;

    @Override
    public NodeDto addNode(NodeDto nodeDto) {
        if (nodeRepository.findByName(nodeDto.getName()) == null &&
                nodeRepository.findByPath(nodeDto.getPath()) == null) {
            Node node = modelMapper.map(nodeDto, Node.class);
            nodeRepository.save(node);
            nodeDto.setSuccess(true);
            return modelMapper.map(node, NodeDto.class);
        } else {
            nodeDto.setSuccess(false);
            return nodeDto;
        }
    }

    @Override
    public List<NodeDto> getAll() {
        List<Node> nodes = nodeRepository.findAll();
        return nodes.stream().map(node -> modelMapper.map(node, NodeDto.class)).toList();
    }

    @Override
    public void deleteNode(long id) {
        nodeRepository.deleteById(id);
    }

    @Override
    public NodeDto updateNode(NodeDto nodeDto) {
        Node nameNode = nodeRepository.findByName(nodeDto.getName());
        if (nameNode != null && nameNode.getId() != nodeDto.getId()) {
            nodeDto.setSuccess(false);
            return nodeDto;
        } else {
            Node existingNode = modelMapper.map(nodeDto, Node.class);
            nodeRepository.save(existingNode);
            nodeDto.setSuccess(true);
            return modelMapper.map(existingNode, NodeDto.class);
        }
    }

    @Override
    public NodeDto getById(long id) {
        Optional<Node> node = nodeRepository.findById(id);
        if (node.isPresent()) {
            return modelMapper.map(node, NodeDto.class);
        } else {
            return null;
        }
    }

}
