package com.ust.pos.dao;

import com.ust.pos.dto.RoleDto;
import com.ust.pos.model.Role;

import java.util.List;

public interface RoleDao {

    List<Role> getUsersJdbc();

    void addRole(RoleDto roleDto);

    void updateValue(RoleDto roleDto);

    void deleteRole(Long id);

    Role findRoleById(Long id);
}