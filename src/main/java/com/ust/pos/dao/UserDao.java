package com.ust.pos.dao;

import com.ust.pos.dto.UserDto;
import com.ust.pos.model.User;

import java.util.List;

public interface UserDao {
    boolean createUser(UserDto userDto);

    User findByEmail(String email);

    User findById(long id);

    List<User> getAllUsers();

    void deleteByEmail(String email);

    boolean updateUserDetails (UserDto userDto);
}
