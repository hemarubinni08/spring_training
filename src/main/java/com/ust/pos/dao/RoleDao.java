package com.ust.pos.dao;

import com.ust.pos.dto.RoleDto;
import com.ust.pos.model.Role;

public interface RoleDao {
    Role findById(Long id);

    Role findByName(String name);

    boolean updateByRole(RoleDto roleDto);

    void deleteById(Long id);
}
