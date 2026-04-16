package com.ust.pos.service;

import com.ust.pos.dto.NodeDto;

import java.util.List;

public interface NodeService {
    String addNode(NodeDto nodeDto);

    List<NodeDto> getNodes();

    void deleteDetailsNode(Long id);

    NodeDto updateValueNode(NodeDto nodeDto);

    NodeDto findAllNodes(Long id);
}