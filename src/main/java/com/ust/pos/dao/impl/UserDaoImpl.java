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
    public User findByEmailCustom(String email) {
        String sq1 = "SELECT * FROM user WHERE email=?";
        List<User> userList = jdbcTemplate.query(
                sq1,
                new Object[]{email},
                new BeanPropertyRowMapper<>(User.class));
        return userList.isEmpty() ? null : userList.get(0);
    }

    @Override
    public User findByUserName(String userName) {
        return null;
    }

    @Override
    public List<User> findAllUsers() {
        return List.of();
    }

    @Override
    public void deleteById(Long id) {

    }

    @Override
    public boolean update(UserDto userDto) {
        String sq1 = "INSERT INTO user VALUES(?,?,?,?,?,?,?,?)";
        String encodePass = passwordEncoder.encode(userDto.getPassword());
        //String sqlQ = "INSERT INTO user SET age = ?, date_of_birth = ?, email = ?, name = ?, password = ?, phone_no = ?, user_name =?";
        jdbcTemplate.update(sq1, userDto.getId(), userDto.getAge(), userDto.getDateOfBirth(), userDto.getEmail(), userDto.getName(), encodePass, userDto.getPhoneNo(), userDto.getUserName());

        return false;
    }

    @Override
    public boolean login(String email, String password) {
        return false;
    }
}
