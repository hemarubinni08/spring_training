package com.ust.pos.model;

import org.springframework.data.jpa.repository.JpaRepository;

public interface RoleRepository extends JpaRepository<Role, Long> {
    Role getById(long id);

    void deleteById(long id);

    Role findByNameAndIdNot(String name, long id);

}
