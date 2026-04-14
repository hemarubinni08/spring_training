package com.ust.pos.service;

import com.ust.pos.dto.NodeDto;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public interface NodeService {
    NodeDto addNode(NodeDto nodeDto);

    List<NodeDto> getAll();

    void deleteNode(long id);

    NodeDto updateNode(NodeDto nodeDto);

    NodeDto getById(long id);

}
