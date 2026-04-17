package com.ust.pos.service.impl;

import com.ust.pos.dto.NodeDto;
import com.ust.pos.model.Node;
import com.ust.pos.model.NodeRepository;
import com.ust.pos.service.NodeService;
import jakarta.transaction.Transactional;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
public class NodeServiceImpl implements NodeService {

    @Autowired
    ModelMapper modelMapper;
    @Autowired
    private NodeRepository nodeRepository;

    @Override
    public List<NodeDto> retrieveAllNodes() {
        List<Node> nodes = nodeRepository.findAll();
        List<NodeDto> nodesList = new ArrayList<>();

        for (Node node : nodes) {
            nodesList.add(modelMapper.map(node, NodeDto.class));
        }
        return nodesList;
    }

    @Override
    public boolean addNode(NodeDto nodeDto) {
        String nodeName = nodeDto.getName();

        if (nodeRepository.existsByName(nodeName)) {
            return false;
        }
        Node node = modelMapper.map(nodeDto, Node.class);
        nodeRepository.save(node);
        return true;
    }

    @Override
    @Transactional
    public void deleteUsersById(long id) {
        nodeRepository.deleteById(id);
    }

    @Override
    public Optional<Node> getNodeById(long id) {
        Optional<Node> node = nodeRepository.findById(id);
        return node;
    }

    @Override
    public boolean updateNode(NodeDto nodeDto) {
        Optional<Node> existingNodeOpt = nodeRepository.findById(nodeDto.getId());

        if (existingNodeOpt.isEmpty()) {
            return false;
        }
        Node existingNode = existingNodeOpt.get();
        String existingName = existingNode.getName();

        if (existingName.equalsIgnoreCase(nodeDto.getName())) {
            existingNode.setName(nodeDto.getName());
            existingNode.setPath(nodeDto.getPath());
            existingNode.setRoles(nodeDto.getRoles());
            nodeRepository.save(existingNode);
            return true;
        } else {
            if (nodeRepository.existsByName(nodeDto.getName())) {
                return false;
            }
            existingNode.setName(nodeDto.getName());
            existingNode.setPath(nodeDto.getPath());
            nodeRepository.save(existingNode);
            return true;
        }
    }
}
