package com.ust.pos.dao.impl;

import com.ust.pos.dao.UserDao;
import com.ust.pos.dto.UserDto;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class UserDaoImpl implements UserDao {

    private final JdbcTemplate jdbcTemplate;

    public UserDaoImpl(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    public boolean createUser(UserDto userDto) {

        String sql = """
                    INSERT INTO user (age, email, name, phone_no, password)
                    VALUES (?, ?, ?, ?, ?)
                """;

        int rowsInserted = jdbcTemplate.update(
                sql,
                userDto.getAge(),
                userDto.getEmail(),
                userDto.getName(),
                userDto.getPhoneNo(),
                userDto.getPassword()
        );

        return rowsInserted > 0;
    }

    @Override
    public boolean emailExists(String email) {

        String sql = "SELECT COUNT(*) FROM user WHERE email = ?";

        Integer count = jdbcTemplate.queryForObject(
                sql,
                Integer.class,
                email
        );

        return count != null && count > 0;
    }
}