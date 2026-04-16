package com.ust.pos.model;

import org.springframework.data.jpa.repository.JpaRepository;

public interface NodeRepository extends JpaRepository<Node, Long> {

    Node findById(long id);

    Boolean existsByNameIgnoreCase(String name);
}
