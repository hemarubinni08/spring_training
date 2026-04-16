package com.ust.pos.service.impl;

import com.ust.pos.dao.RoleDao;
import com.ust.pos.dto.RoleDto;
import com.ust.pos.model.*;
import com.ust.pos.model.Role;
import com.ust.pos.model.RoleRepository;
import com.ust.pos.service.RoleService;
import jakarta.transaction.Transactional;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
public class RoleServiceImpl implements RoleService {
    @Autowired
    private RoleRepository roleRepository;
    @Autowired
    PasswordEncoder passwordEncoder;
    @Autowired
    private ModelMapper modelMapper;
    @Autowired
    RoleDao roleDao;

    @Override
    public RoleDto addRole(RoleDto roleDto) {
        if (roleRepository.existsByName(roleDto.getName())) {
            roleDto.setSuccess(false);
            roleDto.setMessage("Already exists");
            return null;
        }
        Role role = modelMapper.map(roleDto, Role.class);
        roleRepository.save(role);
        roleDto.setSuccess(true);
        roleDto.setMessage("success");
        return roleDto;
    }

    @Override
    public String addRoleJdbc(RoleDto roleDto) {
        if (roleRepository.existsByName(roleDto.getName())) {
            return "Role Already exists";
        }
        roleDao.addRole(roleDto);
        return "Successfully created";
    }

    @Override
    public List<RoleDto> getRoles() {
        List<Role> roles = roleRepository.findAll();
        List<RoleDto> roleDto = new ArrayList<>();
        for (Role role : roles) {
            roleDto.add(modelMapper.map(role, RoleDto.class));
        }
        return roleDto;
    }

    @Override
    public List<RoleDto> getRolesJdbc() {
        List<Role> roles = roleDao.getUsersJdbc();
        List<RoleDto> rolesDto = new ArrayList<>();
        for (Role role : roles) {
            rolesDto.add(modelMapper.map(role, RoleDto.class));
        }
        return rolesDto;
    }

    @Override
    public RoleDto findDetailsIdRoleJdbc(Long id) {
        Role role = roleDao.findRoleById(id);
        return modelMapper.map(role, RoleDto.class);
    }

    @Override
    @Transactional
    public void deleteDetailsRole(Long id) {
        roleRepository.deleteById(id);

    }

    @Override
    public void deleteDetailsRoleJdbc(Long id) {
        roleDao.deleteRole(id);
    }

    @Override
    public RoleDto updateValueRoleJdbc(RoleDto roleDto) {
        Optional<Role> role1 = roleRepository.findById(roleDto.getId());
        if (role1.isPresent()) {
            Role role = role1.get();
            if (!role.getName().equalsIgnoreCase(roleDto.getName())) {
                if (roleRepository.existsByName(roleDto.getName())) {
                    roleDto.setMessage("Role Already exists");
                    roleDto.setSuccess(false);
                    return roleDto;
                }
            }
        }
        roleDao.updateValue(roleDto);
        roleDto.setSuccess(true);
        roleDto.setMessage("modified");
        return roleDto;
    }

    @Override
    public RoleDto updateValueRole(RoleDto roleDto) {
        Optional<Role> role1 = roleRepository.findById(roleDto.getId());
        if (role1.isPresent()) {
            Role role = role1.get();
            if (!role.getName().equalsIgnoreCase(roleDto.getName())) {
                if (roleRepository.existsByName(roleDto.getName())) {
                    roleDto.setMessage("Name already exists");
                    roleDto.setSuccess(false);
                    return null;
                }
            }
        }
        Role role = modelMapper.map(roleDto, Role.class);
        roleRepository.save(role);
        roleDto.setMessage("Modified");
        roleDto.setSuccess(true);
        return roleDto;
    }

    @Override
    public RoleDto findDetailsIdRole(Long id) {
        Optional<Role> role = roleRepository.findById(id);
        return modelMapper.map(role, RoleDto.class);
    }
}