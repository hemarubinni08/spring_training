package com.ust.pos.service;

import com.ust.pos.dto.RoleDto;
import jakarta.transaction.Transactional;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
@Transactional
public interface RoleService {

    List<RoleDto> getAllUsersRoles();

    List<RoleDto> displayValuesJdbc();

    RoleDto findById(Long id);

    RoleDto findByIdJdbc(Long id);

    boolean edit(RoleDto roleDto);

    boolean editJdbc(RoleDto roleDto);

    void deleteById(Long id);

    void deleteByIdJdbc(Long id);

    boolean addRole(RoleDto roleDto);

    boolean addRoleJdbc(RoleDto roleDto);

}