package com.ust.pos.dao;

import com.ust.pos.model.Role;

public interface RoleDao {

    void saveRole(Role role);

    boolean existsByName(String name);

    Role updateByid(Role role);

    Role findById(Long id);

    boolean deleteById(Long id);

}
