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

@Service
public class RoleServiceImpl implements RoleService {
    @Autowired
    private RoleRepository roleRepository;
    @Autowired
    private ModelMapper modelMapper;
    @Autowired
    private RoleDao roleDao;

    @Override
    public void addRoleJpa(RoleDto roleDto) {
        Role role = modelMapper.map(roleDto, Role.class);
        roleRepository.save(role);
    }

    @Override
    public void addRoleJdbc(RoleDto roleDto) {
        roleDao.addJdbc(roleDto);
    }

    @Override
    public List<RoleDto> getAllRolesJpa() {
        List<Role> roles = roleRepository.findAll();
        return roles.stream()
                .map(role -> modelMapper.map(role, RoleDto.class))
                .toList();
    }

    @Override
    public List<RoleDto> getAllRolesJdbc() {
        return roleDao.findAllJdbc()
                .stream()
                .map(role -> modelMapper.map(role, RoleDto.class))
                .toList();
    }

    @Override
    public RoleDto getRoleByIdJpa(Long id) {
        Role role = roleRepository.findById(id).orElse(null);
        return role != null ? modelMapper.map(role, RoleDto.class) : null;
    }

    @Override
    public RoleDto getRoleByIdJdbc(Long id) {
        Role role = roleDao.findByIdJdbc(id);
        return modelMapper.map(role, RoleDto.class);
    }

    @Override
    public void updateRoleJpa(RoleDto roleDto) {
        Role role = modelMapper.map(roleDto, Role.class);
        roleRepository.save(role);
    }

    @Override
    public void updateRoleJdbc(RoleDto roleDto) {
        roleDao.updateJdbc(roleDto);
    }

    @Override
    public boolean existsByNameJpa(String name) {
        return roleRepository.existsByName(name);
    }

    @Override
    public boolean existsByNameJdbc(String name) {
        return roleDao.existsByNameJdbc(name);
    }

    @Override
    public void deleteRoleById(Long id) {
        roleRepository.deleteById(id);
    }

    @Override
    public void deleteRoleJdbc(Long id) {
        roleDao.deleteByIdJdbc(id);
    }
}
