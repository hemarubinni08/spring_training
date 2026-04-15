package com.ust.pos.service;

import com.ust.pos.dto.RoleDto;

import java.util.List;

public interface RoleService {

    //Using Jpa
    RoleDto createRole(RoleDto roleDto);

    RoleDto getRoleById(long id);

    List<RoleDto> getAllRoles();

    List<String> getAllRoleNames();

    RoleDto updateRole(RoleDto roleDto);

    void deleteRole(long id);


    //Using Jdbc
    RoleDto createRoleUsingJdbc(RoleDto roleDto);

    RoleDto getRoleByIdUsingJdbc(long id);

    List<RoleDto> getAllRolesUsingJdbc();

    boolean updateRoleUsingJdbc(RoleDto roleDto);

    void deleteRoleUsingIdJdbc(long id);
}
