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
    public Boolean saveData(UserDto userDto) {
        String encodePass = passwordEncoder.encode(userDto.getPassword());
        String sqlQ = "INSERT INTO user SET age = ?, email = ?, name = ?, password = ?,phone_no = ?";
        int count = jdbcTemplate.update(sqlQ, userDto.getAge(), userDto.getEmail(), userDto.getName(), encodePass, userDto.getPassword(), userDto.getPhoneNo());
        if (count > 0) {
            return true;
        } else {
            return false;
        }
    }

    @Override
    public List<User> findByEmailOrName(String email, String name) {
        String sqlQuery = "SELECT * FROM user WHERE email = ? and name = ?";
        List<User> userList = jdbcTemplate.query(sqlQuery, new Object[]{email, name}, new BeanPropertyRowMapper<>(User.class));
        return userList.isEmpty() ? null : userList;
    }

    @Override
    public List<User> findAllUsers() {
        String query1 = "SELECT * FROM user";
        List<User> listOfUsers = jdbcTemplate.query(query1, new BeanPropertyRowMapper<>(User.class));
        return listOfUsers;
    }

    @Override
    public User findByEmail(String email) {
        String query2 = "SELECT * FROM user WHERE email = ? ";
        User user = jdbcTemplate.queryForObject(query2, new Object[]{email}, new BeanPropertyRowMapper<>(User.class));
        return user;
    }

    @Override
    public User findById(long id) {
        String query2 = "SELECT * FROM user WHERE id = ? ";
        User user = jdbcTemplate.queryForObject(query2, new Object[]{id}, new BeanPropertyRowMapper<>(User.class));
        return user;
    }

    @Override
    public User updateUser(User user) {
        String sqlQ = "UPDATE user SET email = ?, name = ?,phone_no = ? WHERE id = ?";
        jdbcTemplate.update(sqlQ, user.getEmail(), user.getName(), user.getPhoneNo(), user.getId());
        return user;
    }
}