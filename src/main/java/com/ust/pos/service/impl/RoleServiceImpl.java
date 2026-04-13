package com.ust.pos.service.impl;

import com.ust.pos.dao.RoleDao;
import com.ust.pos.dto.RoleDto;
import com.ust.pos.model.Role;
import com.ust.pos.model.RoleRepository;
import com.ust.pos.service.RoleService;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import javax.swing.event.ListDataEvent;
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
        List<RoleDto> roleDto = new ArrayList<>();
        for (Role role1 : roles) {
            roleDto.add(modelMapper.map(role1, RoleDto.class));
        }
        return roleDto;
    }

    public List<RoleDto> getAllRolesJdbc() {
        List<Role> roleList=roleDao.printAllRoles();
        List<RoleDto> roleDtoList=new ArrayList<>();
        for (Role role:roleList){
            roleDtoList.add(modelMapper.map(role,RoleDto.class));
        }
        return roleDtoList;
    }

    public boolean addRole(RoleDto roleDto) {
        boolean existingRole = roleRepository.existsByName(roleDto.getName());
        if (existingRole) {
            return false;
        } else {
            Role role = modelMapper.map(roleDto, Role.class);
            roleRepository.save(role);
            return true;
        }
    }

    public boolean addRoleJdbc(RoleDto roleDto){
        boolean existingRole=roleRepository.existsByName(roleDto.getName());
        if(existingRole){
            return false;
        }
        else {
            Role role=modelMapper.map(roleDto,Role.class);
            roleDao.addRoleJdbc(roleDto);
            return true;
        }
    }

    public void deleteById(Long id) {
        roleRepository.deleteById(id);
    }

    public void deleteByIdJdbc(Long id){
        roleDao.deleteRoleByIdJdbc(id);
    }

    public boolean updateRole(RoleDto roleDto) {
        Optional<Role> role = roleRepository.findById(roleDto.getId());
        if (role.isPresent()) {
            Role existingRole=role.get();
            if (!existingRole.getName().equalsIgnoreCase(roleDto.getName())){
                if (roleRepository.findByName(roleDto.getName())==null){
                    Role updatedRole = modelMapper.map(roleDto, Role.class);
                    roleRepository.save(updatedRole);
                    return true;
                }
            }
        }
        return false;
    }

    public boolean updateRoleJdbc(RoleDto roleDto) {
        Optional<Role> role=roleRepository.findById(roleDto.getId());
        if(role.isPresent()){
            Role existingRole=role.get();
            if(!existingRole.getName().equalsIgnoreCase(roleDto.getName())){
                if(roleDao.findByName(roleDto.getName())==null){
                    modelMapper.map(roleDto,existingRole);
                    roleDao.updateRoleByJdbc(roleDto);
                    return true;
                }
            }
        }
        return false;
    }

    public RoleDto getProfile(Long id) {
        Optional<Role> role = roleRepository.findById(id);
        RoleDto roleDto = modelMapper.map(role, RoleDto.class);
        return roleDto;
    }

    @Override
    public RoleDto getProfileJdbc(Long id) {
         Role role= roleDao.getRoleProfileJdbc(id);
         return modelMapper.map(role,RoleDto.class);
    }

}
