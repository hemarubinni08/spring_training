package com.ust.pos.service;

import com.ust.pos.dto.RoleDto;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface RoleService {

    RoleDto addRole(RoleDto roleDto);

    RoleDto updateRole(RoleDto roleDto);

    void deleteRole(Long id);

    List<RoleDto> listRoles();

    RoleDto getRoleById(Long id);

    void addRoleJdbc(RoleDto roleDto);

    boolean updateRoleJdbc(RoleDto roleDto);

    RoleDto getRoleByIdJdbc(Long id);

    boolean deleteByIdJdbc(Long id);
}
