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
    public boolean register(UserDto userDto) {
        String encodedPass = passwordEncoder.encode(userDto.getPassword());
        String sqlQ = "insert into user set age=?,date_of_birth=?,email=?,name=?,password=?,phone_no=?,user_name=?";
        jdbcTemplate.update(sqlQ, userDto.getAge(), userDto.getDateOfBirth(), userDto.getEmail(), userDto.getName(), encodedPass, userDto.getPhoneNo(), userDto.getUserName());
        return true;
    }

    @Override
    public User findByEmail(String email) {
        String sqlQ = "select * from user where email=?";
        List<User> users = jdbcTemplate.query(sqlQ, new Object[]{email},
                new BeanPropertyRowMapper<>(User.class)
        );
        return users.isEmpty() ? null : users.get(0);
    }
}
