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
    public boolean register(UserDto userDto) {

        String sql = """
                INSERT INTO user
                (username, full_name, age, email, password, phone_no, date_of_birth)
                VALUES (?, ?, ?, ?, ?, ?, ?)
                """;

        String encodedPass = passwordEncoder.encode(userDto.getPassword());

        int count = jdbcTemplate.update(
                sql,
                userDto.getUsername(),
                userDto.getFullName(),
                userDto.getAge(),
                userDto.getEmail(),
                encodedPass,
                userDto.getPhoneNumber(),
                userDto.getDateOfBirth()
        );

        return count > 0;
    }

    @Override
    public User findByEmail(String email) {
        String sqlQ = "SELECT * FROM user where email=?";
        List<User> userList = jdbcTemplate.query(sqlQ, new Object[]{email}, new BeanPropertyRowMapper(User.class));
        return userList.isEmpty() ? null : userList.get(0);
    }
}
