package com.ust.pos.service.impl;

import com.ust.pos.dao.RoleDao;
import com.ust.pos.dao.UserDao;
import com.ust.pos.dto.RoleDto;
import com.ust.pos.dto.UserDto;
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

@Component
@Service
@Transactional
public class RoleServiceImpl implements RoleService {

    @Autowired
    private RoleRepository roleRepository;

    @Autowired
    RoleDao roleDao;

    @Autowired
    ModelMapper modelMapper;

    @Override
    public RoleDto addRoleJpa(RoleDto roleDto) {
        Role role = roleRepository.findByName(roleDto.getName());

        if (role == null) {
            Role role1 = modelMapper.map(roleDto, Role.class);
            roleRepository.save(role1);
            roleDto.setSuccess(true);
            return roleDto;
        } else {
            roleDto.setSuccess(false);
            return roleDto;
        }
    }

    @Override
    public RoleDto addRoleJdbc(RoleDto roleDto) {
        Role role = roleDao.findRoleByName(roleDto.getName());
        if (role == null) {
            boolean success = roleDao.addRole(roleDto);
            roleDto.setSuccess(success);
            return roleDto;
        }
        return roleDto;

    }

    @Override
    public RoleDto updateRoleJpa(RoleDto roleDto) {
        Role role1 = roleRepository.findById(roleDto.getId()).orElseThrow();
        if (role1 != null) {
            roleDto.setSuccess(false);
            return roleDto;
        } else {
            Role role = modelMapper.map(roleDto, Role.class);
            roleRepository.save(role);
            roleDto.setSuccess(true);
            return roleDto;
        }
    }

    @Override
    public RoleDto updateRoleJdbc(RoleDto roleDto) {
        Role role = modelMapper.map(roleDto, Role.class);
        Role updateRole = roleDao.updateRole(role);
        return modelMapper.map(updateRole, RoleDto.class);
    }

    @Override
    public List<RoleDto> findAllRoles() {
        List<Role> roleList = roleRepository.findAll();
        return roleList.stream().map(role -> modelMapper.map(role, RoleDto.class)).toList();
    }

    @Override
    public List<RoleDto> findAllRolesJdbc() {
        List<Role> roleList = roleDao.findallRole();
        return roleList.stream().map(role -> modelMapper.map(role, RoleDto.class)).toList();
    }

    @Override
    public RoleDto getRolesByIdJpa(Long id) {
        Optional<Role> role = roleRepository.findById(id);
        return modelMapper.map(role, RoleDto.class);
    }

    @Override
    public RoleDto getRolesByIdJdbc(Long id) {
        Role role1 = roleDao.findById(id);
        return modelMapper.map(role1, RoleDto.class);
    }

    @Override
    public void deleteRoleByIdJpa(Long id) {
        Optional<Role> role = roleRepository.findById(id);

        roleRepository.deleteById(id);

    }

    @Override
    public void deleteRoleByIdJdbc(Long id) {
        roleDao.deleteRoleById(id);

    }
}
