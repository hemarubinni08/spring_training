package com.ust.pos.service;

import com.ust.pos.dao.RoleDao;
import com.ust.pos.dto.RoleDto;
import com.ust.pos.model.Role;
import com.ust.pos.model.RoleRepository;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
@Component
public class RoleServiceImpl implements RoleService {
    @Autowired
    private RoleRepository roleRepository;
    @Autowired
    private ModelMapper modelMapper;
    @Autowired
    private RoleDao roleDao;

    @Override
    public List<RoleDto> getAllUsersRoles() {
        List<Role> userRoles = roleRepository.findAll();
        List<RoleDto> resultDto = new ArrayList<>();
        for (Role roleUser : userRoles) {
            RoleDto roleDto = modelMapper.map(roleUser, RoleDto.class);
            resultDto.add(roleDto);
        }

        return resultDto;
    }

    @Override
    public List<RoleDto> displayValuesJdbc() {
        List<Role> Roleusers = roleDao.findAllUsersJdbc();

        List<RoleDto> resultDto = new ArrayList<>();
        for (Role roleUser : Roleusers) {
            RoleDto roleDto1 = modelMapper.map(roleUser, RoleDto.class);
            resultDto.add(roleDto1);
        }
        return resultDto;
    }

    @Override
    public RoleDto findById(Long id) {
        Optional<Role> role = roleRepository.findById(id);
        if (role.isPresent()) {
            return modelMapper.map(role.get(), RoleDto.class);
        }
        return null;
    }

    @Override
    public RoleDto findByIdJdbc(Long id) {
        Role role = roleDao.findById(id);
        if (role != null) {
            return modelMapper.map(role, RoleDto.class);
        }
        return new RoleDto();
    }

    @Override
    public boolean edit(RoleDto roleDto) {
        Role existingRole = roleRepository.findByName(roleDto.getName());

        if (existingRole != null &&
                existingRole.getId() != roleDto.getId()) {
            return false;
        }
        Role role = modelMapper.map(roleDto, Role.class);
        roleRepository.save(role);

        return true;
    }

    @Override
    public boolean editJdbc(RoleDto roleDto) {
        Role existingUserWithName = roleDao.findByName(roleDto.getName());

        if (existingUserWithName != null &&
                existingUserWithName.getId() != roleDto.getId()) {
            return false;
        }
        roleDao.edit(roleDto);
        return true;
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
    public boolean addRole(RoleDto roleDto) {
        Role existingRole = roleRepository.findByName(roleDto.getName());

        if (existingRole != null &&
                existingRole.getId() != roleDto.getId()) {
            return false;
        }
        Role role = modelMapper.map(roleDto, Role.class);
        roleRepository.save(role);
        return true;
    }

    @Override
    public boolean addRoleJdbc(RoleDto roleDto) {
        Role existingUserWithName = roleDao.findByName(roleDto.getName());

        if (existingUserWithName != null &&
                existingUserWithName.getId() != roleDto.getId()) {
            return false;
        }
        roleDao.register(roleDto);
        return true;

    }
}