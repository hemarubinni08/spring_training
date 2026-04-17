package com.ust.pos.dao.impl;

import com.ust.pos.dao.RoleDao;
import com.ust.pos.dto.RoleDto;
import com.ust.pos.dto.UserDto;
import com.ust.pos.model.Role;
import com.ust.pos.model.User;
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

    @Override
    public void register(RoleDto roleDto) {
        String sq1 = "INSERT INTO ROLE VALUES (?,?)";
        jdbcTemplate.update(sq1, null, roleDto.getName());

    }

    @Override
    public List<Role> findAllUsersJdbc() {
        String sq1 = "SELECT * FROM ROLE";
        List<Role> roleList = jdbcTemplate.query(sq1,
                new BeanPropertyRowMapper<>(Role.class));

        return roleList;
    }

    @Override
    public Role findById(Long id) {
        String sq1 = "SELECT * FROM role WHERE id = ?";
        List<Role> roleList = jdbcTemplate.query(sq1, new Object[]{id},
                new BeanPropertyRowMapper(Role.class));
        return roleList.isEmpty() ? null : roleList.get(0);
    }

    @Override
    public void edit(RoleDto roleDto) {
        String sq1 = "UPDATE ROLE SET name=? WHERE id=?";
        jdbcTemplate.update(sq1, roleDto.getName(), roleDto.getId());
    }

    @Override
    public void deleteByIdJdbc(Long id) {
        String sq1 = "DELETE FROM ROLE WHERE id = ?";
        jdbcTemplate.update(sq1, id);
    }

    @Override
    public Role findByName(String name) {
        String sq1 = "SELECT * FROM ROLE WHERE name = ?";
        List<Role> roleList = jdbcTemplate.query(sq1, new Object[]{name},
                new BeanPropertyRowMapper(Role.class));
        return roleList.isEmpty() ? null : roleList.get(0);
    }
}