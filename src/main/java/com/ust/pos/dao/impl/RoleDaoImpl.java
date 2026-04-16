package com.ust.pos.dao.impl;

import com.ust.pos.dao.RoleDao;
import com.ust.pos.dto.RoleDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;

@Component
public class RoleDaoImpl implements RoleDao {

    @Autowired
    JdbcTemplate jdbcTemplate;
    @Autowired
    PasswordEncoder passwordEncoder;
    @Override
    public RoleDto addRoleJdbc(RoleDto roleDto) {
        String sql = "INSERT INTO role SET name = ?";
        jdbcTemplate.update(sql, roleDto.getName());
        return roleDto;
    }
    }

