package com.ust.pos.service;

import com.ust.pos.dto.RoleDto;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface RoleService {

    boolean createRole(RoleDto roleDto);

    boolean updateRole(RoleDto roleDto);

    void deleteRole(Long id);

    List<RoleDto> getAllRoles();

    boolean createRoleJdbc(RoleDto roleDto);

    boolean updateRoleJdbc(RoleDto roleDto);

    void deleteRoleJdbc(Long id);

    List<RoleDto> getAllRolesJdbc();

}