package com.ust.pos.service;

import com.ust.pos.dto.RoleDto;
import java.util.List;

public interface RoleServiceInterface {

    String addRole(RoleDto roleDto);

    void addRoleJdbc(RoleDto roleDto);

    List<RoleDto> getAllRoles();

    List<RoleDto> getAllRolesJdbc();

    void deleteByIdService(long id);

    RoleDto getRoleById(long id);

    RoleDto getRoleByIdJdbc(long id);

    RoleDto updateRole(RoleDto roleDto);

    void updateRoleJdbc(RoleDto roleDto);

    void deleteRoleJdbc(long id);
}
