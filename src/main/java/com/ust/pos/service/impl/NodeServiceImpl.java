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
    public boolean addNode(NodeDto nodeDto) {
        Node checkPath = nodeRepository.findByName(nodeDto.getName());
        if (checkPath == null) {
            Node node = modelMapper.map(nodeDto, Node.class);
            nodeRepository.save(node);
            return true;
        }
        return false;
    }

    @Override
    public List<NodeDto> listNodes() {
        List<Node> nodesList = nodeRepository.findAll();
        List<NodeDto> nodeDtoList = new ArrayList<>();
        for (Node node : nodesList) {
            nodeDtoList.add(modelMapper.map(node, NodeDto.class));
        }
        return nodeDtoList;
    }

    @Override
    public NodeDto findNodeById(long id) {
        Optional<Node> node = nodeRepository.findById(id);
        return modelMapper.map(node, NodeDto.class);
    }

    @Override
    public boolean editNode(NodeDto nodeDto) {
        Optional<Node> optionalNode = nodeRepository.findById(nodeDto.getId());
        Node existingNode = optionalNode.get();

        if (existingNode.getName().equalsIgnoreCase(nodeDto.getName())) {
            Node node = modelMapper.map(nodeDto, Node.class);
            nodeRepository.save(node);
            return true;
        } else {
            Node nodeName = nodeRepository.findByName(nodeDto.getName());
            if (nodeName == null) {
                Node node = modelMapper.map(nodeDto, Node.class);
                nodeRepository.save(node);
                return true;
            } else {
                return false;
            }
        }
    }

    @Override
    public void deleteNodeById(long id) {
        nodeRepository.deleteById(id);
    }
}
