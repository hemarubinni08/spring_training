package com.ust.pos.service;

import com.ust.pos.dto.RoleDto;
import com.ust.pos.model.Role;

import java.util.List;

public interface RoleService {
    RoleDto add(RoleDto roleDto);
    List<RoleDto> display();
    void deleteRole(long id);
    RoleDto update(RoleDto roleDto);
    RoleDto findId(long id);
}
