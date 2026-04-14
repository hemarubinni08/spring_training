package com.ust.pos.service.impl;

import com.ust.pos.dto.NodeDto;
import com.ust.pos.model.Node;
import com.ust.pos.model.NodeRepository;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class NodeServiceImpl implements NodeService {
    @Autowired
    ModelMapper modelMapper;
    @Autowired
    NodeRepository nodeRepository;

    @Override
    public NodeDto addNode(NodeDto nodeDto) {
        Node node = modelMapper.map(nodeDto, Node.class);
        nodeRepository.save(node);
        return nodeDto;
    }

    @Override
    public List<NodeDto> findAllNodes() {
        List<Node> nodes = nodeRepository.findAll();
        return nodes.stream().map(node -> modelMapper.map(node, NodeDto.class)).toList();
    }

    @Override
    public void deleteById(long id) {
        nodeRepository.deleteById(id);
    }

    @Override
    public boolean updateData(NodeDto nodeDto) {
        Optional<Node> nodeOptional = nodeRepository.findById(nodeDto.getId());
        if (nodeOptional.isPresent()) {
            Node node = nodeRepository.findByNameAndIdNot(nodeDto.getName(), nodeDto.getId());
            if (node != null) {
                return false;
            }
            node = nodeOptional.get();
            modelMapper.map(nodeDto, node);
            nodeRepository.save(node);
            return true;
        }
        return true;
    }

    @Override
    public NodeDto findById(long id) {
        Optional<Node> nodeOptional = nodeRepository.findById(id);
        NodeDto nodeDto = new NodeDto();
        if (nodeOptional.isPresent()) {
            return modelMapper.map(nodeOptional.get(), NodeDto.class);
        }
        return nodeDto;
    }
}