package com.ust.pos.service.impl;

import com.ust.pos.dao.RoleDao;
import com.ust.pos.dto.RoleDto;
import com.ust.pos.model.Role;
import com.ust.pos.model.RoleRepository;
import com.ust.pos.service.RoleService;
import jakarta.transaction.Transactional;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
@Transactional
@Component
public class RoleServiceImpl implements RoleService {
    @Autowired
    RoleDao roleDao;
    @Autowired
    ModelMapper modelMapper;
    @Autowired
    RoleRepository roleRepository;

    @Override
    public RoleDto addRole(RoleDto roleDto) {
        if (roleRepository.findByName(roleDto.getName()) == null) {
            roleDto.setSuccess(true);
            Role role = modelMapper.map(roleDto, Role.class);
            roleRepository.save(role);
            return modelMapper.map(role, RoleDto.class);
        } else {
            roleDto.setSuccess(false);
            return null;
        }
    }

    @Override
    public void deleteRole(long id) {
        roleRepository.deleteById(id);
    }

    @Override
    public List<RoleDto> getAllRoles() {
        List<Role> result = roleRepository.findAll();
        return result.stream().map(role -> modelMapper.map(role, RoleDto.class)).toList();
    }

    @Override
    public RoleDto updateRole(RoleDto roleDto) {
        Role existingRole = roleRepository.findById(roleDto.getId()).orElse(null);
        if (existingRole == null) {
            roleDto.setSuccess(false);
            return roleDto;
        }
        Role roleWithSameName = roleRepository.findByName(roleDto.getName());
        if (roleWithSameName != null && roleWithSameName.getId() != roleDto.getId()) {
            roleDto.setSuccess(false);
            return roleDto;
        } else {
            existingRole.setName(roleDto.getName());
            Role savedRole = roleRepository.save(existingRole);
            roleDto.setSuccess(true);
            return modelMapper.map(savedRole, RoleDto.class);
        }
    }

    @Override
    public RoleDto addRoleJdbc(RoleDto roleDto) {
        if (roleDao.findByName(roleDto.getName()) == null) {
            roleDao.addRole(roleDto);
            roleDto.setSuccess(true);
            return roleDto;
        } else {
            roleDto.setSuccess(false);
            return roleDto;
        }
    }

    @Override
    public RoleDto roleDetails(long id) {
        Optional<Role> role = roleRepository.findById(id);
        if (role.isPresent()) {
            return modelMapper.map(role, RoleDto.class);
        } else {
            return null;
        }
    }

    @Override
    public List<RoleDto> getAllRolesJdbc() {
        List<Role> roleDtos = roleDao.findAll();
        return roleDtos.stream().map(role -> modelMapper.map(role, RoleDto.class)).toList();
    }

    @Override
    public void deleteByIdJdbc(long id) {
        roleDao.deleteByIdJdbc(id);
    }

    @Override
    public RoleDto updateByJdbc(RoleDto roleDto) {
        Role existingRole = roleDao.findByName(roleDto.getName());
        if (existingRole != null && existingRole.getId() != roleDto.getId()) {
            roleDto.setSuccess(false);
            return roleDto;
        } else {
            roleDao.updateByJdbc(roleDto);
            roleDto.setSuccess(true);
            return roleDto;
        }
    }

}
