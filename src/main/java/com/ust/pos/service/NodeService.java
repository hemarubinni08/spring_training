package com.ust.pos.service;

import com.ust.pos.dto.NodeDto;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface NodeService {
    NodeDto addNode(NodeDto nodeDto);

    List<NodeDto> listOfNodes();

    NodeDto getNodeById(Long id);

    NodeDto updateNode(NodeDto nodeDto);

    void deleteNode(Long id);

}
