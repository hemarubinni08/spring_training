package com.ust.pos.dao.impl;

import com.ust.pos.dao.RoleDao;
import com.ust.pos.dto.RoleDto;
import com.ust.pos.model.Role;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class RoleDaoImpl implements RoleDao {
    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Override
    public void addJdbc(RoleDto roleDto) {
        String sql = "INSERT INTO role (name) VALUES (?)";
        jdbcTemplate.update(sql, roleDto.getName());
    }

    @Override
    public List<Role> findAllJdbc() {
        String sql = "SELECT * FROM role";
        return jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(Role.class));
    }

    @Override
    public void deleteByIdJdbc(Long id) {
        String sql = "DELETE FROM role WHERE id=?";
        jdbcTemplate.update(sql, id);
    }

    @Override
    public Role findByIdJdbc(Long id) {
        String sql = "SELECT * FROM role WHERE id=?";
        List<Role> roles = jdbcTemplate.query(sql,
                new Object[]{id},
                new BeanPropertyRowMapper<>(Role.class));
        return roles.isEmpty() ? null : roles.get(0);
    }

    @Override
    public void updateJdbc(RoleDto roleDto) {
        String sql = "UPDATE role SET name=? WHERE id=?";
        jdbcTemplate.update(sql, roleDto.getName(), roleDto.getId());
    }

    @Override
    public boolean existsByNameJdbc(String name) {
        String sql = "SELECT COUNT(*) FROM role WHERE LOWER(name) = LOWER(?)";
        Integer count = jdbcTemplate.queryForObject(sql, Integer.class, name);
        return count != null && count > 0;
    }
}