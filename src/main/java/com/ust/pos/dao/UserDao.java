package com.ust.pos.dao;

import com.ust.pos.dto.UserDto;
import com.ust.pos.model.User;

import java.util.List;

public interface UserDao {

    Boolean saveData(UserDto userDto);

    List<User> findByEmailOrName(String email, String name);

    List<User> findAllUsers();

    User findByEmail(String email);

    User findById(long id);

    User updateUser(User user);

}
