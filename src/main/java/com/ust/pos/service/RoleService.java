package com.ust.pos.service;

import com.ust.pos.dto.RoleDto;

import java.util.List;

public interface RoleService {
    RoleDto createRoleUsingJpa(RoleDto roleDto);

    RoleDto createRoleUsingJdbc(RoleDto roleDto);

    void deleteRoleUsingIdJpa(long id);

    void deleteRoleUsingIdJdbc(long id);

    boolean updateRoleUsingJdbc(RoleDto roleDto);

    RoleDto updateRoleUsingJpa(RoleDto roleDto);

    List<RoleDto> getAllRolesUsingJdbc();

    List<RoleDto> getAllRolesUsingJpa();

    RoleDto getRoleByIdUsingJpa(long id);

    RoleDto getRoleByIdUsingJdbc(long id);
}
