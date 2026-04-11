package com.ust.pos.dao;

import com.ust.pos.dto.RoleDto;
import java.util.List;

public interface RoleDao {

    boolean createRole(RoleDto roleDto);

    List<RoleDto> getAllRoles();

    RoleDto getRoleById(Long id);

    boolean updateRole(RoleDto roleDto);

    void deleteRole(Long id);

    boolean roleExistsByName(String name);

    boolean roleExistsByNameAndIdNot(String name, Long id);
}