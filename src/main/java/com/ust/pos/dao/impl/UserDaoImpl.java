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
    JdbcTemplate jdbctemplate;

    @Autowired
    PasswordEncoder passwordEncoder;

    @Override
    public boolean createUserJdbc(UserDto userDto) {
        //String sq1 = "INSERT INTO user VALUES(?,?,?,?,?,?,?)";
        String encodedPass = passwordEncoder.encode(userDto.getPassword());
        String sqlQ = "INSERT INTO user SET name =? , email = ?, phone_no= ? , user_name = ? , password = ? , age = ? , date_of_birth = ?";
        int count = jdbctemplate.update(sqlQ, userDto.getName(), userDto.getEmail(), userDto.getPhoneNo(), userDto.getUserName(), encodedPass, userDto.getAge(), userDto.getDateOfBirth());
        if (count > 0) {
            return true;
        }
        return false;
    }

    @Override
    public User findUserByEmailJdbc(String email) {
        String sqlQ = "SELECT * FROM user WHERE Email=?";
        List<User> userlist = jdbctemplate.query(sqlQ,
                new Object[]{email},
                new BeanPropertyRowMapper(User.class));
        return userlist.isEmpty() ? null : userlist.get(0);
    }

    @Override
    public List<User> retrieveAllRecords(UserDto userDto) {
        String sqlQ = "SELECT * FROM user";
        List<User> userList = jdbctemplate.query(sqlQ, new BeanPropertyRowMapper(User.class));
        return userList;
    }

    @Override
    public void deleteByEmailJdbc(String email) {
        String sqlQ = "DELETE FROM user WHERE email = ? ";
        jdbctemplate.update(sqlQ, email);

    }

    @Override
    public User findByIdJdbc(long id) {
        String sqlQ = "SELECT * FROM user WHERE id=?";
        List<User> rolelist = jdbctemplate.query(sqlQ,
                new Object[]{id},
                new BeanPropertyRowMapper(User.class));
        return rolelist.isEmpty() ? null : rolelist.get(0);
    }

    @Override
    public Integer updateUserRecord(User user) {
        String sqlQ = "UPDATE user SET name=? , email=? ,  phone_no=? , user_name=? , age=? WHERE id=?";
        return jdbctemplate.update(sqlQ, user.getName(), user.getEmail(), user.getPhoneNo(), user.getUserName(), user.getAge(), user.getId());
    }
}

