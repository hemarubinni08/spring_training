package com.ust.pos.service.impl;

import com.ust.pos.dao.RoleDao;
import com.ust.pos.dto.RoleDto;
import com.ust.pos.model.CommonRepository;
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
    CommonRepository commonRepository;

    @Autowired
    RoleRepository roleRepository;

    @Autowired
    ModelMapper modelMapper;

    @Autowired
    RoleDao roleDao;

    @Override
    public boolean createRole(RoleDto roleDto) {
        Role existingRole = roleRepository.findByName(roleDto.getName());
        if (existingRole == null){
            Role role =  modelMapper.map(roleDto, Role.class);
            roleRepository.save(role);
            return true;
        }
        return false;
    }

    @Override
    public List<RoleDto> roleList() {
       List<Role> roleList = roleRepository.findAll();
       List<RoleDto> roleDtoList = new ArrayList<>();
       for (Role role : roleList){
           RoleDto roleDto = modelMapper.map(role, RoleDto.class);
           roleDtoList.add(roleDto);
       }
       return roleDtoList;
    }

    @Override
    public void deleteRole(Long id) {
        roleRepository.deleteById(id);
    }

    @Override
    public void deleteRoleJdbc(Long id) {
        roleDao.deleteRoleById(id);
    }

    @Override
    public RoleDto getRoleDetailsByid(Long id) {
        Optional<Role> role = roleRepository.findById(id);
        RoleDto roleDto = modelMapper.map(role.get(),RoleDto.class);
        return roleDto;
    }

    @Override
    public boolean updateRole(RoleDto roleDto) {
        Optional<Role> role = roleRepository.findById(roleDto.getId());
        Role roleWithSameName = roleRepository.findByName(roleDto.getName());

        if (roleWithSameName==null){
            modelMapper.map(roleDto,role.get());
            roleRepository.save(role.get());
            return true;
        }
        else {
            if (roleWithSameName.getId() == role.get().getId()){
                modelMapper.map(roleDto,role.get());
                roleRepository.save(role.get());
                return true;
            }
        }
        return false;
    }

    @Override
    public boolean updateRoleJdbc(RoleDto roleDto) {
        Role role = roleDao.findById(roleDto.getId());
        Role roleWithSameName = roleDao.findByName(roleDto.getName());

        if (roleWithSameName==null){
            roleDao.createUser(roleDto);
            return true;
        }
        else {
            if (roleWithSameName.getId() == role.getId()){
                roleDao.createUser(roleDto);
                return true;
            }
        }
        return false;
    }

}
