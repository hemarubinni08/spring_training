package com.ust.pos.service;

import com.ust.pos.dto.RoleDto;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface RoleService {
    void addRoleJpa(RoleDto roleDto);

    void addRoleJdbc(RoleDto roleDto);

    List<RoleDto> getAllRolesJpa();

    List<RoleDto> getAllRolesJdbc();

    RoleDto getRoleByIdJpa(Long id);

    RoleDto getRoleByIdJdbc(Long id);

    void updateRoleJpa(RoleDto roleDto);

    void updateRoleJdbc(RoleDto roleDto);

    boolean existsByNameJpa(String name);

    boolean existsByNameJdbc(String name);

    void deleteRoleById(Long id);

    void deleteRoleJdbc(Long id);
}
