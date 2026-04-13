package com.ust.pos.service;

import com.ust.pos.dto.NodeDto;
import com.ust.pos.dto.RoleDto;

import java.util.List;

public interface NodeService {
    List<NodeDto> getAllNodes();
    boolean addNode(NodeDto nodeDto);
    void updateNode(NodeDto nodeDto);
    void deleteNode(Long id);
    NodeDto getNodeProfile(Long id);


}
