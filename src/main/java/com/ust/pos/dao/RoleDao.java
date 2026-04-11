package com.ust.pos.dao;

import com.ust.pos.dto.RoleDto;
import com.ust.pos.model.Role;

import java.util.List;

public interface RoleDao {
    boolean addrole(RoleDto roleDto);
    Role findById(long id);
    List<Role> displayrole();
}
