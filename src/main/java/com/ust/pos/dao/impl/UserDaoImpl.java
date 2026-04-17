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
    public boolean saveData(UserDto userDto) {
        String sql = "INSERT INTO user VALUES(?,?,?,?,?,?)";
        String encodedPass = passwordEncoder.encode(userDto.getPassword());
        String sqlQ = "INSERT INTO user SET sge = ? , email = ? name = ?";
        jdbcTemplate.update(sqlQ, userDto.getAge(), userDto.getEmail(), userDto.getName(), userDto.getPassword(), userDto.getPhoneNo());
        return false;
    }

    @Override
    public User findByEmail(String email) {
        String salQ = "SELECT * FROM user WHERE email = ?";
        List<User> userList = jdbcTemplate.query(
                salQ, new Object[]{email},
                new BeanPropertyRowMapper<>(User.class));
        return userList.isEmpty() ? null : userList.get(0);
    }

    @Override
    public List<UserDto> getAllUsersJdbc() {
        String sql = "SELECT * FROM user";
        return jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(UserDto.class));
    }

    @Override
    public void deleteByEmail(String email) {
        String delete = "DELETE FROM user WHERE email = ?";
        jdbcTemplate.update(delete, email);
    }

    @Override
    public User findByIdJdbc(Long id) {
        String sql = "SELECT * FROM user WHERE id = ?";
        List<User> user = jdbcTemplate.query(sql, new Object[]{id}, new
                BeanPropertyRowMapper<>(User.class));
        return user.isEmpty() ? null : user.get(0);
    }

    @Override
    public int updateDataJdbc(UserDto userDto) {

        String sql1 = "SELECT * FROM user WHERE email=? AND id<>?";

        List<User> users = jdbcTemplate.query(
                sql1,
                new Object[]{userDto.getEmail(), userDto.getId()},
                new BeanPropertyRowMapper<>(User.class)
        );

        if (!users.isEmpty()) {
            return 0;
        }

        String sql = "UPDATE user SET name=?, user_name=?, email=?, phone_no=?, age=? WHERE id=?";

        return jdbcTemplate.update(
                sql,
                userDto.getName(),
                userDto.getUserName(),
                userDto.getEmail(),
                userDto.getPhoneNo(),
                userDto.getAge(),
                userDto.getId()
        );
    }
}
