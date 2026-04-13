package com.ust.pos.model;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface NodeRepository extends JpaRepository<Node, Long> {

    // ✅ For ADD validation
    boolean existsByNameIgnoreCase(String name);
    boolean existsByPathIgnoreCase(String path);

    // ✅ For UPDATE validation (exclude current ID)
    boolean existsByNameIgnoreCaseAndIdNot(String name, Long id);
    boolean existsByPathIgnoreCaseAndIdNot(String path, Long id);
}