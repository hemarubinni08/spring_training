package com.ust.pos.dao;

import com.ust.pos.dto.UserDto;
import com.ust.pos.model.User;

import java.util.List;

public interface UserDao {
    boolean save(UserDto userDto);
    User fundByEmail(String email);
    List<User> getData();
    void deleteUserJdbc(String email);
}
