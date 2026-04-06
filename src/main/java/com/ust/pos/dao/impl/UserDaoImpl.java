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
    public boolean save(UserDto userDto) {
        //String s1 = "insert into user values(?,?,?,?,?,?,?,?)";
        String encodePass = passwordEncoder.encode(userDto.getPassword());
        String sqlQ = "insert into user set age = ? , email = ? , name = ? , phone_no = ? , password = ?";
        jdbcTemplate.update(sqlQ, userDto.getAge(), userDto.getEmail(), userDto.getName(), userDto.getPhoneNo(), encodePass);
        return false;
    }

    @Override
    public User fundByEmail(String email) {
        String s1 = "select * from user where email = ?" ;
        String s2 = "select Count(*) from user where email = ?" ;
        Integer count  = jdbcTemplate.queryForObject(s2, Integer.class,email);
        List<User> user = jdbcTemplate.query(s1 , new  Object[]{email} , new BeanPropertyRowMapper(User.class));
        return user.isEmpty()?null : user.get(0);
    }
}