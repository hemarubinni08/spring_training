package com.ust.pos.dao;

import com.ust.pos.dto.RoleDto;
import com.ust.pos.model.Role;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public interface RoleDao {
    void register(RoleDto roleDto);

    List<Role> findAllUsersJdbc();

    Role findById(Long id);

    void edit(RoleDto roleDto);

    void deleteByIdJdbc(Long id);

    Role findByName(String name);
}