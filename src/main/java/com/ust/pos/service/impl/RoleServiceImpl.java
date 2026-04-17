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


    @Override
    public RoleDto addRole(RoleDto roleDto) {

        if (roleRepository.existsByName(roleDto.getName())) {
            return null;
        }

        roleRepository.save(modelMapper.map(roleDto, Role.class));

        return roleDto;
    }

    @Override
    public RoleDto updateRole(RoleDto roleDto) {

        Optional<Role> role = roleRepository.findById(roleDto.getId());
        String existing_name = "";

        if (role.isPresent()) {

            existing_name = role.get().getName();
        }

        if (existing_name.equalsIgnoreCase(roleDto.getName())) {

            roleRepository.save(modelMapper.map(roleDto, Role.class));

            return roleDto;
        } else {

            if (roleRepository.existsByName(roleDto.getName())) {

                return null;
            } else {

                roleRepository.save(modelMapper.map(roleDto, Role.class));

                return roleDto;
            }
        }
    }

    @Override
    public void deleteRole(Long id) {

        roleRepository.deleteById(id);
    }

    @Override
    public List<RoleDto> listRoles() {

        List<Role> rolelist = roleRepository.findAll();
        List<RoleDto> roleDtoList = new ArrayList<>();

        for (Role role : rolelist) {
            roleDtoList.add(modelMapper.map(role, RoleDto.class));
        }

        return roleDtoList;
    }

    @Override
    public RoleDto getRoleById(Long id) {

        return modelMapper.map(roleRepository.findById(id), RoleDto.class);
    }

    @Override
    public void addRoleJdbc(RoleDto roleDto) {

        if (roleDao.existsByName(roleDto.getName())) {

            roleDao.saveRole(modelMapper.map(roleDto, Role.class));

        }
    }

    @Override
    public boolean updateRoleJdbc(RoleDto roleDto) {

        Role role = roleDao.updateByid(modelMapper.map(roleDto, Role.class));

        return role != null;
    }

    @Override
    public RoleDto getRoleByIdJdbc(Long id) {

        Role role = roleDao.findById(id);

        return modelMapper.map(role, RoleDto.class);
    }

    @Override
    public boolean deleteByIdJdbc(Long id) {

        return roleDao.deleteById(id);
    }


}
