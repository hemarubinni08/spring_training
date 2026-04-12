package com.ust.pos.service;

import com.ust.pos.dto.NodeDto;

import java.util.List;

public interface NodeService {
    boolean addNode(NodeDto nodeDto);
    List<NodeDto> getAllNodes();
    void deleteNodeById(Long id);
    NodeDto getNodeDetails(Long id);
    boolean updateNode(NodeDto nodeDto);
}
