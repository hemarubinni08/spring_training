package com.ust.pos.dao;

import com.ust.pos.dto.RoleDto;
import com.ust.pos.model.Role;

import java.util.List;

public interface RoleDao {

    void createRole(RoleDto roleDto);

    List<Role> getAllRoles();

    Role getRoleById(long id);

    int updateRole(RoleDto roleDto);

    int deleteRoleById(long id);
}
