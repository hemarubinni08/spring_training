package com.ust.pos.dao.impl;

import com.ust.pos.dao.UserDao;
import com.ust.pos.dto.UserDto;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

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

    @Override
    public List<UserDto> getUsers() {


        String sql = "SELECT * FROM user";


        return jdbcTemplate.query(
                sql,
                new BeanPropertyRowMapper<>(UserDto.class)
        );


    }

    @Override
    public UserDto getUserByEmail(String email) {

        String sql = """
                    SELECT
                        id,
                        name,
                        email,
                        phone_no AS phoneNo,
                        user_name AS username
                    FROM user
                    WHERE email = ?
                """;

        return jdbcTemplate.queryForObject(
                sql,
                new BeanPropertyRowMapper<>(UserDto.class),
                email
        );
    }

    @Override
    public void deleteUserByEmail(String email) {

        String sql = "DELETE FROM user WHERE email = ?";

        jdbcTemplate.update(sql, email);

    }


    @Override
    public UserDto getUserByIdJdbc(Long id) {

        String sql = """
                SELECT
                    id,
                    name,
                    email,
                    phone_no AS phoneNo,
                    user_name AS username
                FROM user
                WHERE id = ?
                """;

        return jdbcTemplate.queryForObject(
                sql,
                new BeanPropertyRowMapper<>(UserDto.class),
                id
        );
    }


    @Override
    public UserDto updateUserJdbc(UserDto userDto) {

        String sql = """
                UPDATE user
                SET
                    name = ?,
                    email = ?,
                    phone_no = ?,
                    user_name = ?
                WHERE id = ?
                """;



        int rows = jdbcTemplate.update(
                sql,
                userDto.getName(),
                userDto.getEmail(),
                userDto.getPhoneNo(),
                userDto.getUserName(),
                userDto.getId()
        );

        if (rows == 0) {
            throw new RuntimeException("Update failed");
        }


        return getUserByIdJdbc(userDto.getId());    }

    @Override
    public boolean emailExistsForAnotherUser(String email, Long userId) {

        String sql = """
                SELECT COUNT(*)
                FROM user
                WHERE email = ?
                  AND id <> ?
                """;

        Integer count = jdbcTemplate.queryForObject(
                sql,
                Integer.class,
                email,
                userId
        );

        return count != null && count > 0;
    }


}