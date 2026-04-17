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

import java.util.List;

@Service
@Transactional
public class RoleServiceImpl implements RoleService {

    @Autowired
    private RoleRepository roleRepository;
    @Autowired
    private ModelMapper modelMapper;
    @Autowired
    private RoleDao roleDao;

    @Override
    public boolean addRole(RoleDto roleDto) {
        Role existingRole = roleRepository.findByName(roleDto.getName());

        if (existingRole == null) {
            Role role = modelMapper.map(roleDto, Role.class);
            roleRepository.save(role);
            return true;
        }
        return false;
    }

    @Override
    public List<RoleDto> findAllRoles() {
        List<Role> userList = roleRepository.findAll();
        List<RoleDto> roleDtoList = userList.stream().map(role -> modelMapper.map(role, RoleDto.class)).toList();
        return roleDtoList;

    }

    @Override
    public boolean updateRole(RoleDto roleDto) {
        Role role = roleRepository.findById(roleDto.getId()).orElseThrow();
        Role anotherRoleWithSameName = roleRepository.findByName(roleDto.getName());

        if (anotherRoleWithSameName == null) {
            modelMapper.map(roleDto, role);
            roleRepository.save(role);
            return true;
        } else {
            if (anotherRoleWithSameName.getId() == role.getId()) {
                modelMapper.map(roleDto, role);
                roleRepository.save(role);
                return true;
            }
        }
        return false;
    }

    @Override
    public RoleDto getRoleById(Long id) {
        Role role = roleRepository.findById(id).orElseThrow();
        return modelMapper.map(role, RoleDto.class);
    }

    @Override
    public void deleteByIdJpa(Long id) {
        roleRepository.deleteById(id);
    }

    @Override
    public boolean addRoleJdbc(RoleDto roleDto) {
        Role role = modelMapper.map(roleDto, Role.class);
        boolean result = false;

        if (roleDao.existsByName((roleDto.getName()))) {
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
    public void deleteByIdJdbc(Long id) {
        roleDao.deleteById(id);

    }

    @Override
    public boolean updateByIdJdbc(RoleDto roleDto) {
        Role role = roleDao.findById(roleDto.getId());
        Role anotherRoleWithSameName = roleDao.findByName(roleDto.getName());

        if (anotherRoleWithSameName == null) {
            roleDao.updateByIdJdbc(roleDto);
            return true;
        } else {
            if (anotherRoleWithSameName.getId() == role.getId()) {
                roleDao.updateByIdJdbc(roleDto);
                return true;
            }
        }
        return false;
    }
}