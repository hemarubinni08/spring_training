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
    public void saveRoleDataJdbc(RoleDto roleDto) {
        String sql = "INSERT INTO role VALUES(?)";
        jdbcTemplate.update(sql, roleDto.getName());
    }

    @Override
    public boolean findByName(String name) {
        String sql = "SELECT * FROM role WHERE name= ?";
        List<Role> roles = jdbcTemplate.query(sql, new Object[]{name}, new BeanPropertyRowMapper<>(Role.class));
        return roles.isEmpty();
    }

    @Override
    public List<RoleDto> getAllRolesJdbc() {
        String sql = "select * from role";
        return jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(RoleDto.class));
    }

    @Override
    public void deleteByIdJdbc(Long id) {
        String delete = "delete from role where id = ?";
        jdbcTemplate.update(delete, id);
    }

    @Override
    public Role findByIdJdbc(Long id) {
        String sql = "select * from role where id = ?";
        List<Role> roles = jdbcTemplate.query(sql, new Object[]{id},
                new BeanPropertyRowMapper<>(Role.class));
        return roles.isEmpty() ? null : roles.get(0);
    }

    @Override
    public int updateRoleJdbc(RoleDto roleDto) {
        String sql = "select * from role where name = ? and id<>?";

        List<Role> roles = jdbcTemplate.query(sql, new Object[]{roleDto.getName(), roleDto.getId()},
                new BeanPropertyRowMapper<>(Role.class));

        if (!roles.isEmpty()) {
            return 0;
        }
        String sql1 = "update role set name = ? where id=?";

        return jdbcTemplate.update(sql1,
                roleDto.getName(),
                roleDto.getId());
    }
}
