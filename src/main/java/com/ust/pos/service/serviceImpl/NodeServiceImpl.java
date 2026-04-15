package com.ust.pos.service.serviceImpl;

import com.ust.pos.dto.NodeDto;
import com.ust.pos.model.Node;
import com.ust.pos.model.NodeRepository;
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
    private ModelMapper modelMapper;

    @Override
    public NodeDto addNode(NodeDto nodeDto) {
        if (nodeRepository.existsByNameIgnoreCase(nodeDto.getName())) {
            nodeDto.setMessage("Node name already exists!");
            nodeDto.setColour("red");
            return nodeDto;
        }
        if (nodeRepository.existsByPathIgnoreCase(nodeDto.getPath())) {
            nodeDto.setMessage("Node path already exists!");
            nodeDto.setColour("red");
            return nodeDto;
        }
        Node node = modelMapper.map(nodeDto, Node.class);
        nodeRepository.save(node);
        nodeDto.setMessage("Node added successfully!");
        nodeDto.setColour("green");
        return nodeDto;
    }

    @Override
    public List<NodeDto> getAllNodes() {
        return nodeRepository.findAll()
                .stream()
                .map(node -> modelMapper.map(node, NodeDto.class))
                .toList();
    }

    @Override
    public NodeDto getNodeById(long id) {
        return nodeRepository.findById(id)
                .map(node -> modelMapper.map(node, NodeDto.class))
                .orElse(new NodeDto());
    }

    @Override
    public NodeDto updateNode(NodeDto nodeDto) {
        if (nodeRepository.existsByNameIgnoreCaseAndIdNot(
                nodeDto.getName(), nodeDto.getId())) {
            nodeDto.setMessage("Node name already exists!");
            nodeDto.setColour("red");
            return nodeDto;
        }
        if (nodeRepository.existsByPathIgnoreCaseAndIdNot(
                nodeDto.getPath(), nodeDto.getId())) {
            nodeDto.setMessage("Node path already exists!");
            nodeDto.setColour("red");
            return nodeDto;
        }
        Optional<Node> nodeOpt = nodeRepository.findById(nodeDto.getId());
        if (nodeOpt.isEmpty()) {
            nodeDto.setMessage("Node not found!");
            nodeDto.setColour("red");
            return nodeDto;
        }
        Node node = nodeOpt.get();
        node.setName(nodeDto.getName());
        node.setPath(nodeDto.getPath());
        node.setRoles(nodeDto.getRoles());
        nodeRepository.save(node);
        nodeDto.setMessage("Node updated successfully!");
        nodeDto.setColour("green");
        return nodeDto;
    }

    @Override
    public void deleteNode(long id) {
        nodeRepository.deleteById(id);
    }
}