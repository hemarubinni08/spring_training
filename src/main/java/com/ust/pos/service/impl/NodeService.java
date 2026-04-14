package com.ust.pos.service.impl;

import com.ust.pos.dto.NodeDto;

import java.util.List;

public interface NodeService {
    NodeDto addNode(NodeDto nodeDto);

    List<NodeDto> findAllNodes();

    void deleteById(long id);

    boolean updateData(NodeDto nodeDto);


    NodeDto findById(long id);
}
