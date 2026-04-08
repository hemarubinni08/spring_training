package com.ust.pos.dao;

import com.ust.pos.dto.UserDto;
import com.ust.pos.model.User;

import java.util.List;

public interface UserDao {
    boolean register(UserDto userDto);

    User update(User user);

    User findByEmail(String email);

    User findById(Long id);

    List<User> findAllUsers();

    void deleteUserByEmail(String email);
}
