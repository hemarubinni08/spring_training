package com.ust.pos.service;

import com.ust.pos.dto.RoleDto;
import com.ust.pos.model.Role;
import com.ust.pos.model.RoleRepository;
import com.ust.pos.model.User;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public interface RoleService {
    List<RoleDto> getAllRoles();
    List<RoleDto> getAllRolesJdbc();
    boolean addRole(RoleDto roleDto);
    boolean addRoleJdbc(RoleDto roleDto);
    void deleteById(Long id);
    void deleteByIdJdbc(Long id);
    boolean updateRole(RoleDto roleDto);
    boolean updateRoleJdbc(RoleDto roleDto);
    RoleDto getProfile(Long id);
    RoleDto getProfileJdbc(Long id);
}
