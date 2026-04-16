package com.ust.pos.dao;

import com.ust.pos.dto.UserDto;
import com.ust.pos.model.User;

import java.util.List;

public interface UserDao {
    User findByEmailCustom(String email);

    boolean register(UserDto userDto);

    List<User> getUsersJdbc();

    void deleteByEmail(String email);

    void updateValue(UserDto userDto);
}