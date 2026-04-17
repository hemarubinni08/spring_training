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
    public void saveAUser(UserDto userDto) {

        String sql = "INSERT INTO users VALUES(?,?,?,?,?,?,?,?)";
        String encodePass = passwordEncoder.encode(userDto.getPassword());

        jdbcTemplate.update(sql,
                userDto.getAge(), encodePass, userDto.getEmail(),
                userDto.getName(), userDto.getPhoneNo());
    }

    @Override
    public User findByEmail(String email) {

        String sql = "SELECT * FROM users WHERE email = ?";

        List<User> user_list = jdbcTemplate.query(
                sql,
                new Object[]{email},
                new BeanPropertyRowMapper(User.class)
        );

        return user_list.isEmpty() ? null : user_list.get(0);
    }

    @Override
    public List<User> findAllUsers() {

        String sql = "Select * from users";

        return jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(User.class));
    }

    @Override
    public boolean deleteByEmail(String email) {

        String sql = "Delete from users where email=?";
        int msg = jdbcTemplate.update(
                sql,
                email
        );

        return msg > 0;
    }

    @Override
    public User findById(Long id) {

        String sql = "Select * from users where id = ?";
        List<User> users = jdbcTemplate.query(sql,
                new Object[]{id},
                new BeanPropertyRowMapper(User.class)
        );

        return users.isEmpty() ? null : users.getFirst();
    }


    @Override
    public int updateUser(UserDto userDto) {

        String sql1 = "Select * from users where email=? and id<>?";

        User user = jdbcTemplate.queryForObject
                (sql1,
                        User.class,
                        userDto.getEmail(), userDto.getId());

        if (user != null) {
            return 0;
        }

        String sql = "UPDATE users SET name = ?, user_name = ?, email = ?," +
                "phone_no = ?, age = ? WHERE id = ?";

        return jdbcTemplate.update(sql, userDto.getName(),
                userDto.getUserName(), userDto.getEmail(), userDto.getPhoneNo(),
                userDto.getAge(), userDto.getId());
    }

    @Override
    public boolean existsByEmail(String email) {

        String sql = "Select * from users where email=?";

        List<User> user = jdbcTemplate.query(sql,
                new Object[]{email}, new BeanPropertyRowMapper(User.class));

        if (!user.isEmpty()) {
            return true;
        }

        return false;
    }
}
