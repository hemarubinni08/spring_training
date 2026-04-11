package com.ust.pos.service;

import com.ust.pos.dto.RoleDto;
import com.ust.pos.dto.UserDto;
import com.ust.pos.model.User;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface RoleService {
    RoleDto addRoleJpa(RoleDto roleDto);

    RoleDto addRoleJdbc(RoleDto roleDto);

    RoleDto updateRoleJpa(RoleDto roleDto);

    RoleDto updateRoleJdbc(RoleDto roleDto);

    List<RoleDto> findAllRoles();

    List<RoleDto> findAllRolesJdbc();
    RoleDto getRolesByIdJpa(Long id);
    RoleDto getRolesByIdJdbc(Long id);


    void deleteRoleByIdJpa(Long id);

    void deleteRoleByIdJdbc(Long id);

}
