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
    public boolean createNode(NodeDto nodeDto) {

        if (nodeRepository.existsByName(nodeDto.getName())) {
            return false;
        }

        if (nodeRepository.existsByPath(nodeDto.getPath())) {
            return false;
        }


        Node node = modelMapper.map(nodeDto, Node.class);
        nodeRepository.save(node);
        return true;
    }

    @Override
    public List<NodeDto> getAllNodes() {

        List<NodeDto> node_list = new ArrayList<>();

        for (Node node : nodeRepository.findAll()) {
            node_list.add(modelMapper.map(node, NodeDto.class));
        }

        return node_list;
    }

    @Override
    public NodeDto getNode(Long id) {
        Optional<Node> node=nodeRepository.findById(id);
        return modelMapper.map(node,NodeDto.class);
    }


    @Override
    public boolean updateNode(NodeDto nodeDto) {
        boolean flag = nodeRepository.existsByName(nodeDto.getName());
        Node existingNode = nodeRepository.findById(nodeDto.getId()).orElseThrow();
        if (flag != false && existingNode.getId() != nodeDto.getId()) {
            nodeDto.setSuccess(false);
            return false;
        } else {
            Node node = modelMapper.map(nodeDto, Node.class);
            nodeRepository.save(node);
            nodeDto.setSuccess(true);
            return false;
        }
    }

    @Override
    public void deleteNode(Long id) {
        nodeRepository.deleteById(id);
    }
}