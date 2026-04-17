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
import java.util.Objects;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
public class RoleServiceImpl implements RoleService {
    @Autowired
    ModelMapper modelMapper;
    @Autowired
    RoleDao roleDao;
    @Autowired
    private RoleRepository roleRepository;

    @Override
    public RoleDto addRoleData(RoleDto roleDto) {
        Role existingRole = roleRepository.findByName(roleDto.getName());
        if (existingRole != null) {
            return null;
        }
        Role role = modelMapper.map(roleDto, Role.class);
        Role savedRole = roleRepository.save(role);
        return modelMapper.map(savedRole, RoleDto.class);
    }

    @Override
    public List<RoleDto> fetchRole() {
        List<Role> roles = roleRepository.findAll();
        return roles.stream().map(role -> modelMapper.map(role, RoleDto.class)).collect(Collectors.toList());
    }

    @Override
    public void deleteById(Long id) {
        roleRepository.deleteById(id);
    }

    @Override
    public RoleDto findById(Long id) {
        Optional<Role> roleOpt = roleRepository.findById(id);
        if (roleOpt.isEmpty()) {
            return null;
        }
        return modelMapper.map(roleOpt.get(), RoleDto.class);
    }

    @Override
    public boolean updateByRole(RoleDto roleDto) {
        Optional<Role> roleOptional = roleRepository.findById(roleDto.getId());
        if (roleOptional.isEmpty()) {
            return false;
        }
        Role role = roleOptional.get();
        Role existingRole = roleRepository.findByName(roleDto.getName());
        if (existingRole != null &&
                !Objects.equals(existingRole.getId(), roleDto.getId())) {
            return false;
        }
        modelMapper.map(roleDto, role);
        roleRepository.save(role);
        return true;
    }

    @Override
    public boolean updateByRoleJdbc(RoleDto roleDto) {
        Role role = roleDao.findById(roleDto.getId());
        Role roleWithSameName = roleDao.findByName(roleDto.getName());
        if (roleWithSameName == null) {
            roleDao.updateByRole(roleDto);
            return true;
        } else {
            if (roleWithSameName.getId() == role.getId()) {
                roleDao.updateByRole(roleDto);
                return true;
            }
        }
        return false;
    }
}

