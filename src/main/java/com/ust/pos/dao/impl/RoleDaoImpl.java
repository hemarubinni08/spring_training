package com.ust.pos.dao.impl;

import com.ust.pos.dao.RoleDao;
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
    public void saveRole(Role role) {

        String sql = "Insert into role values(?,?)";

        jdbcTemplate.update(sql, role.getId(), role.getName());
    }

    @Override
    public boolean existsByName(String name) {

        String sql = "Select * from role where name=?";

        List<Role> roles = jdbcTemplate.query(sql,
                new Object[]{name}, new BeanPropertyRowMapper<>(Role.class));

        return roles.isEmpty();
    }

    @Override
    public Role updateByid(Role role) {

        String sql = "Select * from role where name =? And id<>?";

        Role existing_role = jdbcTemplate.queryForObject(sql, Role.class,
                role.getName(), role.getId());

        if (existing_role != null) {
            return null;
        }

        String sql1 = "Update role set name=?";

        jdbcTemplate.update(sql1, role.getName());

        return role;
    }

    @Override
    public Role findById(Long id) {

        String sql = "Select * from role where id=?";

        List<Role> role_list = jdbcTemplate.query(sql, new Object[]{id},
                new BeanPropertyRowMapper<>(Role.class));


        return role_list.getFirst();
    }

    @Override
    public boolean deleteById(Long id) {

        String sql = "delete from role where id=?";

        return jdbcTemplate.update(sql, id) > 0;
    }
}
