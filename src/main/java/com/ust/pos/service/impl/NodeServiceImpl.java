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
    public boolean updateNode(NodeDto nodeDto) {

        boolean nameTaken =
                nodeRepository.existsByNameAndIdNot(
                        nodeDto.getName(), nodeDto.getId());

        if (nameTaken) {
            return false;
        }

        boolean pathTaken =
                nodeRepository.existsByPathAndIdNot(
                        nodeDto.getPath(), nodeDto.getId());

        if (pathTaken) {
            return false;
        }

        Optional<Node> nodeOpt = nodeRepository.findById(nodeDto.getId());

        if (nodeOpt.isEmpty()) {
            return false;
        }

        Node node = nodeOpt.get();
        node.setName(nodeDto.getName());
        node.setPath(nodeDto.getPath());

        nodeRepository.save(node);
        return true;
    }

    @Override
    public void deleteNode(Long id) {
        nodeRepository.deleteById(id);
    }
}