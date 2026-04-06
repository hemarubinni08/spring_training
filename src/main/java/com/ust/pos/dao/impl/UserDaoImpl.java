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
    public boolean createUser(UserDto userDto) {
//      String sq1 = "INSERT INTO user VALUES(?,?,?,?,?,?)";
        String encodedPass = passwordEncoder.encode(userDto.getPassword());
        String sqlQ = "INSERT INTO user SET age = ? , email = ? , name = ? , password = ? , phone_no = ?";
        int count = jdbcTemplate.update(sqlQ, userDto.getAge(), userDto.getEmail(), userDto.getName(), encodedPass, userDto.getPhoneNo());
        if (count > 0) {
            return true;
        }
        return false;
    }

    @Override
    public User findByEmail(String email) {
        String sqlQ = "SELECT * FROM user WHERE email = ?";
        List<User> userList = jdbcTemplate.query(
                sqlQ,
                new Object[]{email},
                new BeanPropertyRowMapper(User.class));
        return userList.isEmpty() ? null : userList.get(0);
    }
}
