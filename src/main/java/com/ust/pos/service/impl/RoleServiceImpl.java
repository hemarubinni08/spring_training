package com.ust.pos.service.impl;

import com.ust.pos.dao.RoleDao;
import com.ust.pos.dto.RoleDto;
import com.ust.pos.model.Role;
import com.ust.pos.model.RoleRepository;
import com.ust.pos.service.RoleService;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
public class RoleServiceImpl implements RoleService {
    @Autowired
    ModelMapper modelMapper;
    @Autowired
    RoleDao roleDao;
    @Autowired
    private RoleRepository roleRepository;

    @Override
    public RoleDto saveRoleData(RoleDto roleDto) {
        Role existingRole = roleRepository.findByName(roleDto.getName());
        if (existingRole != null) {
            return null;
        }
        Role role = modelMapper.map(roleDto, Role.class);
        Role savedRole = roleRepository.save(role);
        return modelMapper.map(savedRole, RoleDto.class);
    }

    @Override
    public boolean saveRoleDataJdbc(RoleDto roleDto) {

        if (roleDao.findByName(roleDto.getName())) {
            roleDao.saveRoleDataJdbc(modelMapper.map(roleDto, RoleDto.class));
        }
        return false;
    }

    @Override
    public List<RoleDto> getAllRoles() {
        List<Role> roles = roleRepository.findAll();
        return roles.stream().map(role -> modelMapper.map(role, RoleDto.class))
                .collect(Collectors.toList());
    }

    @Override
    public List<RoleDto> getAllRolesJdbc() {
        return roleDao.getAllRolesJdbc();
    }

    @Override
    public void deleteById(Long id) {
        roleRepository.deleteById(id);
    }

    @Override
    public void deleteByIdJdbc(Long id) {
        roleDao.deleteByIdJdbc(id);
    }

    @Override
    public RoleDto findById(Long id) {
        Optional<Role> role = roleRepository.findById(id);
        return modelMapper.map(role, RoleDto.class);
    }

    @Override
    public RoleDto findByIdJdbc(Long id) {
        Role role = roleDao.findByIdJdbc(id);
        return modelMapper.map(role, RoleDto.class);
    }

    @Override
    public RoleDto updateRole(RoleDto roleDto) {
        Role existingRole = roleRepository.findById(roleDto.getId()).orElse(null);

        if (existingRole == null) {
            return null;
        }

        Role roleByName = roleRepository.findByName(roleDto.getName());

        if (roleByName != null && !roleByName.getId().equals(roleDto.getId())) {
            return null;
        }

        existingRole.setName(roleDto.getName());
        Role updatedRole = roleRepository.save(existingRole);
        return modelMapper.map(updatedRole, RoleDto.class);
    }

    @Override
    public int updateRoleJdbc(RoleDto roleDto) {
        if (roleDao.updateRoleJdbc(roleDto) < 1) {
            roleDto.setMessage("Failed Updating");
        }
        roleDto.setMessage("Update Success");
        return 1;
    }
}
