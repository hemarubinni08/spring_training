package com.ust.pos.model;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public interface NodeRepository extends JpaRepository<Node, Long> {

    List<Node> findAll();

    boolean existsByName(String name);

    Node findByName(String name);
}
