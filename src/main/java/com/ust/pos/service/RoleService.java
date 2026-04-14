package com.ust.pos.service;

import java.util.List;

import com.ust.pos.dto.RoleDto;
import org.springframework.stereotype.Component;

@Component
public interface RoleService {
    RoleDto addRole(RoleDto roleDto);

    void deleteRole(long id);

    List<RoleDto> getAllRoles();

    RoleDto updateRole(RoleDto roleDto);

    RoleDto addRoleJdbc(RoleDto roleDto);

    RoleDto roleDetails(long id);

    List<RoleDto> getAllRolesJdbc();

    void deleteByIdJdbc(long id);

    RoleDto updateByJdbc(RoleDto roleDto);
}
