package com.ust.pos.model;

import com.ust.pos.dto.RoleDto;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface NodeRepository extends JpaRepository<Node , Long> {
    Node findByName(String name);
    Node findByPath(String path);
}
