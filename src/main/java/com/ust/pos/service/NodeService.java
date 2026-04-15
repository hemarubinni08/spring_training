package com.ust.pos.service;

import com.ust.pos.dto.NodeDto;

import java.util.List;

public interface NodeService {

    //Using Jpa
    NodeDto addNode(NodeDto nodeDto);

    List<NodeDto> getAllNodes();

    NodeDto getNodeById(long id);

    NodeDto updateNode(NodeDto nodeDto);

    void deleteNode(long id);
}