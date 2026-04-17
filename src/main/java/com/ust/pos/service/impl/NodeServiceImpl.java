package com.ust.pos.service.impl;

import com.ust.pos.dto.NodeDto;
import com.ust.pos.model.Node;
import com.ust.pos.model.NodeRepository;
import com.ust.pos.service.NodeService;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
@Transactional
public class NodeServiceImpl implements NodeService {
    @Autowired
    NodeRepository nodeRepository;
    @Autowired
    ModelMapper modelMapper;


    @Override
    public NodeDto add(NodeDto nodeDto) {
        Node node = nodeRepository.findByName(nodeDto.getName());
        if(node == null)
        {
            Node node1 = modelMapper.map(nodeDto, Node.class);
            nodeRepository.save(node1);
            return nodeDto;
        }
        else
        {
            nodeDto.setMessage("Node already exists");
        }
        return nodeDto;
    }

    @Override
    public List<NodeDto> display() {
        List<Node> listofnodes = nodeRepository.findAll();
        return listofnodes.stream().map(node->modelMapper.map(node, NodeDto.class)).collect(Collectors.toList());
    }

    @Override
    public void delete(long id) {
        nodeRepository.deleteById(id);
    }

    @Override
    public NodeDto update(NodeDto nodeDto) {
        Optional<Node> nodeOptional = nodeRepository.findById(nodeDto.getId());
        Node node = nodeOptional.get();
        if (!nodeDto.getName().equalsIgnoreCase(node.getName()))
        {
            if (nodeRepository.findByName(nodeDto.getName()) != null) {
                nodeDto.setMessage("Node already exists");
                return nodeDto;
            }
        }
        modelMapper.map(nodeDto, node);
        nodeRepository.save(node);
        return nodeDto;
    }

    @Override
    public NodeDto findId(long id) {
        Optional<Node> nodeOptional = nodeRepository.findById(id);
        NodeDto node = modelMapper.map(nodeOptional.get(), NodeDto.class);
        return node;
    }
}
