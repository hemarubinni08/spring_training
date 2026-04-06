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
    public boolean registerjdbc(UserDto userDto) {
        //String sql = "insert into user values(?,?,?,?)";
        //no need to do it twice once is enough
//        if(findByEmail(userDto.getEmail())==null){
//            return false;
//        }
        String sqlQ = "insert into user set name=?,user_name=?,password=?,email=?,age=?";
        String encodePassword = passwordEncoder.encode(userDto.getPassword());

        jdbcTemplate.update(sqlQ, userDto.getName(), userDto.getUserName(), encodePassword, userDto.getEmail(), userDto.getAge());
        return true;
    }

    public User findByEmail(String email) {
        String sqlQ = "select * from user where email=?";
        List<User> userList = jdbcTemplate.query(
                sqlQ, new Object[]{email}, new BeanPropertyRowMapper(User.class));
        // return jdbcTemplate.queryForObject(sqlQ,User.class,email);
        return userList.isEmpty() ? null : userList.get(0);
    }
}
