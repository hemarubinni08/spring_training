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

    public void addRoleJdbc(RoleDto roleDto) {
        String sqlQ = "insert into role set name=?";
        jdbcTemplate.update(sqlQ, roleDto.getName());
    }

    public void deleteRoleByIdJdbc(Long id) {
        String sqlQ = "delete from role where id=?";
        jdbcTemplate.update(sqlQ, id);
    }

    public void updateRoleByJdbc(RoleDto roleDto) {
        String sqlQ = "update role set name=? where id=?";
        jdbcTemplate.update(sqlQ, roleDto.getName(), roleDto.getId());
    }

    public List<Role> printAllRoles() {
        String sqlQ = "select * from role";
        List<Role> roleList = jdbcTemplate.query(sqlQ, new BeanPropertyRowMapper(Role.class));
        return roleList;
    }

    public Role getRoleProfileJdbc(Long id) {
        String sqlQ = "select * from role where id=?";
        List<Role> rolel = jdbcTemplate.query(sqlQ, new Object[]{id}, new BeanPropertyRowMapper(Role.class));
        return rolel.isEmpty() ? null : rolel.get(0);
    }

    public Role findByName(String name) {
        String sqlQ = "select * from role where name=?";
        List<Role> rolename = jdbcTemplate.query(sqlQ, new Object[]{name}, new BeanPropertyRowMapper(Role.class));
        return rolename.isEmpty() ? null : rolename.get(0);
    }
}
