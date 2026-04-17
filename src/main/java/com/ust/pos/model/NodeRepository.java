package com.ust.pos.model;

import org.springframework.stereotype.Repository;

@Repository
public interface NodeRepository extends CommonRepo<Node, Long> {
    boolean existsByNameAndIdNot(String name, Long id);
}
