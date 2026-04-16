package com.ust.pos.dao.impl;

import com.ust.pos.dao.RoleDao;
import com.ust.pos.dto.RoleDto;
import com.ust.pos.model.Role;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import java.util.List;

@Component

public class RoleDaoImpl implements RoleDao {

    @Autowired
    JdbcTemplate jdbcTemplate;

    @Override
    public void createRole(RoleDto roleDto) {

        String sqlQ = "INSERT INTO role SET name = ?";
        jdbcTemplate.update(sqlQ, roleDto.getName());
    }

    @Override
    public List<Role> getAllRoles() {

        String sqlQ = "SELECT * FROM role";

        return jdbcTemplate.query(
                sqlQ,
                new BeanPropertyRowMapper(Role.class));
    }

    @Override
    public Role getRoleById(long id) {

        String sql = "SELECT * FROM `role` WHERE id = ?";
        try {
            return jdbcTemplate.queryForObject(
                    sql,
                    new BeanPropertyRowMapper<>(Role.class),
                    id
            );

        } catch (EmptyResultDataAccessException e) {
            return null; // no user found
        }
    }

    @Override
    public int updateRole(RoleDto roleDto) {

        String sql = "UPDATE role SET name = ? WHERE id = ?";

        return jdbcTemplate.update(
                sql,
                roleDto.getName(),
                roleDto.getId()
        );
    }

    @Override
    public int deleteRoleById(long id) {

        String sql = "DELETE FROM role WHERE id = ?";

        return jdbcTemplate.update(sql, id);
    }
}
