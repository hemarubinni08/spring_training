package com.ust.pos.service.impl;

import com.ust.pos.dto.NodeDto;
import com.ust.pos.dto.UserDto;
import com.ust.pos.model.Node;
import com.ust.pos.model.NodeRepository;
import com.ust.pos.model.User;
import com.ust.pos.service.NodeService;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;
@Service
public class NodeServiceImpl implements NodeService {

    @Autowired
    private NodeRepository nodeRepository;

    @Autowired
    ModelMapper modelMapper;

    @Override
    public NodeDto addNode(NodeDto nodeDto) {

        Node existingNode = nodeRepository.findByPath(nodeDto.getPath());
        if (existingNode != null) {
            nodeDto.setSuccess(false);
            return nodeDto;
        }
        else {
            Node node = modelMapper.map(nodeDto, Node.class);
            nodeRepository.save(node);
            nodeDto.setSuccess(true);
            return nodeDto;
        }
    }

    @Override
    public NodeDto updateNode(NodeDto nodeDto) {
        Node existingNode = nodeRepository.findByPath(nodeDto.getPath());
        if (existingNode != null) {
            nodeDto.setSuccess(false);
            return nodeDto;
        }
        else {
            Node node = modelMapper.map(nodeDto, Node.class);
            nodeRepository.save(node);
            nodeDto.setSuccess(true);
            return nodeDto;
        }

    }

    @Override
    public List<NodeDto> findAllNode() {
        List<Node> nodeList = nodeRepository.findAll();
        return nodeList.stream().map(node -> modelMapper.map(node, NodeDto.class)).toList();
    }

    @Override
    public NodeDto getNode(Long id) {
        Optional<Node> node = nodeRepository.findById(id);
        return modelMapper.map(node, NodeDto.class);
    }

    @Override
    public void deleteNode(Long id) {
        Optional<Node> role = nodeRepository.findById(id);
        nodeRepository.deleteById(id);
    }
}
