package com.ust.pos.service;

import com.ust.pos.dto.NodeDto;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface NodeService {
    NodeDto addNode(NodeDto nodeDto);

    void updateNode(NodeDto nodeDto);

    List<NodeDto> getAllNodes();

    void deleteNode(Long id);

    NodeDto getNodeById(Long id);
}