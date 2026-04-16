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
    private JdbcTemplate jdbcTemplate;

    @Override
    public List<Role> findAll() {
        String listSql = "SELECT * FROM role";
        List<Role> rolesList = jdbcTemplate.query(listSql, new BeanPropertyRowMapper(Role.class));
        return rolesList;
    }

    @Override
    public Role findRoleByName(String name) {
        String sql = "SELECT * FROM role WHERE name = ?";
        List<Role> roleList = jdbcTemplate.query(sql, new Object[]{name}, new BeanPropertyRowMapper(Role.class));
        return roleList.isEmpty() ? null : roleList.get(0);
    }

    @Override
    public boolean addRole(RoleDto roleDto) {
        String sql = "INSERT INTO role SET name = ?";
        jdbcTemplate.update(sql, roleDto.getName());
        return true;
    }

    @Override
    public void deleteRoleById(long id) {
        String deleteSql = "DELETE FROM role WHERE id=?";
        jdbcTemplate.update(deleteSql, id);
    }

    @Override
    public Role findRoleById(long id) {
        String sql = "SELECT * FROM role WHERE id=?";
        List<Role> roleList = jdbcTemplate.query(sql, new Object[]{id}, new BeanPropertyRowMapper(Role.class));
        return roleList.isEmpty() ? null : roleList.get(0);
    }

    @Override
    public void editRole(RoleDto roleDto) {
        String sql = "UPDATE role SET name = ? WHERE id = ?";
        jdbcTemplate.update(sql, roleDto.getName(), roleDto.getId());
    }
}
