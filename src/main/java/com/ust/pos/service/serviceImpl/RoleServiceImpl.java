package com.ust.pos.service.serviceImpl;

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

@Service
public class RoleServiceImpl implements RoleService {

    @Autowired
    private RoleRepository roleRepository;

    @Autowired
    private RoleDao roleDao;

    @Autowired
    private ModelMapper modelMapper;

    // ================= CREATE =================

    @Override
    public RoleDto createRoleUsingJpa(RoleDto roleDto) {
        Role role = modelMapper.map(roleDto, Role.class);
        roleRepository.save(role);
        return roleDto;
    }

    @Override
    public RoleDto createRoleUsingJdbc(RoleDto roleDto) {

        // ✅ Check duplicate
        if (roleDao.existsByName(roleDto.getName())) {
            roleDto.setMessage("Role already exists!");
            roleDto.setColour("red");
            return roleDto;
        }

        roleDao.createRole(roleDto);

        roleDto.setMessage("Role added successfully!");
        roleDto.setColour("green");
        return roleDto;
    }

    // ================= DELETE =================

    @Override
    public void deleteRoleUsingIdJpa(long id) {
        roleRepository.deleteById(id);
    }

    @Override
    public void deleteRoleUsingIdJdbc(long id) {
        roleDao.deleteRole(id);
    }

    // ================= UPDATE =================

    @Override
    public boolean updateRoleUsingJdbc(RoleDto roleDto) {
        return roleDao.updateRole(roleDto);
    }

    @Override
    public RoleDto updateRoleUsingJpa(RoleDto roleDto) {

        if (roleRepository.existsByNameAndIdNot(roleDto.getName(), roleDto.getId())) {
            roleDto.setMessage("Role already exists!");
            roleDto.setColour("red");
            return roleDto;
        }

        Optional<Role> roleOpt = roleRepository.findById(roleDto.getId());
        if (roleOpt.isEmpty()) {
            roleDto.setMessage("Role not found!");
            roleDto.setColour("red");
            return roleDto;
        }

        Role role = roleOpt.get();
        role.setName(roleDto.getName());
        roleRepository.save(role);

        roleDto.setMessage("Role updated successfully!");
        roleDto.setColour("green");
        return roleDto;
    }

    // ================= LIST =================

    @Override
    public List<RoleDto> getAllRolesUsingJdbc() {
        return roleDao.getAllRoles().stream()
                .map(role -> modelMapper.map(role, RoleDto.class))
                .toList();
    }

    @Override
    public List<RoleDto> getAllRolesUsingJpa() {
        return roleRepository.findAll().stream()
                .map(role -> modelMapper.map(role, RoleDto.class))
                .toList();
    }

    // ================= BY ID =================

    @Override
    public RoleDto getRoleByIdUsingJpa(long id) {
        return roleRepository.findById(id)
                .map(role -> modelMapper.map(role, RoleDto.class))
                .orElse(new RoleDto());
    }

    @Override
    public RoleDto getRoleByIdUsingJdbc(long id) {
        Role role = roleDao.getRoleById(id);
        return role != null ? modelMapper.map(role, RoleDto.class) : null;
    }

}