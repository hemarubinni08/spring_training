package com.ust.pos.dao;

import com.ust.pos.dto.RoleDto;
import com.ust.pos.model.Role;
import org.springframework.stereotype.Component;

import java.util.List;

public interface RoleDao {
    boolean addRole(RoleDto roleDto);

    Role findRoleByName(String name);

    Role updateRole(Role role);
    Role findById(Long id);

    List<Role> findallRole();

    void deleteRoleById(Long id);


}
