package com.ust.pos.service;

import com.ust.pos.dto.NodeDto;

import java.util.List;

public interface NodeService {
    NodeDto add(NodeDto nodeDto);
    List<NodeDto> display();
    void delete(long id);
    NodeDto update(NodeDto nodeDto);
    NodeDto findId(long id);
}
