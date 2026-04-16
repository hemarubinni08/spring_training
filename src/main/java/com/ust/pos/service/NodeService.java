package com.ust.pos.service;

import com.ust.pos.dto.NodeDto;

import java.util.List;

public interface NodeService {
    boolean addNode(NodeDto nodeDto);

    List<NodeDto> listNodes();

    NodeDto findNodeById(long id);

    boolean editNode(NodeDto nodeDto);

    void deleteNodeById(long id);
}
