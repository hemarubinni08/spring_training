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
    public void update(UserDto userDto) {
        String sq1 = "INSERT INTO USER VALUES (?,?,?,?,?,?,?,?)";
        String encodedPass = passwordEncoder.encode(userDto.getPassword());
        jdbcTemplate.update(sq1, null, userDto.getAge(), " ", userDto.getEmail(),
                userDto.getName(), encodedPass, userDto.getPhoneNo(), userDto.getUserName());
    }

    @Override
    public User findByEmail(String email) {
        String sq1 = "SELECT * FROM user WHERE EMAIL = ?";
        List<User> userList = jdbcTemplate.query(sq1, new Object[]{email},
                new BeanPropertyRowMapper(User.class));
        return userList.isEmpty() ? null : userList.get(0);
    }
}