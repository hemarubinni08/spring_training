package com.ust.pos.service.impl;

import com.ust.pos.dao.RoleDao;
import com.ust.pos.dto.RoleDto;
import com.ust.pos.model.Role;
import com.ust.pos.model.RoleRepository;
import com.ust.pos.service.RoleService;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
public class RoleServiceImpl implements RoleService {
    @Autowired
    RoleRepository roleRepository;
    @Autowired
    ModelMapper modelMapper;
    @Autowired
    RoleDao roleDao;

    @Override
    public RoleDto addRole(RoleDto roleDto) {
        Role existingRole = roleRepository.findByName(roleDto.getName());
        if (existingRole != null) {
            return null;
        }
        Role role = modelMapper.map(roleDto, Role.class);
        Role savedrole = roleRepository.save(role);
        return modelMapper.map(savedrole, RoleDto.class);
    }

    @Override
    public List<RoleDto> listAllRoles() {
        List<Role> roles = roleRepository.findAll();
        return roles.stream()
                .map(role -> modelMapper.map(role, RoleDto.class))
                .collect(Collectors.toList());
    }

    @Override
    public void deleteRoleById(Long id) {
        roleRepository.deleteById(id);
    }

    @Override
    public RoleDto getRoleById(Long id) {
        Optional<Role> role = roleRepository.findById(id);
        return modelMapper.map(role, RoleDto.class);
    }

    @Override
    public boolean roleFindsForUpdate(String name, Long id) {
        return roleRepository.existsByNameAndIdNot(name, id); //update validation
    }

    @Override
    public void updateRole(RoleDto roleDto) {
        Role role = modelMapper.map(roleDto, Role.class);
        roleRepository.save(role);
    }

    @Override
    public void addJdbc(RoleDto roleDto) {
        roleDao.addJdbc(roleDto);
    }

    @Override
    public List<RoleDto> getAllRolesJdbc() {
        return roleDao.findAllJdbc()
                .stream()
                .map(role -> modelMapper.map(role, RoleDto.class))
                .toList();
    }

    @Override
    public void deleteRoleJdbc(Long id) {
        roleDao.deleteByIdJdbc(id);
    }

    @Override
    public RoleDto getRoleByIdJdbc(Long id) {
        Role role = roleDao.findByIdJdbc(id);
        return modelMapper.map(role, RoleDto.class);
    }

    @Override
    public void updateRoleJdbc(RoleDto roleDto) {
        roleDao.updateJdbc(roleDto);
    }

    @Override
    public boolean existsByNameJdbc(String name) {
        return roleDao.existsByNameJdbc(name);
    }
}