package com.ust.pos.dao;

import com.ust.pos.dto.UserDto;
import com.ust.pos.model.User;

import java.util.List;

public interface UserDao {

    boolean update(UserDto userDto);

    User findByEmail(String email);

    List<User> displayUser();

    User findById(long id);

    boolean updateprofileJDBC(UserDto userDto);
}
