package com.ust.pos.service;

import com.ust.pos.dto.RoleDto;

import java.util.List;

public interface RoleService {
    RoleDto add(RoleDto roleDto);

    List<RoleDto> display();

    void deleteRole(long id);

    RoleDto update(RoleDto roleDto);

    RoleDto findId(long id);

    RoleDto addRoleJDBC(RoleDto roleDto);

    List<RoleDto> displayjdbc();
}
