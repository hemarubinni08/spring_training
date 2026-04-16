package com.ust.pos.service.Impl;

import com.ust.pos.dto.NodeDto;


import java.util.List;

public interface NodeService {
    NodeDto addNode(NodeDto nodeDto);

    void deleteNode(Long id);

    NodeDto findById(Long id);

    NodeDto editNode(NodeDto NodeDto);

    List<NodeDto> getAllNode();
}
