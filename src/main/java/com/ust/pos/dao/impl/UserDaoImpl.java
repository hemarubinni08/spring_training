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
    public boolean saveAUser(UserDto userDto) {

        String sql = "INSERT INTO users VALUES(?,?,?,?,?,?,?,?)";
        String encodePass = passwordEncoder.encode(userDto.getPassword());

        jdbcTemplate.update(sql,
                userDto.getAge(), encodePass, userDto.getEmail(),
                userDto.getName(), userDto.getPhoneNo());

        return true;
    }

    @Override
    public boolean existsByEmail(String email) {

        String sql = "SELECT * FROM users WHERE email = ?";

        List<String> userlist = jdbcTemplate.query(
                sql,
                new Object[]{email},
                new BeanPropertyRowMapper(User.class)
        );

        return !userlist.isEmpty();
    }
}
