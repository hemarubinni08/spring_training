package com.ust.pos.service;

import com.ust.pos.dto.RoleDto;

import java.util.List;

public interface RoleService {
    RoleDto addRole(RoleDto roleDto);

    String addRoleJdbc(RoleDto roleDto);

    List<RoleDto> getRoles();

    List<RoleDto> getRolesJdbc();

    RoleDto findDetailsIdRole(Long id);

    RoleDto findDetailsIdRoleJdbc(Long id);

    void deleteDetailsRole(Long id);

    void deleteDetailsRoleJdbc(Long id);

    RoleDto updateValueRoleJdbc(RoleDto roleDto);

    RoleDto updateValueRole(RoleDto roleDto);
}