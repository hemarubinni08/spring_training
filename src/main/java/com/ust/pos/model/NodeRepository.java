package com.ust.pos.model;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface NodeRepository extends JpaRepository<Node, Long> {

    boolean existsByNameIgnoreCase(String name);

    boolean existsByPathIgnoreCase(String path);

    boolean existsByNameIgnoreCaseAndIdNot(String name, Long id);

    boolean existsByPathIgnoreCaseAndIdNot(String path, Long id);
}