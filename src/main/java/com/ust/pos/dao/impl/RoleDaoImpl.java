package com.ust.pos.dao.impl;

import com.ust.pos.dao.RoleDao;
import com.ust.pos.dto.RoleDto;
import com.ust.pos.model.Role;
import com.ust.pos.model.User;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class RoleDaoImpl implements RoleDao {

    @Autowired
    JdbcTemplate jdbcTemplate;

    @Autowired
    ModelMapper modelMapper;

    @Override
    public boolean addRole(RoleDto roleDto) {
        String sql = "INSERT INTO role SET name=?";
        int count= jdbcTemplate.update(sql, roleDto.getName());
        if (count > 0) {
            return true;
        }
        return false;

    }

    @Override
    public Role findRoleByName(String name) {
        String sql = "SELECT * FROM role WHERE name = ?";
        List<Role> roles = jdbcTemplate.query(sql, new Object[]{name}, new BeanPropertyRowMapper(Role.class));
        return roles.isEmpty() ? null : roles.get(0);
    }


    @Override
    public Role updateRole(Role role) {
        String s2="UPDATE role SET name = ?" ;
        jdbcTemplate.update(s2, role.getName());
        return role;
    }

    @Override
    public Role findById(Long id) {
        String s1 = "Select * from role where id=?";
        List<Role> roleList = jdbcTemplate.query(
                s1,
                new Object[]{id},
                new BeanPropertyRowMapper(Role.class));
        return roleList.isEmpty() ? null : roleList.get(0);
    }

    @Override
    public List<Role> findallRole() {
        String s2="SELECT * FROM role";
        List<Role> roleList = jdbcTemplate.query(s2,new BeanPropertyRowMapper<>(Role.class));
        return roleList;
    }

    @Override
    public void deleteRoleById(Long id) {
        String sql2 = "DELETE FROM role WHERE id=?";
        jdbcTemplate.update(sql2, id);
    }
}
