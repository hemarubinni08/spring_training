package com.ust.pos.dao.impl;

import com.ust.pos.dao.RoleDao;
import com.ust.pos.dto.RoleDto;
import com.ust.pos.model.Role;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class RoleDaoImpl implements RoleDao {

    @Autowired
    JdbcTemplate jdbcTemplate;

    @Override
    public boolean createRole(RoleDto roleDto) {
        String sql = "INSERT INTO role (name) VALUES (?)";
        return jdbcTemplate.update(sql, roleDto.getName()) > 0;
    }

    @Override
    public boolean updateRole(RoleDto roleDto) {
        String sql = "UPDATE role SET name = ? WHERE id = ?";
        return jdbcTemplate.update(sql, roleDto.getName(), roleDto.getId()) > 0;
    }

    @Override
    public void deleteRole(long id) {
        jdbcTemplate.update("DELETE FROM role WHERE id = ?", id);
    }

    @Override
    public List<Role> getAllRoles() {
        return jdbcTemplate.query("SELECT id, name FROM role",new BeanPropertyRowMapper<>(Role.class));
    }

    @Override
    public Role getRoleById(long id) {
        String sql = "SELECT id, name FROM role WHERE id = ?";
        return jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<>(Role.class), id);
    }

    @Override
    public boolean existsByName(String name) {
        String sql = "SELECT COUNT(*) FROM role WHERE LOWER(name) = LOWER(?)";
        Integer count = jdbcTemplate.queryForObject(sql, Integer.class, name);
        return count != null && count > 0;
    }
}
