package com.ust.pos.service;

import com.ust.pos.dto.RoleDto;
import com.ust.pos.dto.UserDto;

import java.util.List;

public interface RoleService {
    boolean createRole(RoleDto roleDto);
    List<RoleDto> roleList();
    void deleteRole(Long id);
    void deleteRoleJdbc(Long id);
    RoleDto getRoleDetailsByid(Long id);
    boolean updateRole(RoleDto roleDto);
    boolean updateRoleJdbc(RoleDto roleDto);
}
