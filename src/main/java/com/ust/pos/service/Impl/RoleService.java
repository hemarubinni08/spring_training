package com.ust.pos.service.Impl;

import com.ust.pos.dto.RoleDto;

import java.util.List;

public interface RoleService {
    RoleDto addRole(RoleDto roleDto);

    RoleDto addRoleJdbc(RoleDto roleDto);

    List<RoleDto> findAllRoles();

    void deleteRole(Long id);

    RoleDto findById(Long id);

    void editRole(RoleDto roleDto);
}
