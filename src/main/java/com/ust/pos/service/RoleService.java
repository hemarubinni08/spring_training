package com.ust.pos.service;

import com.ust.pos.dto.RoleDto;

import java.util.List;

public interface RoleService {
    List<RoleDto> getRolesListJpa();

    List<RoleDto> getRolesListJdbc();

    Boolean addRoleJpa(RoleDto roleDto);

    Boolean addRoleJdbc(RoleDto roleDto);

    void deleteRoleJpa(long id);

    void deleteRoleJdbc(long id);

    RoleDto findRoleByIdJpa(long id);

    RoleDto findRoleByIdJdbc(long id);

    boolean editRoleJpa(RoleDto roleDto);

    boolean editRoleJdbc(RoleDto roleDto);
}
