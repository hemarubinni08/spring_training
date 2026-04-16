package com.ust.pos.dao;

import com.ust.pos.dto.RoleDto;
import com.ust.pos.model.Role;

import java.util.List;

public interface RoleDao {
    List<Role> findAll();

    Role findRoleByName(String name);

    boolean addRole(RoleDto roleDto);

    void deleteRoleById(long id);

    Role findRoleById(long id);

    void editRole(RoleDto roleDto);
}
