package com.ust.pos.service;

import com.ust.pos.dto.RoleDto;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface RoleService {

    RoleDto saveRoleData(RoleDto roleDto);

    boolean saveRoleDataJdbc(RoleDto roleDto);

    List<RoleDto> getAllRoles();

    List<RoleDto> getAllRolesJdbc();

    void deleteById(Long id);

    void deleteByIdJdbc(Long id);

    RoleDto findById(Long id);

    RoleDto findByIdJdbc(Long id);

    RoleDto updateRole(RoleDto roleDto);

    int updateRoleJdbc(RoleDto roleDto);
}
