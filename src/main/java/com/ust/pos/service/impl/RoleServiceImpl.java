package com.ust.pos.service.impl;

import com.ust.pos.dao.RoleDao;
import com.ust.pos.dto.RoleDto;
import com.ust.pos.model.Role;
import com.ust.pos.model.RoleRepository;
import com.ust.pos.service.RoleService;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
@Transactional
public class RoleServiceImpl implements RoleService {
    @Autowired
    RoleRepository roleRepository;
    @Autowired
    ModelMapper modelMapper;
    @Autowired
    RoleDao roleDao;

    @Override
    public RoleDto add(RoleDto roleDto) {
        Role role = roleRepository.findByName(roleDto.getName());
        if(role==null) {
                Role role1 = modelMapper.map(roleDto, Role.class);
                roleRepository.save(role1);
                return roleDto;
            }
        else{
        roleDto.setMessage("Role already exists");
        }
        return roleDto;
    }

    @Override
    public List<RoleDto> display() {
        List<Role> listOfRoles = roleRepository.findAll();
        return listOfRoles.stream().map(role -> modelMapper.map(role, RoleDto.class)).collect(Collectors.toList());
    }

    @Override
    public void deleteRole(long id) {
        roleRepository.deleteById(id);
    }

    @Override
    public RoleDto update(RoleDto roleDto) {
        Optional<Role> roleOptional = roleRepository.findById(roleDto.getId());
        Role role = roleOptional.get();
        if(roleDto.getName().equalsIgnoreCase(role.getName()))
        {
            roleDto.setMessage("Role already exists");
        }
        else
        {
            modelMapper.map(roleDto, role);
            roleRepository.save(role);
        }
        return roleDto;
    }

    @Override
    public RoleDto findId(long id) {
        Optional<Role> roleOptional = roleRepository.findById(id);
        RoleDto role = modelMapper.map(roleOptional.get(), RoleDto.class);
        return role;
    }

    @Override
    public RoleDto addRoleJDBC(RoleDto roleDto) {
        Role role = roleRepository.findByName(roleDto.getName());
        if(role==null) {
            roleDao.addrole(roleDto);
            return roleDto;
        }
        else{
            roleDto.setMessage("Role already exists");
        }
        return roleDto;
    }

    @Override
    public List<RoleDto> displayjdbc() {
        List<Role> listOfRoles = roleDao.displayrole();
        return listOfRoles.stream().map(role -> modelMapper.map(role, RoleDto.class)).collect(Collectors.toList());
    }
}
