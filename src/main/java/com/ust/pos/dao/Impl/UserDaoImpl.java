package com.ust.pos.dao.Impl;

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
    public User findByEmail(String email) {
        String sqlquery = "SELECT * FROM user WHERE email=?";
        List<User> userList = jdbcTemplate.query(sqlquery, new Object[]{email}, new BeanPropertyRowMapper(User.class));
        return userList.isEmpty() ? null : userList.get(0);
    }

    @Override
    public List<User> displayUser() {
        String query = "SELECT * FROM user";
        List<User> userList = jdbcTemplate.query(query, new BeanPropertyRowMapper(User.class));
        return userList;
    }

    @Override
    public User findById(long id) {
        String query = "SELECT * FROM user WHERE id=?";
        List<User> userList = jdbcTemplate.query(query, new Object[]{id}, new BeanPropertyRowMapper(User.class));
        return userList.get(0);
    }

    @Override
    public boolean update(UserDto userDto) {
        //String sql = "INSERT INTO user VALUES(?,?,?,?,?,?,?)";
        String encodePassword = passwordEncoder.encode(userDto.getPassword());
        String sqlQ = "INSERT INTO user SET age = ?, date_of_birth = ?, email = ?, name = ?, password = ?, phone_no = ?, user_name = ?";
        int count = jdbcTemplate.update(sqlQ, userDto.getAge(), null, userDto.getEmail(), userDto.getName(), encodePassword, userDto.getPhoneNo(), userDto.getUserName());
        if (count > 0) {
            return true;
        } else {
            return false;
        }
    }

    @Override
    public boolean updateprofileJDBC(UserDto userDto) {
        //String sql = "INSERT INTO user VALUES(?,?,?,?,?,?,?)";
        String encodePassword = passwordEncoder.encode(userDto.getPassword());
        String sqlQ = "UPDATE user SET age = ?, date_of_birth = ?, email = ?, name = ?, password = ?, phone_no = ?, user_name = ? where id=?";
        int count = jdbcTemplate.update(sqlQ, userDto.getAge(), null, userDto.getEmail(), userDto.getName(), encodePassword, userDto.getPhoneNo(), userDto.getUserName(), userDto.getId());
        if (count > 0) {
            return true;
        } else {
            return false;
        }
    }
}
