package com.ust.pos.dao;

import com.ust.pos.dto.UserDto;
import com.ust.pos.model.User;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserDao {
    boolean save(UserDto userDto);

    User findByEmail(String email);

    List<User> findAllUsersDao();
}