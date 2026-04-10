package com.ust.pos.dao.impl;

import com.ust.pos.dao.RoleDao;
import com.ust.pos.dto.RoleDto;
import org.springframework.stereotype.Repository;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import java.util.List;

@Repository
public class RoleDaoImpl implements RoleDao {

    private final JdbcTemplate jdbcTemplate;

    public RoleDaoImpl(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    public boolean createRole(RoleDto roleDto) {

        String sql = "INSERT INTO role (name) VALUES (?)";
        return jdbcTemplate.update(sql, roleDto.getName()) > 0;
    }

    @Override
    public List<RoleDto> getAllRoles() {

        String sql = "SELECT id, name FROM role";
        return jdbcTemplate.query(sql,
                new BeanPropertyRowMapper<>(RoleDto.class));
    }

    @Override
    public RoleDto getRoleById(Long id) {

        String sql = "SELECT id, name FROM role WHERE id = ?";
        return jdbcTemplate.queryForObject(
                sql,
                new BeanPropertyRowMapper<>(RoleDto.class),
                id
        );
    }

    @Override
    public boolean updateRole(RoleDto roleDto) {

        String sql = "UPDATE role SET name = ? WHERE id = ?";
        return jdbcTemplate.update(
                sql,
                roleDto.getName(),
                roleDto.getId()
        ) > 0;
    }

    @Override
    public void deleteRole(Long id) {

        String sql = "DELETE FROM role WHERE id = ?";
        jdbcTemplate.update(sql, id);
    }

    @Override
    public boolean roleExistsByName(String name) {

        String sql = "SELECT COUNT(*) FROM role WHERE name = ?";
        Integer count = jdbcTemplate.queryForObject(sql, Integer.class, name);
        return count != null && count > 0;
    }

    @Override
    public boolean roleExistsByNameAndIdNot(String name, Long id) {

        String sql = "SELECT COUNT(*) FROM role WHERE name = ? AND id <> ?";
        Integer count = jdbcTemplate.queryForObject(sql, Integer.class, name, id);
        return count != null && count > 0;
    }
}