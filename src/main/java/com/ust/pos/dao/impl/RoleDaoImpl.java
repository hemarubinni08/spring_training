package com.ust.pos.dao.impl;

import com.ust.pos.dao.RoleDao;
import com.ust.pos.dto.RoleDto;
import com.ust.pos.model.Role;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class RoleDaoImpl implements RoleDao {
    @Autowired
    JdbcTemplate jdbcTemplate;

    @Autowired
    PasswordEncoder passwordEncoder;

    @Override
    public Boolean saveData(RoleDto roleDto) {
        String sqlQuery = "INSERT INTO role SET name=?";
        int count = jdbcTemplate.update(sqlQuery, roleDto.getName());
        if (roleDto.getName() != null) {
            return true;
        } else {
            return false;
        }
    }

    @Override
    public Role findById(long id) {
        String sqlQuery1 = "SELECT * FROM role WHERE id = ?";
        Role role = jdbcTemplate.queryForObject(sqlQuery1, new Object[]{id}, new BeanPropertyRowMapper<>(Role.class));
        return role;
    }

    @Override
    public Role findByName(String name) {
        String sqlQuery1 = "SELECT * FROM role WHERE name = ?";
        List<Role> role = jdbcTemplate.query(sqlQuery1, new Object[]{name}, new BeanPropertyRowMapper<>(Role.class));
        return role.isEmpty() ? null : role.get(0);
    }

    @Override
    public List<Role> findAllroles() {
        String sqlQuery3 = "SELECT * FROM role";
        List<Role> roles = jdbcTemplate.query(sqlQuery3, new BeanPropertyRowMapper<>(Role.class));
        return roles;
    }

    @Override
    public void deleteById(long id) {
        String sqlQuery4 = "DELETE * FROM role WHERE id = ?";
        jdbcTemplate.update(sqlQuery4, id);
    }

    @Override
    public Role updateDataJdbc(Role role) {
        String sqlQuery5 = "UPDATE role SET name=? WHERE id=?";
        jdbcTemplate.update(sqlQuery5, role.getName(), role.getId());
        return role;
    }
}