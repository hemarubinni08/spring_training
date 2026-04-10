package com.ust.pos.model;

import org.springframework.data.jpa.repository.JpaRepository;

public interface RoleRepository extends JpaRepository<Role, Long> {
    boolean existsByName(String name);

    boolean existsByNameAndIdNot(String name, Long id);

}