package com.ust.pos.dao;

import com.ust.pos.dto.RoleDto;
import com.ust.pos.model.Role;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public interface RoleDao {
    boolean addRole(RoleDto roleDto);
    Role findByName(String name);
    List<Role> findAll();
    void deleteByIdJdbc(long id);
    void updateByJdbc(RoleDto roleDto);
}
