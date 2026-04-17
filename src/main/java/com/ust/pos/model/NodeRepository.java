package com.ust.pos.model;

import org.springframework.data.jpa.repository.JpaRepository;

public interface NodeRepository extends JpaRepository<Node, Long> {
    Node findByName(String name);

    boolean existsByNameAndIdNot(String name, Long id);
}
