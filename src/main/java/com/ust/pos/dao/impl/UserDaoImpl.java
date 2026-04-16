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
    public void createUserJdbc(UserDto userDto) {
        String sql = "INSERT INTO user VALUES(?,?,?,?,?,?,?,?)";
        jdbcTemplate.update(sql, userDto.getId(), userDto.getAge(), userDto.getDateOfBirth(), userDto.getEmail(), userDto.getName(), userDto.getPassword(), userDto.getPhoneNo(), userDto.getUserName());
    }

    @Override
    public User findByEmail(String email) {
        String sql = "SELECT * FROM user WHERE email = ?";
        List<User> userList = jdbcTemplate.query(
                sql,
                new Object[]{email},
                new BeanPropertyRowMapper<>(User.class));

        return userList.isEmpty() ? null : userList.get(0);

    }

    @Override
    public List<User> findAllUsersJdbc() {
        String sql = "SELECT * FROM user";
        return jdbcTemplate.query(
                sql,
                new BeanPropertyRowMapper<>(User.class));
    }

    @Override
    public User findById(Long id) {
        String sql = "SELECT * FROM user WHERE id = ?";
        List<User> userList = jdbcTemplate.query(
                sql,
                new Object[]{id},
                new BeanPropertyRowMapper<>(User.class));

        return userList.isEmpty() ? null : userList.get(0);
    }
}
