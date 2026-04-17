package com.ust.pos.model;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface RoleRepository extends JpaRepository<Role, Long> {

    void deleteById(long id);

    boolean existsByName(String roleName);

    boolean existsByNameAndIdNot(String name, long id);
}