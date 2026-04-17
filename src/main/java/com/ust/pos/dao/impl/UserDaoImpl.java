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
    public boolean UpdateByUserName(UserDto userDto) {
        return false;
    }

    @Override
    public boolean registerJdbc(UserDto userDto) {
        //  String sql="INSERT INTO user VALUES(?,?,?,?,?,?,?)";
        String encodedPass = passwordEncoder.encode(userDto.getPassword());
        String sqlQ = "INSERT INTO user SET age=?,email=?,name=?,password=?,phone_no=?";
        int count = jdbcTemplate.update(sqlQ, userDto.getAge(), userDto.getEmail(), userDto.getName(), encodedPass, userDto.getPhoneNo());
        if (count > 0) {
            return true;
        } else {
            return false;
        }
    }

    @Override
    public boolean existsByEmail(String email) {
        return false;
    }

    public User existsByEmailJdbc(String email) {
        String sqlQ = "SELECT*FROM user WHERE email=?";
        List<User> userList = jdbcTemplate.query(
                sqlQ,
                new Object[]{email},
                new BeanPropertyRowMapper(User.class));

        return userList.isEmpty() ? null : userList.get(0);
    }

    @Override
    public List<User> userRecJdbc() {
        String sqlQ = "SELECT * FROM user";
        return jdbcTemplate.query(
                sqlQ,
                new BeanPropertyRowMapper(User.class));

    }

    @Override
    public boolean deleteByEmailJdbc(String email) {
        String sqlQ = "DELETE FROM user WHERE email = ?";
        int num = jdbcTemplate.update(sqlQ, email);
        return num > 0;
    }

    @Override
    public User findByEmail(String email) {
        String sqlQ = "SELECT*FROM user WHERE email=?";
        List<User> userList = jdbcTemplate.query(
                sqlQ,
                new Object[]{email},
                new BeanPropertyRowMapper(User.class));

        return userList.isEmpty() ? null : userList.getFirst();
    }

    @Override
    public User findByIdJdbc(long id) {
        String sqlQ = "SELECT*FROM user WHERE id=?";
        List<User> userList = jdbcTemplate.query(
                sqlQ,
                new Object[]{id},
                new BeanPropertyRowMapper(User.class));

        return userList.isEmpty() ? null : userList.getFirst();

    }

    @Override
    public boolean updateByIdd(UserDto userDto) {
        String encodedPass = passwordEncoder.encode(userDto.getPassword());
        String sqlQ = "Update user SET age=?,email=?,name=?,password=?,phone_no=?WHERE id=?";
        int count = jdbcTemplate.update(sqlQ, userDto.getAge(), userDto.getEmail(), userDto.getName(), encodedPass, userDto.getPhoneNo(), userDto.getId());
        if (count > 0) {
            return true;
        } else {
            return false;
        }
    }
}