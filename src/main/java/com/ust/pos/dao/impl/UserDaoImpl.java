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
    public void register(UserDto userDto) {
        String sq1 = "INSERT INTO USER VALUES (?,?,?,?,?,?,?,?)";
        String encodedPass = passwordEncoder.encode(userDto.getPassword());
        jdbcTemplate.update(sq1, null, userDto.getAge(), " ", userDto.getEmail(),
                userDto.getName(), encodedPass, userDto.getPhoneNo(), userDto.getUserName());
    }

    @Override
    public User findByEmail(String email) {
        String sq1 = "SELECT * FROM user WHERE EMAIL = ?";
        List<User> userList = jdbcTemplate.query(sq1, new Object[]{email},
                new BeanPropertyRowMapper(User.class));
        return userList.isEmpty() ? null : userList.get(0);
    }

    @Override
    public List<User> findAllUsersJdbc() {
        String sq1 = "SELECT * FROM user";
        List<User> userList = jdbcTemplate.query(sq1,
                new BeanPropertyRowMapper<>(User.class));

        return userList;
    }

    @Override
    public void deleteByEmailJdbc(String email) {
        String sq1 = "DELETE FROM user WHERE EMAIL = ?";

        jdbcTemplate.update(sq1, email);
    }

    @Override
    public User findById(Long id) {
        String sq1 = "SELECT * FROM user WHERE id = ?";
        List<User> userList = jdbcTemplate.query(sq1, new Object[]{id},
                new BeanPropertyRowMapper(User.class));
        return userList.isEmpty() ? null : userList.get(0);
    }

    @Override
    public void edit(UserDto userDto) {
        String sq1 = "UPDATE USER SET name=?,email=?,user_Name=?,phone_no=?," +
                "age=?,date_of_birth=?,password=? WHERE id=?";
        String encodedPass = passwordEncoder.encode(userDto.getPassword());
        jdbcTemplate.update(sq1, userDto.getName(), userDto.getEmail(), userDto.getUserName(),
                userDto.getPhoneNo(), userDto.getAge(), userDto.getDateOfBirth(), encodedPass,
                userDto.getId());
    }
}