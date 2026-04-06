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
    public boolean save(UserDto userDto) {
        String encodedPassword = passwordEncoder.encode(userDto.getPassword());
        String sqlQuery = "INSERT INTO USER SET age = ?, email=?, name = ?, password=?, phone_no=?, user_name=?";
        int count = jdbcTemplate.update(sqlQuery, userDto.getAge(), userDto.getEmail(), userDto.getName(), encodedPassword, userDto.getPhoneNo(), userDto.getUserName());
        if (count > 0) {
            return true;
        } else {
            return false;
        }
    }

    @Override
    public User findByEmail(String email) {
        String sqlQuery = "SELECT * FROM user WHERE email=?";
        List<User> userList = jdbcTemplate.query(
                sqlQuery,
                new Object[]{email},
                new BeanPropertyRowMapper(User.class));
        return userList.isEmpty() ? null : userList.get(0);
    }
}