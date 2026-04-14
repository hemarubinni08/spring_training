package com.ust.pos.dao;

import com.ust.pos.dto.RoleDto;
import com.ust.pos.model.Role;

import java.util.List;

public interface RoleDao {
    Boolean saveData(RoleDto roleDto);

    Role findById(long id);

    Role findByName(String name);

    List<Role> findAllroles();

    void deleteById(long id);

    Role updateDataJdbc(Role role);
}
