package com.ust.pos.service;

import com.ust.pos.dto.NodeDto;
import com.ust.pos.model.Node;

import java.util.List;

public interface NodeService {

    boolean createNode(NodeDto nodeDto);

    boolean updateNode(NodeDto nodeDto);

    void deleteNode(Long id);

    List<NodeDto> getAllNodes();
}
