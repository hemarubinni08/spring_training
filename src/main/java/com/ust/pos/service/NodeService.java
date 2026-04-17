package com.ust.pos.service;

import com.ust.pos.dto.NodeDto;

import java.util.List;

public interface NodeService {
    boolean addNode(NodeDto nodeDto);

    List<NodeDto> findAllNode();

    boolean updateNode(NodeDto NodeDto);

    NodeDto getNodeById(Long id);

    void deleteNodeByIdJpa(Long id);
}