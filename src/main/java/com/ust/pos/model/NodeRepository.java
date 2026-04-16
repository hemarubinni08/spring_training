package com.ust.pos.model;

import org.springframework.data.jpa.repository.JpaRepository;

public interface NodeRepository extends JpaRepository<Node, Long> {
    boolean existsByName(String name);
}
