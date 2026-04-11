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
    private PasswordEncoder passwordEncoder;

    @Override
    public void register(UserDto userDto) {
        String sql = "INSERT INTO user VALUES(?,?,?,?,?,?)";
        String encodedPass = passwordEncoder.encode(userDto.getPassword());
        String sqlQ = "INSERT INTO user SET  age=?,email=?,name=?,password=?,phone_no=?";
        jdbcTemplate.update(sqlQ, userDto.getAge(), userDto.getEmail(), userDto.getName(), encodedPass, userDto.getPhoneNo());

    }

    @Override
    public void registerJdbc(UserDto userDto) {
        String sql = "INSERT INTO user VALUES(?,?,?,?,?,?)";
        String encodedPass = passwordEncoder.encode(userDto.getPassword());
        String sqlQ = "INSERT INTO user SET  age=?,email=?,name=?,password=?,phone_no=?";
        jdbcTemplate.update(sqlQ, userDto.getAge(), userDto.getEmail(), userDto.getName(), encodedPass, userDto.getPhoneNo());

    }

    public User findByEmail(String email) {
        String sqlQ = "SELECT * FROM user WHERE email=?";
        List<User> userList = jdbcTemplate.query(sqlQ,
                new Object[]{email},
                new BeanPropertyRowMapper(User.class));

        return userList.isEmpty() ? null : userList.get(0);
    }

    public List<User> findAll() {
        String sqlQ = "SELECT * FROM user";
        List<User> userList = jdbcTemplate.query(sqlQ, new BeanPropertyRowMapper<>(User.class));
        return userList;
    }

    @Override
    public void deleteByEmail(String email) {
        String sql = "DELETE FROM user WHERE email = ?";
        jdbcTemplate.update(sql, email);
    }

    @Override
    public User findById(Long id) {
        String sqlQ = "SELECT * FROM user WHERE id=?";
        List<User> userList = jdbcTemplate.query(sqlQ,
                new Object[]{id},
                new BeanPropertyRowMapper(User.class));

        return userList.isEmpty() ? null : userList.get(0);
    }

}
