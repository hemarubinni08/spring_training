package com.ust.pos.dao.impl;

import com.ust.pos.dao.UserDao;
import com.ust.pos.dto.UserDto;
import com.ust.pos.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;

import java.util.Collections;
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
        String sqlQ = "INSERT INTO user SET age=?,email=?, name=?,password=?,phone_no=?";
        int count = jdbcTemplate.update(sqlQ, userDto.getAge(), null, userDto.getEmail(), userDto.getName(), userDto.getPassword(), userDto.getPhoneNo());
        if (count > 0) {
            return true;
        }
        return false;
    }

    @Override
    public User update(User user) {
        String sql2 = "UPDATE user SET age=?,email=?,name = ?, phone_no = ? , user_name= ? where id=?";
        jdbcTemplate.update(sql2, user.getAge(), user.getEmail(), user.getName(), user.getPhoneNo(), user.getUserName(), user.getId());
        return user;
    }

    @Override
    public User findByEmail(String email) {
        String sqlQ = "SELECT * FROM user WHERE email=?";
        List<User> userList = jdbcTemplate.query(
                sqlQ,
                new Object[]{email},
                new BeanPropertyRowMapper(User.class));
        return userList.isEmpty() ? null : userList.get(0);
    }

    @Override
    public User findById(Long id) {
        String s1 = "Select * from user where id=?";
        List<User> userList = jdbcTemplate.query(
                s1,
                new Object[]{id},
                new BeanPropertyRowMapper(User.class));
        return userList.isEmpty() ? null : userList.get(0);
    }

    @Override
    public List<User> findAllUsers() {
        String sql1 = "SELECT * FROM user";
        return List.of();
    }

    @Override
    public void deleteUserByEmail(String email) {
        String sql2 = "DELETE FROM user WHERE email=?";
        jdbcTemplate.update(sql2, email);
    }
}
