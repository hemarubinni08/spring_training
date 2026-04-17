package com.ust.pos.dao.impl;

import com.ust.pos.dao.RoleDao;
import com.ust.pos.dto.RoleDto;
import com.ust.pos.model.Role;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Optional;

@Component
public class RoleDaoImpl implements RoleDao {

    @Autowired
    JdbcTemplate jdbctemplate;

    @Override
    public boolean addRole(RoleDto roleDto) {
        String sqlQ = "INSERT into role (name) values (?)";
        int count = jdbctemplate.update(sqlQ, roleDto.getName());
        if (count > 0) {
            return true;
        } else {
            return false;
        }
    }

    @Override
    public boolean existsByName(RoleDto roleDto) {
        String sql = "SELECT COUNT(*) FROM role WHERE name = ?";
        Integer count = jdbctemplate.queryForObject(sql, Integer.class, roleDto.getName());
        if (count != null && count > 0) {
            return true;
        } else {
            return false;
        }
    }

    @Override
    public void deleteById(long id) {
        String sqlQ = "DELETE FROM role WHERE id=?";
        jdbctemplate.update(sqlQ, id);
    }

    @Override
    public Optional<Role> findByIdJdbc(long id) {
        String sqlQ = "SELECT * FROM role WHERE id=?";
        List<Role> userlist = jdbctemplate.query(sqlQ,
                new Object[]{id},
                new BeanPropertyRowMapper(Role.class));
        return userlist.isEmpty() ? null : Optional.ofNullable(userlist.get(0));
    }

    @Override
    public void updateRole(Role role) {
        String sqlQ = "UPDATE role SET name=? Where id=?";
        jdbctemplate.update(sqlQ, role.getName(), role.getId());
    }
}

