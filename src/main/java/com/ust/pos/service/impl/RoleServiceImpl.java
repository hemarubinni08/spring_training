package com.ust.pos.service.impl;

import com.ust.pos.dao.RoleDao;
import com.ust.pos.dto.RoleDto;
import com.ust.pos.model.Role;
import com.ust.pos.model.RoleRepository;
import com.ust.pos.service.RoleService;
import jakarta.transaction.Transactional;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service

public class RoleServiceImpl implements RoleService {

    @Autowired
    ModelMapper modelMapper;

    @Autowired
    private RoleRepository roleRepository;

    @Autowired
    private RoleDao roleDao;


    @Override
    public List<RoleDto> retrieveAllRecords() {
        List<Role> roles = roleRepository.findAll();
        List<RoleDto> rolesList = new ArrayList<>();

        for (Role role : roles) {
            rolesList.add(modelMapper.map(role, RoleDto.class));
        }
        return rolesList;
    }

    @Override
    @Transactional
    public void deleteUsersById(long id) {
        roleRepository.deleteById(id);

    }

    @Override
    public boolean addRole(RoleDto roleDto) {
        String roleName = roleDto.getName();

        if (roleRepository.existsByName(roleName)) {
            return false;
        }
        Role role = modelMapper.map(roleDto, Role.class);
        roleRepository.save(role);
        return true;
    }

    @Override
    public boolean updateRole(RoleDto roleDto) {
        Optional<Role> existingRoleOpt = roleRepository.findById(roleDto.getId());

        if (existingRoleOpt.isEmpty()) {
            return false;
        }
        Role existingRole = existingRoleOpt.get();
        String existingName = existingRole.getName();

        if (existingName.equalsIgnoreCase(roleDto.getName())) {
            existingRole.setName(roleDto.getName());
            roleRepository.save(existingRole);
            return true;
        } else {
            if (roleRepository.existsByName(roleDto.getName())) {
                return false;
            }
            existingRole.setName(roleDto.getName());
            roleRepository.save(existingRole);
            return true;
        }
    }

    @Override
    public Optional<Role> getRoleById(long id) {
        Optional<Role> role = roleRepository.findById(id);
        return role;
    }

    @Override
    public boolean addRoleJdbc(RoleDto roleDto) {

        if (roleDao.existsByName(roleDto)) {
            return false;
        }
        roleDao.addRole(roleDto);
        return true;
    }

    @Override
    public void deleteUsersByIdJdbc(long id) {
        roleDao.deleteById(id);
    }

    @Override
    public boolean updateRoleJdbc(RoleDto roleDto) {
        Optional<Role> existingRoleOpt = roleDao.findByIdJdbc(roleDto.getId());

        if (existingRoleOpt.isEmpty()) {
            return false;
        }
        Role existingRole = existingRoleOpt.get();

        if (existingRole.getName().equalsIgnoreCase(roleDto.getName())) {
            roleDao.updateRole(existingRole);
            return true;
        } else {
            if (roleDao.existsByName(roleDto)) {
                return false;
            }
            existingRole.setName(roleDto.getName());
            roleDao.updateRole(existingRole);
            return true;
        }
    }

    @Override
    public Optional<Role> findByIdJdbc(long id) {
        Optional<Role> role = roleDao.findByIdJdbc(id);
        return role;
    }
}
