package com.ust.pos.service;

import com.ust.pos.dto.RoleDto;
import com.ust.pos.model.Role;

import java.util.List;
import java.util.Optional;

public interface RoleService {

    List<RoleDto> retrieveAllRecords();

    void deleteUsersById(long id);

    boolean addRole(RoleDto roleDto);

    boolean updateRole(RoleDto roleDto);

    Optional<Role> getRoleById(long id);

    boolean addRoleJdbc(RoleDto roleDto);

    void deleteUsersByIdJdbc(long id);

    boolean updateRoleJdbc(RoleDto roleDto);

    Optional<Role> findByIdJdbc(long id);
}
