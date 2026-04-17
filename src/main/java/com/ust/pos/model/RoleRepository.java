package com.ust.pos.model;

import org.springframework.stereotype.Repository;

@Repository
public interface RoleRepository extends CommonRepo<Role, Long> {
    Role findByName(String name);
}
