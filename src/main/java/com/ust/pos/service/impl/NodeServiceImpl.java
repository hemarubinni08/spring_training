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
    public boolean addNode(NodeDto nodeDto) {
        Node existingNode = nodeRepository.findByName(nodeDto.getName());

        if (existingNode == null) {
            Node node = modelMapper.map(nodeDto, Node.class);
            nodeRepository.save(node);
            return true;
        }
        return false;
    }

    @Override
    public List<NodeDto> findAllNode() {
        List<Node> nodeList = nodeRepository.findAll();
        List<NodeDto> nodeDtoList = nodeList.stream().map(node -> modelMapper.map(node, NodeDto.class)).toList();
        return nodeDtoList;
    }

    @Override
    public boolean updateNode(NodeDto nodeDto) {
        Node node = nodeRepository.findById(nodeDto.getId()).orElseThrow();
        Node anotherNodeWithSameName = nodeRepository.findByName(nodeDto.getName());

        if (anotherNodeWithSameName == null) {
            node.setRoles(null);
            modelMapper.map(nodeDto, node);
            nodeRepository.save(node);
            return true;
        } else {
            if (anotherNodeWithSameName.getId() == node.getId()) {
                node.setRoles(null);
                modelMapper.map(nodeDto, node);
                nodeRepository.save(node);
                return true;
            }
        }
        return false;
    }

    @Override
    public NodeDto getNodeById(Long id) {
        Node node = nodeRepository.findById(id).orElseThrow();
        return modelMapper.map(node, NodeDto.class);
    }

    @Override
    public void deleteNodeByIdJpa(Long id) {
        nodeRepository.deleteById(id);
    }
}