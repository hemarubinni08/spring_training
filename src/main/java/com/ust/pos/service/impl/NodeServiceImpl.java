package com.ust.pos.service.impl;

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
    private ModelMapper modelMapper;

    @Autowired
    private NodeRepository nodeRepository;

    @Override
    public NodeDto addNode(NodeDto nodeDto) {

        nodeRepository.save(modelMapper.map(nodeDto, Node.class));
        return nodeDto;
    }

    @Override
    public boolean existsByPath(String path) {

        if (nodeRepository.existsByName(path)) {

            return true;
        }

        return false;
    }

    @Override
    public List<NodeDto> listAllNodes() {

        List<Node> nodes = nodeRepository.findAll();

        return nodes.stream().map(node -> modelMapper.map(node, NodeDto.class)).toList();
    }

    @Override
    public NodeDto updateNode(NodeDto nodeDto) {

        Optional<Node> node = nodeRepository.findById(nodeDto.getId());
        String name = node.get().getName();

        if (name.equals(nodeDto.getPath())) {

            nodeRepository.save(modelMapper.map(nodeDto, Node.class));

            return nodeDto;
        } else {

            if (nodeRepository.existsByName(nodeDto.getPath())) {

                return null;
            }

            nodeRepository.save(modelMapper.map(nodeDto, Node.class));

            return nodeDto;
        }
    }

    @Override
    public NodeDto getNodeById(Long id) {

        return modelMapper.map(nodeRepository.findById(id), NodeDto.class);
    }

    @Override
    public void deleteNode(Long id) {

        nodeRepository.deleteById(id);
    }

    @Override
    public boolean existsByIdService(Long id) {

        if (nodeRepository.existsById(id)) {
            return true;
        }

        return false;
    }
}
