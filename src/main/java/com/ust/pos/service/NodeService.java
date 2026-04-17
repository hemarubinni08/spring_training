package com.ust.pos.service;

import com.ust.pos.dto.NodeDto;
import jakarta.transaction.Transactional;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
@Transactional
public interface NodeService {
    List<NodeDto> displayNode();

    NodeDto findByIdNode(long id);

    boolean editNode(NodeDto nodeDto);

    void deleteByIdNode(long id);

    boolean addNode(NodeDto nodeDto);

    List<NodeDto> findByRoleNames(String roleName);
}