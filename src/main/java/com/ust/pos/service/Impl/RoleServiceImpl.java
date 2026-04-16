package com.ust.pos.service.Impl;

import com.ust.pos.dao.RoleDao;
import com.ust.pos.dto.RoleDto;
import com.ust.pos.model.Role;
import com.ust.pos.model.RoleRepository;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class RoleServiceImpl implements RoleService {
    @Autowired
    private final RoleRepository roleRepository;

    @Autowired
    private final ModelMapper modelMapper;

    @Autowired
    RoleDao roleDao;

    public RoleServiceImpl(RoleRepository roleRepository, ModelMapper modelMapper) {
        this.roleRepository = roleRepository;
        this.modelMapper = modelMapper;
    }

    @Override
    public RoleDto addRole(RoleDto roleDto) {

        if (roleRepository.existsByName(roleDto.getName())) {

            roleDto.setMessage("Role Already Exists!");
            return roleDto;
        }
        Role role = modelMapper.map(roleDto, Role.class);
        Role savedRole = roleRepository.save(role);
        return modelMapper.map(savedRole, RoleDto.class);
    }

    @Override
    public RoleDto addRoleJdbc(RoleDto roleDto) {
        return roleDao.addRoleJdbc(roleDto);
    }

    @Override
    public List<RoleDto> findAllRoles() {
        List<Role> user = roleRepository.findAll();
        List<RoleDto> totalUser = new ArrayList<>();
        for (Role detail : user) {
            totalUser.add(modelMapper.map(detail, RoleDto.class));
        }
        return totalUser;
    }

    @Override
    public void deleteRole(Long id) {
        roleRepository.deleteById(id);
    }

    @Override
    public RoleDto findById(Long id) {
        Role role = roleRepository.findById(id).orElseThrow();
        return modelMapper.map(role, RoleDto.class);
    }

    @Override
    public void editRole(RoleDto roleDto) {
        Role role = roleRepository.findById(roleDto.getId()).orElseThrow();
        if (!role.getName().equalsIgnoreCase(roleDto.getName())) {
            if (roleRepository.existsByName(roleDto.getName())) {
                roleDto.setMessage("Role Already Exists!");
                return;
            } else {
                role.setName(roleDto.getName());
                roleRepository.save(role);
            }
        }
    }
}

