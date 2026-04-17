package com.ust.pos.service;

import com.ust.pos.dto.RoleDto;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface RoleService {
    boolean addRoleJpa(RoleDto roleDto);

    List<RoleDto> findAllRolesJpa();

    boolean addRoleJdbc(RoleDto roleDto);

    List<RoleDto> findAllRolesJdbc();

    void deleteByIdJpa(Long id);

    void deleteByIdJdbc(Long id);

    boolean updateRoleJpa(RoleDto roleDto);

    RoleDto getByIdJpa(Long id);

    boolean updateRoleJdbc(RoleDto roleDto);

    RoleDto getByIdJdbc(Long id);
}