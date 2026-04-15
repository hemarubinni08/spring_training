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

@Service
public class NodeServiceImpl implements NodeService {

    @Autowired
    private NodeRepository nodeRepository;

    @Autowired
    private ModelMapper modelMapper;

    @Override
    public boolean createNode(NodeDto nodeDto) {

        if (nodeRepository.existsByName(nodeDto.getName())) return false;
        if (nodeRepository.existsByPath(nodeDto.getPath())) return false;

        Node node = modelMapper.map(nodeDto, Node.class);
        nodeRepository.save(node);

        return true;
    }

    @Override
    public List<NodeDto> getAllNodes() {

        List<NodeDto> list = new ArrayList<>();

        for (Node node : nodeRepository.findAll()) {
            list.add(modelMapper.map(node, NodeDto.class));
        }

        return list;
    }

    @Override
    public boolean updateNode(NodeDto nodeDto) {

        Node existing = nodeRepository.findById(nodeDto.getId()).orElseThrow();

        if (nodeRepository.existsByName(nodeDto.getName())
                && !existing.getName().equals(nodeDto.getName())) {
            return false;
        }

        Node node = modelMapper.map(nodeDto, Node.class);
        nodeRepository.save(node);

        return true;
    }

    @Override
    public void deleteNode(Long id) {
        nodeRepository.deleteById(id);
    }
}