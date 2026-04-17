package com.ust.pos.service;

import com.ust.pos.dto.RoleDto;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface RoleService {
    RoleDto addRole(RoleDto roleDto);

    List<RoleDto> listAllRoles();

    void deleteRoleById(Long id);

    RoleDto getRoleById(Long id);

    boolean roleFindsForUpdate(String name, Long id);

    void updateRole(RoleDto roleDto);

    void addJdbc(RoleDto roleDto);

    List<RoleDto> getAllRolesJdbc();

    void deleteRoleJdbc(Long id);

    RoleDto getRoleByIdJdbc(Long id);

    void updateRoleJdbc(RoleDto roleDto);

    boolean existsByNameJdbc(String name);
}