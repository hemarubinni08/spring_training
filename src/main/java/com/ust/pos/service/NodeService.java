package com.ust.pos.service;

import com.ust.pos.dto.NodeDto;
import com.ust.pos.dto.RoleDto;

import java.util.List;

public interface NodeService {
    NodeDto addNode(NodeDto nodeDto);

    NodeDto updateNode(NodeDto nodeDto);

    List<NodeDto> findAllNode();

    NodeDto getNode(Long id);

    void deleteNode(Long id);
}
