package com.ust.pos.dao.impl;

import com.ust.pos.dao.UserDao;
import com.ust.pos.dto.UserDto;
import com.ust.pos.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
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
    public List<User> findAll() {
        return List.of();
    }

    @Override
    public User findById(Long id) {
        return null;
    }

    @Override
    public void deleteById(Long id) {

    }

    @Override
    public User updateById(UserDto userDto) {
        return null;
    }

    @Override
    public User createUser(UserDto userDto) {
        return null;
    }

    @Override
    public void createUserJdbc(UserDto userDto) {
        String sql = "INSERT INTO user VALUES(?,?,?,?,?,?,?,?)";
        String encodedPassword=passwordEncoder.encode(userDto.getPassword());
        jdbcTemplate.update(sql,userDto.getId(), userDto.getAge(), userDto.getDateOfBirth(), userDto.getEmail(),userDto.getName(),encodedPassword,userDto.getPhoneNo(),userDto.getUserName());
    }

    @Override
    public User findByEmail(String email) {
        String sql = "SELECT * FROM user WHERE email = ?";
        List<User> userList = jdbcTemplate.query(
            sql,
            new Object[]{email},
            new BeanPropertyRowMapper<>(User.class));

        return userList.isEmpty()?null:userList.get(0);

    }

    @Override
    public List<User> verifyUserAge() {
        return List.of();
    }

    @Override
    public User findByEmailManually(String email) {
        return null;
    }

    @Override
    public List<User> findByPhoneNumber(String phoneNumber) {
        return List.of();
    }
}
