package com.ust.pos.dao;

import com.ust.pos.dto.UserDto;
import com.ust.pos.model.User;

import java.util.List;

public interface UserDao {

    void update(UserDto userDto);

    User findByEmail(String email);

    List<User> getAllUsers();

    User getUserByEmail(String email);

    User getUserById(long id);


}
