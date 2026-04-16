package com.ust.pos.service.impl;

import com.ust.pos.dao.RoleDao;
import com.ust.pos.dto.RoleDto;
import com.ust.pos.model.Role;
import com.ust.pos.model.RoleRepository;
import com.ust.pos.service.RoleServiceInterface;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service

public class RoleServiceImpl implements RoleServiceInterface {

    @Autowired
    RoleDao roleDao;

    @Autowired
    private RoleRepository roleRepository;

    @Autowired
    private ModelMapper modelMapper;


    @Override
    public String addRole(RoleDto roleDto) {

        Role role = modelMapper.map(roleDto, Role.class);
        roleRepository.save(role);
        return "SUCCESSFULLY REGISTERED";
    }

    @Override
    public List<RoleDto> getAllRoles() {

        return roleRepository.findAll()
                .stream()
                .map(role -> modelMapper.map(role, RoleDto.class))
                .toList();
    }

    @Override
    public void deleteByIdService(long id) {
        roleRepository.deleteById(id);
    }

    @Override
    public RoleDto getRoleById(long id) {

        Role role = roleRepository.findById(id);
        return modelMapper.map(role, RoleDto.class);
    }

    @Override
    public RoleDto updateRole(RoleDto roleDto) {

        Role existingRole = roleRepository.findById(roleDto.getId());
        modelMapper.map(roleDto, existingRole);
        roleRepository.save(existingRole);
        return modelMapper.map(existingRole, RoleDto.class);
    }

    @Override
    public void addRoleJdbc(RoleDto roleDto) {
        roleDao.createRole(roleDto);
    }

    @Override
    public List<RoleDto> getAllRolesJdbc() {

        return roleDao.getAllRoles()
                .stream()
                .map(role -> modelMapper.map(role, RoleDto.class))
                .toList();
    }

    @Override
    public RoleDto getRoleByIdJdbc(long id) {

        Role role = roleDao.getRoleById(id);
        return modelMapper.map(role, RoleDto.class);
    }

    @Override
    public void updateRoleJdbc(RoleDto roleDto) {
        int rowsUpdated = roleDao.updateRole(roleDto);
    }

    @Override
    public void deleteRoleJdbc(long id) {
        roleDao.deleteRoleById(id);
    }
}
