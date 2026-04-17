package com.ust.pos.service.impl;

import com.ust.pos.dao.RoleDao;
import com.ust.pos.dto.RoleDto;
import com.ust.pos.model.Role;
import com.ust.pos.model.RoleRepository;
import com.ust.pos.service.RoleService;
import jakarta.transaction.Transactional;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Transactional
public class RoleServiceImpl implements RoleService {
    @Autowired
    private RoleRepository roleRepository;
    @Autowired
    private ModelMapper modelMapper;
    @Autowired
    PasswordEncoder passwordEncoder;
    @Autowired
    RoleDao roleDao;

    @Override
    public boolean addRoleJpa(RoleDto roleDto) {
        boolean success = false;
        if (!roleRepository.existsByName(roleDto.getName())) {
            Role role = modelMapper.map(roleDto, Role.class);
            Role savedRole = roleRepository.save(role);
            success = true;
        }
        return success;
    }

    @Override
    public List<RoleDto> findAllRolesJpa() {
        List<Role> roleList = roleRepository.findAll();
        List<RoleDto> roleDtoList = roleList.stream().map(role -> modelMapper.map(role, RoleDto.class)).toList();
        return roleDtoList;
    }

    @Override
    public boolean addRoleJdbc(RoleDto roleDto) {
        Role role = modelMapper.map(roleDto, Role.class);
        boolean result = false;
        if (roleDao.existsByName(roleDto.getName())) {
            result = roleDao.saveRoleJdbc(role);
        }
        return result;
    }

    @Override
    public List<RoleDto> findAllRolesJdbc() {
        List<Role> roleList = roleDao.findAllRolesJdbc();
        List<RoleDto> roleDtoList = roleList.stream().map(role -> modelMapper.map(role, RoleDto.class)).toList();
        return roleDtoList;
    }

    @Override
    public void deleteByIdJpa(Long id) {
        roleRepository.deleteById(id);
    }

    @Override
    public void deleteByIdJdbc(Long id) {
        roleDao.deleteById(id);
    }

    @Override
    public boolean updateRoleJpa(RoleDto roleDto) {
        boolean success = false;
        if (!roleRepository.existsByName(roleDto.getName())) {
            Role role = modelMapper.map(roleDto, Role.class);
            Role savedRole = roleRepository.save(role);
            success = true;
        }
        return success;
    }

    @Override
    public RoleDto getByIdJpa(Long id) {
        Role role = roleRepository.getById(id);
        return modelMapper.map(role, RoleDto.class);
    }

    @Override
    public boolean updateRoleJdbc(RoleDto roleDto) {
        Role role = modelMapper.map(roleDto, Role.class);
        return roleDao.updateRoleJdbc(role);
    }

    @Override
    public RoleDto getByIdJdbc(Long id) {
        Role role = roleDao.getById(id);
        return modelMapper.map(role, RoleDto.class);
    }
}