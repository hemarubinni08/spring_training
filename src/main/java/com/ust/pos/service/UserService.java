package com.ust.pos.service;

import com.ust.pos.dto.UserDto;
import com.ust.pos.model.User;

import java.util.List;

public interface UserService {
    List<User> findAll();
    UserDto getByUsername(String userName);
    UserDto deleteByUsername(String userName);
    void deleteById(long id);
    UserDto updateByUsername(UserDto userDto);
}
