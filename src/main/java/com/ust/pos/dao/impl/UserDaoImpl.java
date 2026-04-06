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
    PasswordEncoder passwordEncoder;

    @Override
    public void registerUsingJdbc(UserDto userDto) {

        String encodedPass = passwordEncoder.encode(userDto.getPassword());
        System.out.println("Encoded password: " + encodedPass);
        String sql = "INSERT INTO user " +
                "(age, date_of_birth, email, name, password, phone_no, user_name) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?)";
        jdbcTemplate.update(sql,
                userDto.getAge(),
                userDto.getDateOfBirth(),
                userDto.getEmail(),
                userDto.getName(),
                encodedPass,
                userDto.getPhoneNo(),
                userDto.getUserName()
        );
        System.out.println("JDBC INSERT success: " + userDto.getEmail());
    }

    @Override
    public User findEmail(String email) {

        String sql = "SELECT * FROM user WHERE email = ?";
        List<User> userList = jdbcTemplate.query(sql, new Object[]{email}, new BeanPropertyRowMapper(User.class));
        return userList.isEmpty() ? null : userList.get(0);
    }
}