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
    public List<Role> findAllRolesJdbc() {
        String sqlQuery = "SELECT * FROM ROLE";
        List<Role> roleList = jdbcTemplate.query(sqlQuery, new BeanPropertyRowMapper(Role.class));
        return roleList;
    }

    @Override
    public boolean saveRoleJdbc(Role role) {
        String sqlQuery = "INSERT INTO ROLE SET NAME=?";
        int count = jdbcTemplate.update(sqlQuery, role.getName());
        if (count > 0) return true;
        else return false;
    }

    @Override
    public boolean existsByName(String name) {
        String sqlQuery = "SELECT * FROM ROLE WHERE name=?";
        List<Role> roleList = jdbcTemplate.query(
                sqlQuery,
                new Object[]{name},
                new BeanPropertyRowMapper(Role.class));
        if (roleList.isEmpty()) {
            return true;
        } else {
            return false;
        }


    }


    @Override
    public void deleteById(Long id) {
        String sqlQuery = "DELETE FROM ROLE WHERE ID=?";
        int rowsDeleted = jdbcTemplate.update(sqlQuery, id);

    }

    @Override
    public boolean updateByIdJdbc(RoleDto roleDto) {
        String sqlQuery = "UPDATE ROLE SET NAME=? WHERE ID=?";
        int count = jdbcTemplate.update(sqlQuery, roleDto.getName(), roleDto.getId());
        if (count > 0) return true;
        else return false;


    }

    @Override
    public Role findById(Long id) {
        String sqlQuery = "SELECT * FROM ROLE WHERE ID=?";
        List<Role> roleList = jdbcTemplate.query(
                sqlQuery,
                new Object[]{id},
                new BeanPropertyRowMapper(Role.class));
        return roleList.isEmpty() ? null : roleList.get(0);
    }

    @Override
    public Role findByName(String name) {
        String sqlQuery = "SELECT * FROM ROLE WHERE NAME=?";
        List<Role> roleList = jdbcTemplate.query(
                sqlQuery,
                new Object[]{name},
                new BeanPropertyRowMapper(Role.class));
        return roleList.isEmpty() ? null : roleList.get(0);
    }
}