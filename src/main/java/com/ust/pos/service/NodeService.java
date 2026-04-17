package com.ust.pos.service;

import com.ust.pos.dto.NodeDto;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface NodeService {
    List<NodeDto> fetchNode();

    void deleteById(Long id);

    NodeDto findById(Long id);

    boolean updateByNode(NodeDto nodeDto);

    NodeDto addNodeData(NodeDto nodeDto);
}
