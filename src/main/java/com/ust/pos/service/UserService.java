package com.ust.pos.service;

import com.ust.pos.dto.UserDto;
import com.ust.pos.model.User;

import java.util.List;

public interface UserService {
    List<User> findAll();

    UserDto findById(long id);

    void deleteById(long id);

    User updateById(UserDto userDto);

    Boolean register(UserDto userDto);

    Boolean login(UserDto userDto);
}
