package com.ust.pos.service;

import com.ust.pos.dto.NodeDto;

import java.util.List;


public interface NodeService {

    NodeDto addNode(NodeDto nodeDto);

    boolean existsByPath(String path);

    List<NodeDto> listAllNodes();

    NodeDto updateNode(NodeDto nodeDto);

    NodeDto getNodeById(Long id);

    void deleteNode(Long id);

    boolean existsByIdService(Long id);


}
