package com.ust.pos.dao;

import com.ust.pos.dto.RoleDto;
import com.ust.pos.model.Role;

import java.util.Optional;

public interface RoleDao {

    boolean addRole(RoleDto roleDto);

    boolean existsByName(RoleDto roleDto);

    void deleteById(long id);

    Optional<Role> findByIdJdbc(long id);

    void updateRole(Role role);
}
