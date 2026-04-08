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
import java.util.Optional;

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
        //String s2 = "select Count(*) from user where email = ?" ;
        //Integer count  = jdbcTemplate.queryForObject(s2, Integer.class,email);
        List<User> user = jdbcTemplate.query(s1 , new  Object[]{email} , new BeanPropertyRowMapper<>(User.class));
        return user.isEmpty()?null : user.get(0);
    }

    @Override
    public List<User> getData() {
        String s1 = "select * from user";
        List<User> user = jdbcTemplate.query(s1,new BeanPropertyRowMapper<>(User.class));
        return user;
    }

    @Override
    public void deleteUserJdbc(String email) {
        String s1 = "delete from user where email = ?";
        jdbcTemplate.update(s1,email);
    }

    @Override
    public User findById(Long id) {
        String s1 = "select * from user where id=?";
        List<User> user= jdbcTemplate.query(s1 , new  Object[]{id} , new BeanPropertyRowMapper<>(User.class));
        return user.get(0);
    }

    @Override
    public User updateUserJdbc(User user) {
        String s1 = "update user set  name = ?,email = ?, phone_no = ?  where id = ?";
        jdbcTemplate.update(s1,user.getName(),user.getEmail(),user.getPhoneNo(),user.getId());
        return user;
    }
}