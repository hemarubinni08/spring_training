package com.ust.pos.service;

import com.ust.pos.dto.RoleDto;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface RoleService {
    RoleDto addRoleData(RoleDto roleDto);

    List<RoleDto> fetchRole();

    void deleteById(Long id);

    RoleDto findById(Long id);

    boolean updateByRole(RoleDto roleDto);

    boolean updateByRoleJdbc(RoleDto roleDto);

}
