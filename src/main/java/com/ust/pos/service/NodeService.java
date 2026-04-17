package com.ust.pos.service;

import com.ust.pos.dto.NodeDto;
import com.ust.pos.model.Node;

import java.util.List;
import java.util.Optional;

public interface NodeService {

    List<NodeDto> retrieveAllNodes();

    boolean addNode(NodeDto nodeDto);

    void deleteUsersById(long id);

    Optional<Node> getNodeById(long id);

    boolean updateNode(NodeDto nodeDto);
}
