package com.ust.pos.service.impl;

import com.ust.pos.dto.RoleDto;

import java.util.List;

public interface RoleService {
    RoleDto addRole(RoleDto roleDto);

    List<RoleDto> allUsers();

    void deletebyId(long id);

    Boolean UpdateData(RoleDto roleDto);

    RoleDto findById(long id);

    RoleDto addRoleJdbc(RoleDto roleDto);

    List<RoleDto> findAllRoles();

    void deleteByIdJdbc(long id);
}
