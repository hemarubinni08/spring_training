package com.ust.pos.service.impl;

import com.ust.pos.dao.RoleDao;
import com.ust.pos.dto.RoleDto;
import com.ust.pos.model.Role;
import com.ust.pos.model.RoleRepository;
import com.ust.pos.service.RoleService;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
public class RoleServiceImpl implements RoleService {

    @Autowired
    private RoleRepository roleRepository;

    @Autowired
    private RoleDao roleDao;

    @Autowired
    private ModelMapper modelMapper;

    public List<RoleDto> getAllRoles() {
        List<Role> roles = roleRepository.findAll();
        List<RoleDto> result = new ArrayList<>();
        for (Role role : roles) {
            result.add(modelMapper.map(role, RoleDto.class));
        }
        return result;
    }

    public List<RoleDto> getAllRolesJdbc() {
        List<Role> roles = roleDao.printAllRoles();
        List<RoleDto> result = new ArrayList<>();
        for (Role role : roles) {
            result.add(modelMapper.map(role, RoleDto.class));
        }
        return result;
    }

    public boolean addRole(RoleDto roleDto) {
        if (roleRepository.existsByName(roleDto.getName())) {
            return false;
        }
        Role role = modelMapper.map(roleDto, Role.class);
        roleRepository.save(role);
        return true;
    }

    public boolean addRoleJdbc(RoleDto roleDto) {
        if (roleDao.findByName(roleDto.getName()) != null) {
            return false;
        }
        roleDao.addRoleJdbc(roleDto);
        return true;
    }

    public void deleteById(Long id) {
        roleRepository.deleteById(id);
    }

    public void deleteByIdJdbc(Long id) {
        roleDao.deleteRoleByIdJdbc(id);
    }

    public boolean updateRole(RoleDto roleDto) {
        Optional<Role> roleOpt = roleRepository.findById(roleDto.getId());

        if (roleOpt.isEmpty()) {
            return false;
        }

        Role existingRole = roleOpt.get();

        if (!existingRole.getName().equalsIgnoreCase(roleDto.getName())) {
            if (roleRepository.existsByName(roleDto.getName())) {
                return false;
            }
        }

        modelMapper.map(roleDto, existingRole);
        roleRepository.save(existingRole);
        return true;
    }

    public boolean updateRoleJdbc(RoleDto roleDto) {
        Role existingRole = roleDao.getRoleProfileJdbc(roleDto.getId());

        if (existingRole == null) {
            return false;
        }

        if (!existingRole.getName().equalsIgnoreCase(roleDto.getName())) {
            if (roleDao.findByName(roleDto.getName()) != null) {
                return false;
            }
        }

        roleDao.updateRoleByJdbc(roleDto);
        return true;
    }

    public RoleDto getProfile(Long id) {
        Optional<Role> role = roleRepository.findById(id);
        return role.map(value -> modelMapper.map(value, RoleDto.class)).orElse(null);
    }

    @Override
    public RoleDto getProfileJdbc(Long id) {
        Role role = roleDao.getRoleProfileJdbc(id);
        return role == null ? null : modelMapper.map(role, RoleDto.class);
    }
}