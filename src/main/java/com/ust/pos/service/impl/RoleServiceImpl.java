package com.ust.pos.service.impl;

import com.ust.pos.dao.RoleDao;
import com.ust.pos.dto.RoleDto;
import com.ust.pos.model.Role;
import com.ust.pos.model.RoleRepository;
import jakarta.transaction.Transactional;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
@Transactional
public class RoleServiceImpl implements RoleService {
    @Autowired
    ModelMapper modelMapper;
    @Autowired
    RoleRepository roleRepository;
    @Autowired
    RoleDao roleDao;

    @Override
    public RoleDto addRole(RoleDto roleDto) {
        Role role = modelMapper.map(roleDto, Role.class);
        roleRepository.save(role);
        return roleDto;
    }

    @Override
    public List<RoleDto> allUsers() {
        List<Role> roles = roleRepository.findAll();
        return roles.stream().map(role -> modelMapper.map(role, RoleDto.class)).toList();
    }

    @Override
    public void deletebyId(long id) {
        roleRepository.deleteById(id);
    }

    @Override
    public Boolean UpdateData(RoleDto roleDto) {
        Optional<Role> roleOptional = roleRepository.findById(roleDto.getId());
        if (roleOptional.isPresent()) {
            Role role = roleRepository.findByNameAndIdNot(roleDto.getName(), roleDto.getId());
            if (role != null) {
                return false;

            }
            role = roleOptional.get();
            modelMapper.map(roleDto, role);
            roleRepository.save(role);
            return true;
        }
        return true;
    }

    @Override
    public RoleDto findById(long id) {
        Optional<Role> roleOptional = roleRepository.findById(id);
        RoleDto roleDto = new RoleDto();
        if (roleOptional.isPresent()) {
            return modelMapper.map(roleOptional.get(), RoleDto.class);
        }
        return roleDto;
    }

    @Override
    public RoleDto addRoleJdbc(RoleDto roleDto) {
        if ((roleDao.findByName(roleDto.getName())) == null) {
            roleDao.saveData(roleDto);
            return roleDto;
        }
        return null;
    }

    @Override
    public List<RoleDto> findAllRoles() {
        List<Role> roles = roleDao.findAllroles();
        return roles.stream().map(role -> modelMapper.map(role, RoleDto.class)).toList();
    }

    @Override
    public void deleteByIdJdbc(long id) {
        roleDao.deleteById(id);
    }
}