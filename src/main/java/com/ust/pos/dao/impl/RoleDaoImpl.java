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
    public Role findById(Long id) {
        String sq1 = "Select * from role where id = ?";
        List<Role> roleList = jdbcTemplate.query(sq1,new Object[]{id},new BeanPropertyRowMapper(Role.class));
        return  roleList.isEmpty()?null:roleList.get(0);
    }

    @Override
    public Role findByName(String name) {
        String sq1 = "Select * from role where name = ?";
        List<Role> roleList = jdbcTemplate.query(sq1,new Object[]{name},new BeanPropertyRowMapper(Role.class));
        return  roleList.isEmpty()?null:roleList.get(0);
    }

    @Override
    public boolean createUser(RoleDto roleDto) {
        String sq1 = "Update role set name = ? where id = ?";
        int count = jdbcTemplate.update(sq1,roleDto.getName(),roleDto.getId());
        if (count>0){
            return true;
        }
        return false;
    }

    @Override
    public void deleteRoleById(Long id) {
        String sq1 = "Delete from role where id = ?";
        jdbcTemplate.update(sq1,id);
    }
}
