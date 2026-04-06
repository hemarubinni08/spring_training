package com.ust.pos.dao.impl;

import com.ust.pos.dao.UserDao;
import com.ust.pos.dto.UserDto;
import com.ust.pos.model.User;
import org.springframework.beans.factory.annotation.Autowired;
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
    public User findByUserName(String username) {
        return null;
    }

    @Override
    public User update(Long id, UserDto userDto) {
        return null;
    }

    @Override
    public void deleteById(Long id) {

    }

    @Override
    public boolean registerjdbc(UserDto userDto) {
        //String sql = "insert into user values(?,?,?,?)";
        String sqlQ="insert into user set name=?,user_name=?,password=?,email=?,age=?";
        String encodePassword = passwordEncoder.encode(userDto.getPassword());

        jdbcTemplate.update(sqlQ,userDto.getName(),userDto.getUserName(),encodePassword,userDto.getEmail(),userDto.getAge());
        return false;
    }
}
