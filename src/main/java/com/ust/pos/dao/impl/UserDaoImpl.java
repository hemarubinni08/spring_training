package com.ust.pos.dao.impl;

import com.ust.pos.dao.UserDao;
import com.ust.pos.dto.UserDto;
import com.ust.pos.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class UserDaoImpl implements UserDao {
    @Autowired
    JdbcTemplate jdbcTemplate;

    @Autowired
    PasswordEncoder passwordEncoder;

    @Override
    public boolean saveData(UserDto userDto) {
        String sql = "INSERT INTO user VALUES(?,?,?)";
        String encodePass = passwordEncoder.encode(userDto.getPassword());
        String sqlQ = "INSERT INTO user SET name = ? , email = ? , password = ?";
        jdbcTemplate.update(sqlQ, userDto.getName(), userDto.getEmail(), userDto.getPassword());
        return false;
    }

    @Override
    public User findByEmail(String email) {
        String salQ = "SELECT * FROM user WHERE email = ?";
        List<User> userList = jdbcTemplate.query(
                salQ,
                new Object[]{email},
                new BeanPropertyRowMapper(User.class));
        return userList.isEmpty() ? null : userList.get(0);
    }

    @Override
    public List<UserDto> fetchUser() {
        String sql = "SELECT user_name, email, password FROM user";
        return jdbcTemplate.query(
                sql,
                new BeanPropertyRowMapper<>(UserDto.class)
        );
    }

    @Override
    public void deleteByEmail(String email) {
        String s1 = "DELETE FROM user WHERE email = ?";
        jdbcTemplate.update(s1, email);
    }

    @Override
    public User findByIdJdbc(Long id) {
        String salQ = "SELECT * FROM user WHERE id = ?";
        List<User> userList = jdbcTemplate.query(
                salQ,
                new Object[]{id},
                new BeanPropertyRowMapper(User.class));
        return userList.isEmpty() ? null : userList.get(0);
    }
}
