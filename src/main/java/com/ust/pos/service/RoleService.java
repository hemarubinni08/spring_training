package com.ust.pos.service;

import com.ust.pos.dto.RoleDto;

import java.util.List;

public interface RoleService {
    boolean addRole(RoleDto roleDto);

    List<RoleDto> findAllRoles();

    boolean updateRole(RoleDto roleDto);

    RoleDto getRoleById(Long id);

    void deleteByIdJpa(Long id);

    boolean addRoleJdbc(RoleDto roleDto);

    List<RoleDto> findAllRolesJdbc();

    void deleteByIdJdbc(Long id);

    boolean updateByIdJdbc(RoleDto roleDto);
}