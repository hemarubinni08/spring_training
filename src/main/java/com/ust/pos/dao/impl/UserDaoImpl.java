package com.ust.pos.dao.impl;

import com.ust.pos.dao.UserDao;
import com.ust.pos.dto.UserDto;
import com.ust.pos.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class UserDaoImpl implements UserDao {

    @Autowired
    JdbcTemplate jdbcTemplate;
    @Autowired
    private PasswordEncoder passwordEncoder;

    @Override
    public boolean register(UserDto userDto) {
        String sql = "INSERT INTO user VALUES(?,?,?,?,?,?)";
        String encodedPass = passwordEncoder.encode(userDto.getPassword());
        String sqlQ = "INSERT INTO user SET  age=?,email=?,name=?,password=?,phone_no=?";
        jdbcTemplate.update(sqlQ, userDto.getAge(), userDto.getEmail(), userDto.getName(), encodedPass, userDto.getPhoneNo());
        return false;
    }

    @Override
    public boolean registerJdbc(UserDto userDto) {

        String sql = "INSERT INTO user VALUES(?,?,?,?,?,?)";
        String encodedPass = passwordEncoder.encode(userDto.getPassword());
        String sqlQ = "INSERT INTO user SET  age=?,email=?,name=?,password=?,phone_no=?";
        jdbcTemplate.update(sqlQ, userDto.getAge(), userDto.getEmail(), userDto.getName(), encodedPass, userDto.getPhoneNo());
        return false;
    }

    @Override
    public boolean existsByEmail(String email) {

        String salQ = "SELECT * FROM user WHERE email = ?";
        List<User> userList = jdbcTemplate.query(
                salQ,
                new Object[]{email},
                new BeanPropertyRowMapper<>(User.class)
        );
        return !userList.isEmpty();
    }
}