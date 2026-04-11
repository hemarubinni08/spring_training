package com.ust.pos.dao.Impl;

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
    public boolean addrole(RoleDto roleDto) {
        String sql = "INSERT INTO role SET name=?";
        int count  = jdbcTemplate.update(sql, roleDto.getName());
        if(count > 0)
        {
            return true;
        }
        else
        {
            return false;
        }
    }

    @Override
    public Role findById(long id) {
        String sql = "SELECT * FROM role WHERE id=?";
        List<Role> roleList = jdbcTemplate.query(sql, new Object[]{id}, new BeanPropertyRowMapper(Role.class));
        return roleList.get(0);
    }

    @Override
    public List<Role> displayrole() {
        String sql = "SELECT * FROM role";
        List<Role> roleList = jdbcTemplate.query(sql, new BeanPropertyRowMapper(Role.class));
        return roleList;
    }
}
