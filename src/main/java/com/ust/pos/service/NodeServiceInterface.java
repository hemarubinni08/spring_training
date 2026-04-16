package com.ust.pos.service;

import com.ust.pos.dto.NodeDto;

import java.util.List;

public interface NodeServiceInterface {

    void addNode(NodeDto nodeDto);

    List<NodeDto> getAllNodes();

    void deleteById(long id);

    NodeDto getNodeById(long id);

    NodeDto updateNode(NodeDto nodeDto);


}
