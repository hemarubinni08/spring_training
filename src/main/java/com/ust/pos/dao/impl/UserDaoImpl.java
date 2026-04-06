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
    private PasswordEncoder passwordEncoder;


    @Override
    public boolean saveUser(UserDto userDto) {
        String sql = ("INSERT INTO user VALUES(? ? ? )");
        String encodedPass = passwordEncoder.encode(userDto.getPassword());
        String sqlQ = ("INSERT INTO user SET id = ?, age = ?,email = ? ");
        jdbcTemplate.update(sqlQ,
                userDto.getAge(), userDto.getEmail(), userDto.getUserName(),
                userDto.getPassword(), userDto.getPhoneNo(), userDto.getDateOfBirth());
        return false;
    }

    @Override
    public User findByEmail(String email) {

        String sqlQ = "SELECT * FROM USER WHERE email = ?";
        List<User> userList = jdbcTemplate.query(
                sqlQ,
                new Object[]{email},
                new BeanPropertyRowMapper(User.class));

        return userList.isEmpty() ? null : userList.get(0);
    }
}
