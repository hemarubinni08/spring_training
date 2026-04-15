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
        String sq1 = "INSERT INTO user VALUES (?,?,?,?,?,?,?,?)";
        String encodedPass = passwordEncoder.encode(userDto.getPassword());
//        String sqlQ = "INSERT INTO user SET age = ?, email = ?";
        return jdbcTemplate.update(sq1, null, userDto.getAge(), userDto.getDateOfBirth(), userDto.getEmail(),
                userDto.getName(), encodedPass, userDto.getPhoneNo(), userDto.getUserName()) > 0;
    }

    @Override
    public User findByEmail(String email) {
        String sq1 = "SELECT * FROM user WHERE email = ?";
        List<User> userList = jdbcTemplate.query(sq1, new BeanPropertyRowMapper<>(User.class), email);
        return userList.isEmpty() ? null : userList.getFirst();
    }

    @Override
    public User findById(long id) {
        String sq1 = "SELECT * FROM user WHERE id = ?";
        List<User> userList = jdbcTemplate.query(sq1, new BeanPropertyRowMapper<>(User.class), id);
        return userList.isEmpty() ? null : userList.getFirst();
    }

    @Override
    public List<User> getAllUsers() {
        String sql = "SELECT * FROM USER";
        return jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(User.class));
    }

    @Override
    public boolean updateUserDetails(UserDto userDto) {
        String sql = "UPDATE user SET age = ?, date_of_birth = ?, email = ?, name = ?, phone_no = ?, user_name = ? "
                + "WHERE id = ?";
        int count = jdbcTemplate.update(sql, userDto.getAge(), userDto.getDateOfBirth(), userDto.getEmail(),
                userDto.getName(), userDto.getPhoneNo(), userDto.getUserName(), userDto.getId());
        return count > 0;
    }

    @Override
    public void deleteByEmail(String email) {
        String sql = "DELETE from USER where EMAIL = ?";
        jdbcTemplate.update(sql, email);
    }
}

