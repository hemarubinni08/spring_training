package com.ust.pos.dao;

import com.ust.pos.dto.RoleDto;
import com.ust.pos.model.Role;

import java.util.List;

public interface RoleDao {
    void addJdbc(RoleDto roleDto);

    List<Role> findAllJdbc();

    void deleteByIdJdbc(Long id);

    Role findByIdJdbc(Long id);

    void updateJdbc(RoleDto roleDto);

    boolean existsByNameJdbc(String name);
}