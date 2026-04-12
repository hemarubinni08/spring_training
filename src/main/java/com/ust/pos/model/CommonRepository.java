package com.ust.pos.model;

import com.ust.pos.dto.RoleDto;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CommonRepository extends JpaRepository<Common,Long> {
    Role findRoleByName(String name);
    User findUserByName(String name);
    Common findByName(String name);
}
