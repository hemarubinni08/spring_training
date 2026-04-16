package com.ust.pos.dao;

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
        String encodedPass = passwordEncoder.encode(userDto.getPassword());
        String sqlQ = "INSERT INTO user SET age=?, email=?, name=?, password=?, phone_no=?";
        int count = jdbcTemplate.update(sqlQ, userDto.getAge(), userDto.getEmail(), userDto.getName(), encodedPass, userDto.getPhoneNo());
        if (count > 0) {
            return true;
        }
        return false;
    }

    @Override
    public User findByEmail(String email) {
        String sql = "SELECT * FROM user WHERE email=?";
        List<User> userList = jdbcTemplate.query(
                sql,
                new Object[]{email},
                new BeanPropertyRowMapper<>(User.class)
        );
        return userList.isEmpty() ? null : userList.get(0);
    }

    @Override
    public User findById(long id) {
        String sql = "SELECT * FROM user WHERE id=?";
        List<User> userList = jdbcTemplate.query(
                sql,
                new Object[]{id},
                new BeanPropertyRowMapper<>(User.class)
        );
        return userList.isEmpty() ? null : userList.get(0);
    }

    @Override
    public List<User> listOfUsers() {
        String sqlQ = "SELECT * FROM user";
        return jdbcTemplate.query(
                sqlQ,
                new BeanPropertyRowMapper<>(User.class));
    }

    @Override
    public boolean updateUser(UserDto userDto) {
        String encodedPass = passwordEncoder.encode(userDto.getPassword());
        String sqlUpdate = "UPDATE user SET age=?, email=?, name=?, password=?, phone_no=? WHERE id=?";
        int count = jdbcTemplate.update(sqlUpdate, userDto.getAge(), userDto.getEmail(), userDto.getName(), encodedPass, userDto.getPhoneNo(), userDto.getId());
        if (count > 0) {
            return true;
        }
        return false;
    }

    @Override
    public void deleteByEmail(String email) {
        String sq12 = "DELETE FROM user WHERE email=?";
        jdbcTemplate.update(sq12, email);
    }
}
