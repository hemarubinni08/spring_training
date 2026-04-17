package com.ust.pos.dao;

import com.ust.pos.dto.RoleDto;
import com.ust.pos.model.Role;

import java.util.List;

public interface RoleDao {

    void saveRoleDataJdbc(RoleDto roleDto);

    boolean findByName(String name);

    List<RoleDto> getAllRolesJdbc();

    void deleteByIdJdbc(Long id);

    Role findByIdJdbc(Long id);

    int updateRoleJdbc(RoleDto roleDto);
}
