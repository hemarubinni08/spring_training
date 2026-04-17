package com.ust.pos.service.impl;

import com.ust.pos.dto.NodeDto;
import com.ust.pos.model.Node;
import com.ust.pos.model.NodeRepository;
import com.ust.pos.service.NodeService;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class NodeServiceImpl implements NodeService {

    @Autowired
    private ModelMapper modelMapper;

    @Autowired
    private NodeRepository nodeRepository;

    @Override
    public List<NodeDto> fetchNode() {
        return nodeRepository.findAll()
                .stream()
                .map(node -> modelMapper.map(node, NodeDto.class))
                .collect(Collectors.toList());
    }

    @Override
    public void deleteById(Long id) {
        nodeRepository.deleteById(id);
    }

    @Override
    public NodeDto findById(Long id) {
        return nodeRepository.findById(id)
                .map(node -> modelMapper.map(node, NodeDto.class))
                .orElse(null);
    }

    @Override
    public boolean updateByNode(NodeDto nodeDto) {
        if (!nodeRepository.existsById(nodeDto.getId())) {
            return false;
        }
        if (nodeRepository.existsByNameAndIdNot(
                nodeDto.getName(), nodeDto.getId())) {
            return false;
        }
        Node node = nodeRepository.findById(nodeDto.getId()).get();
        node.setName(nodeDto.getName());
        node.setPath(nodeDto.getPath());
        nodeRepository.save(node);
        return true;
    }

    @Override
    public NodeDto addNodeData(NodeDto nodeDto) {
        Node existingNode = nodeRepository.findByName(nodeDto.getName());
        if (existingNode != null) {
            return null;
        }
        Node node = modelMapper.map(nodeDto, Node.class);
        Node saved = nodeRepository.save(node);
        return modelMapper.map(saved, NodeDto.class);
    }
}