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
    private RoleRepository roleRepository;

    @Autowired
    private RoleDao roleDao;

    @Autowired
    private ModelMapper modelMapper;

    @Override
    public List<RoleDto> getRolesListJpa() {
        List<Role> rolesList = roleRepository.findAll();
        List<RoleDto> rolesDtoList = new ArrayList<>();

        for (Role role : rolesList) {
            rolesDtoList.add(modelMapper.map(role, RoleDto.class));
        }

        return rolesDtoList;
    }

    @Override
    public List<RoleDto> getRolesListJdbc() {
        List<Role> rolesList = roleDao.findAll();
        List<RoleDto> rolesDtoList = new ArrayList<>();

        for (Role role : rolesList) {
            rolesDtoList.add(modelMapper.map(role, RoleDto.class));
        }

        return rolesDtoList;
    }

    @Override
    public Boolean addRoleJpa(RoleDto roleDto) {
        Role checkRole = roleRepository.findByName(roleDto.getName());

        if (checkRole == null) {
            Role role = modelMapper.map(roleDto, Role.class);
            roleRepository.save(role);
            return true;
        } else {
            return false;
        }
    }

    @Override
    public Boolean addRoleJdbc(RoleDto roleDto) {
        Role checkRole = roleDao.findRoleByName(roleDto.getName());

        if (checkRole == null) {
            roleDao.addRole(roleDto);
            return true;
        } else {
            return false;
        }
    }

    @Override
    public void deleteRoleJpa(long id) {
        roleRepository.deleteById(id);
    }

    @Override
    public void deleteRoleJdbc(long id) {
        roleDao.deleteRoleById(id);
    }

    @Override
    public RoleDto findRoleByIdJpa(long id) {
        Optional<Role> role = roleRepository.findById(id);
        return modelMapper.map(role, RoleDto.class);
    }

    @Override
    public RoleDto findRoleByIdJdbc(long id) {
        Role role = roleDao.findRoleById(id);
        return modelMapper.map(role, RoleDto.class);
    }

    @Override
    public boolean editRoleJpa(RoleDto roleDto) {
        Optional<Role> optionalRole = roleRepository.findById(roleDto.getId());
        Role existingRole = optionalRole.get();

        if (existingRole.getName().equalsIgnoreCase(roleDto.getName())) {
            Role role = modelMapper.map(roleDto, Role.class);
            roleRepository.save(role);
            return true;
        } else {
            Role roleName = roleRepository.findByName(roleDto.getName());
            if (roleName == null) {
                Role role = modelMapper.map(roleDto, Role.class);
                roleRepository.save(role);
                return true;
            } else {
                return false;
            }
        }
    }

    @Transactional
    @Override
    public boolean editRoleJdbc(RoleDto roleDto) {
        Optional<Role> optionalRole = Optional.ofNullable(roleDao.findRoleById(roleDto.getId()));
        Role existingRole = optionalRole.get();

        if (existingRole.getName().equalsIgnoreCase(roleDto.getName())) {
            roleDao.editRole(roleDto);
            return true;
        } else {
            Role roleName = roleDao.findRoleByName(roleDto.getName());
            if (roleName == null) {
                roleDao.editRole(roleDto);
                return true;
            } else {
                return false;
            }
        }
    }
}
