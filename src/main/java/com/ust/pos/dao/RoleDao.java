package com.ust.pos.dao;

import com.ust.pos.dto.RoleDto;
import com.ust.pos.model.Role;

import java.util.List;

public interface RoleDao {
    void addRoleJdbc(RoleDto roleDto);

    void deleteRoleByIdJdbc(Long id);

    void updateRoleByJdbc(RoleDto roleDto);

    List<Role> printAllRoles();

    Role getRoleProfileJdbc(Long id);

    Role findByName(String name);
}
