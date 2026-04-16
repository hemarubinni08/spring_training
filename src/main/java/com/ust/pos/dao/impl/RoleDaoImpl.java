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
    public List<Role> getUsersJdbc() {
        String sq1 = "SELECT * FROM role";
        return jdbcTemplate.query(
                sq1,
                new BeanPropertyRowMapper<>(Role.class));
    }

    @Override
    public void addRole(RoleDto roleDto) {
        String sq1 = "INSERT INTO role SET name = ?";
        jdbcTemplate.update(sq1, roleDto.getName());
    }

    @Override
    public void updateValue(RoleDto roleDto) {
        String sq1 = "UPDATE role SET name = ? WHERE id = ?";
        jdbcTemplate.update(sq1, roleDto.getName(), roleDto.getId());

    }

    @Override
    public void deleteRole(Long id) {
        String sq1 = "DELETE FROM role WHERE id = ?";
        jdbcTemplate.update(sq1, id);
    }

    @Override
    public Role findRoleById(Long id) {
        String sq1 = "SELECT * FROM role WHERE id = ?";
        List<Role> roleList = jdbcTemplate.query(
                sq1,
                new Object[]{id},
                new BeanPropertyRowMapper<>(Role.class));
        return roleList.isEmpty() ? null : roleList.getFirst();
    }
}