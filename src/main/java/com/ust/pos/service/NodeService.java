package com.ust.pos.service;

import com.ust.pos.dto.NodeDto;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface NodeService {
    NodeDto addNode(NodeDto nodeDto);

    List<NodeDto> listAllNodes();

    void deleteNodeById(Long id);

    NodeDto getNodeById(Long id);

    boolean nodeFindsForUpdate(String name, Long id);

    void updateNode(NodeDto nodeDto);
}