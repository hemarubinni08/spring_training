package com.ust.pos.service.impl;

import com.ust.pos.dto.NodeDto;
import com.ust.pos.model.Node;
import com.ust.pos.model.NodeRepository;
import com.ust.pos.service.NodeService;
import jakarta.transaction.Transactional;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Transactional

public class NodeServiceImpl implements NodeService {
    @Autowired
    private NodeRepository nodeRepository;
    @Autowired
    private ModelMapper modelMapper;

    @Override
    public NodeDto addNode(NodeDto nodeDto) {
        Node node = modelMapper.map(nodeDto, Node.class);
        Node saved = nodeRepository.save(node);
        return nodeDto;
    }

    @Override
    public void updateNode(NodeDto nodeDto) {
        Node node = modelMapper.map(nodeDto, Node.class);
        nodeRepository.save(node);
    }

    @Override
    public List<NodeDto> getAllNodes() {
        List<Node> nodeList = nodeRepository.findAll();
        List<NodeDto> nodeDtoList = nodeList.stream().map(node -> modelMapper.map(node, NodeDto.class)).toList();
        return nodeDtoList;
    }

    @Override
    public void deleteNode(Long id) {
        nodeRepository.deleteById(id);
    }

    @Override
    public NodeDto getNodeById(Long id) {
        Node node = nodeRepository.getById(id);
        return modelMapper.map(node, NodeDto.class);
    }
}