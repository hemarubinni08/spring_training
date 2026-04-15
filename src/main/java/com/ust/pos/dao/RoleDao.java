package com.ust.pos.dao;

import com.ust.pos.dto.RoleDto;
import com.ust.pos.model.Role;

import java.util.List;

public interface RoleDao {
    boolean createRole(RoleDto roleDto);

    boolean updateRole(RoleDto roleDto);

    void deleteRole(long id);

    List<Role> getAllRoles();

    Role getRoleById(long id);

    boolean existsByName(String name);
}
