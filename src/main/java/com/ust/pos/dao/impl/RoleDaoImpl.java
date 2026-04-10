package com.ust.pos.dao.impl;

import com.ust.pos.dao.RoleDao;
import com.ust.pos.dto.RoleDto;
import com.ust.pos.model.Role;
import com.ust.pos.model.User;
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
    public boolean addRole(RoleDto roleDto) {
        String s1 = "insert into role set name = ?";
        jdbcTemplate.update(s1 , roleDto.getName());
        if(roleDto.getName() != null){
            return true;
        }
        else{
            return false;
        }
    }

    @Override
    public Role findByName(String name) {
        String s1 = "select * from role where name =?";
        List<Role> role = jdbcTemplate.query(s1, new Object[]{name}, new BeanPropertyRowMapper<>(Role.class));
        return role.isEmpty()?null : role.get(0);
    }
}
