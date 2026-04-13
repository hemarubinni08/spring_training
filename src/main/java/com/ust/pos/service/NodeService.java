package com.ust.pos.service;

import com.ust.pos.dto.NodeDto;
import java.util.List;

public interface NodeService {

    // ✅ Add node with uniqueness validation
    NodeDto addNode(NodeDto nodeDto);

    // ✅ Delete node by ID
    void deleteNode(long id);

    // ✅ Update node with unique name & path validation
    NodeDto updateNode(NodeDto nodeDto);

    // ✅ Fetch all nodes
    List<NodeDto> getAllNodes();

    // ✅ Fetch single node by ID
    NodeDto getNode(long id);
}