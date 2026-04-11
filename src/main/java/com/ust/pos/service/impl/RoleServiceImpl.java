package com.ust.pos.service.impl;

import com.ust.pos.dto.RoleDto;
import com.ust.pos.model.Role;
import com.ust.pos.model.RoleRepository;
import com.ust.pos.service.RoleService;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ust.pos.dao.RoleDao;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
public class RoleServiceImpl implements RoleService {

    @Autowired
    RoleDao roleDao;

    @Autowired
    private RoleRepository roleRepository;

    @Autowired
    private ModelMapper modelMapper;

    @Override
    public boolean createRole(RoleDto roleDto) {

        if (roleRepository.existsByName(roleDto.getName())) {
            return false;
        }

        Role role = modelMapper.map(roleDto, Role.class);
        roleRepository.save(role);
        return true;
    }

    @Override
    public List<RoleDto> getAllRoles() {

        List<RoleDto> role_list = new ArrayList<>();

        for (Role role : roleRepository.findAll()) {
            role_list.add(modelMapper.map(role, RoleDto.class));
        }

        return role_list;
    }



    @Override
    public boolean updateRole(RoleDto roleDto) {

        boolean nameTaken =
                roleRepository.existsByNameAndIdNot(
                        roleDto.getName(),
                        roleDto.getId()
                );

        if (nameTaken) {
            return false;
        }

        Optional<Role> roleOpt = roleRepository.findById(roleDto.getId());

        if (roleOpt.isEmpty()) {
            return false;
        }

        Role role = roleOpt.get();
        role.setName(roleDto.getName());

        roleRepository.save(role);
        return true;
    }

    @Override
    public void deleteRole(Long id) {
        roleRepository.deleteById(id);
    }

    @Override
    public boolean createRoleJdbc(RoleDto roleDto) {

        if (roleDao.roleExistsByName(roleDto.getName())) {
            return false;
        }

        return roleDao.createRole(roleDto);
    }

    @Override
    public boolean updateRoleJdbc(RoleDto roleDto) {

        if (roleDao.roleExistsByNameAndIdNot(
                roleDto.getName(), roleDto.getId())) {
            return false;
        }

        return roleDao.updateRole(roleDto);
    }

    @Override
    public void deleteRoleJdbc(Long id) {
        roleDao.deleteRole(id);
    }

    @Override
    public List<RoleDto> getAllRolesJdbc() {
        return roleDao.getAllRoles();
    }
}
