package com.ust.pos.dao.impl;

import com.ust.pos.dao.UserDao;
import com.ust.pos.dto.UserDto;
import com.ust.pos.model.User;
import com.ust.pos.model.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class UserDaoImpl implements UserDao {
    @Autowired
    UserRepository userRepository;

    @Autowired
    JdbcTemplate jdbcTemplate;

    @Autowired
    PasswordEncoder passwordEncoder;

    @Override
    public boolean createUserJdbc(UserDto userDto) {
        String encodedPass = passwordEncoder.encode(userDto.getPassword());
        String sql0 = "INSERT INTO user SET age=?, email=?, name=?, password=?, phone_no=?, user_name=?";
        jdbcTemplate.update(sql0, userDto.getAge(), userDto.getEmail(), userDto.getName(), encodedPass, userDto.getPhoneNo(), userDto.getUserName());
        return false;
    }

    @Override
    public User findByEmail(String email) {
        String sql = "SELECT * FROM user WHERE email=?";
        List<User> userList = jdbcTemplate.query(sql, new Object[]{email}, new BeanPropertyRowMapper(User.class));
        return userList.isEmpty() ? null : userList.get(0);
    }

    @Override
    public User findById(long id) {
        String sql = "SELECT * FROM user WHERE id = ?";
        List<User> userList = jdbcTemplate.query(sql, new Object[]{id}, new BeanPropertyRowMapper<>(User.class));
        return userList.isEmpty() ? null : userList.get(0);
    }

    @Override
    public List<User> findAll() {
        String sql = "SELECT * FROM user";
        List<User> userList = jdbcTemplate.query(sql, new BeanPropertyRowMapper(User.class));
        return userList.isEmpty() ? null : userList;
    }

    @Override
    public void deleteByEmail(String email) {
        String deleteSql = "DELETE FROM user WHERE user=?";
        jdbcTemplate.update(deleteSql, new Object[]{email});
    }

    @Override
    public void updateById(UserDto userDto) {
        String updateSql = "UPDATE user SET name=?, age=?, email=?, phone_no=? WHERE id = ?";
        jdbcTemplate.update(updateSql, userDto.getName(), userDto.getAge(), userDto.getEmail(), userDto.getPhoneNo(), userDto.getId());
    }
}
