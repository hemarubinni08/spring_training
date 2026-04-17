package com.ust.pos.service;

import com.ust.pos.dto.NodeDto;
import com.ust.pos.model.Node;
import com.ust.pos.model.NodeRepository;
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
    public List<NodeDto> displayNode() {
        List<Node> nodeList = nodeRepository.findAll();
        List<NodeDto> emptyNodeList = new ArrayList<>();
        for (Node node : nodeList) {
            NodeDto node1 = modelMapper.map(node, NodeDto.class);
            emptyNodeList.add(node1);
        }
        return emptyNodeList;
    }

    @Override
    public NodeDto findByIdNode(long id) {
        Optional<Node> node = nodeRepository.findById(id);
        NodeDto nodeDto = modelMapper.map(node.get(), NodeDto.class);
        return nodeDto;
    }

    @Override
    public boolean editNode(NodeDto nodeDto) {
        Node existingNode = nodeRepository.findByName(nodeDto.getName());
        if (existingNode != null && existingNode.getId() != nodeDto.getId()) {
            return false;
        }
        Node node = modelMapper.map(nodeDto, Node.class);
        nodeRepository.save(node);
        return true;
    }

    @Override
    public void deleteByIdNode(long id) {
        nodeRepository.deleteById(id);
    }

    @Override
    public boolean addNode(NodeDto nodeDto) {
        Node existingNode = nodeRepository.findByName(nodeDto.getName());
        if (existingNode != null && existingNode.getId() != nodeDto.getId()) {
            return false;
        }
        Node node = modelMapper.map(nodeDto, Node.class);
        nodeRepository.save(node);
        return true;
    }

    @Override
    public List<NodeDto> findByRoleNames(String roleName) {
        List<Node> userRoleList = nodeRepository.findByRoleNames(roleName);
        List<NodeDto> resultDto = new ArrayList<>();
        for (Node node : userRoleList) {
            NodeDto nodeDto1 = modelMapper.map(node, NodeDto.class);
            resultDto.add(nodeDto1);
        }
        return resultDto;
    }
}