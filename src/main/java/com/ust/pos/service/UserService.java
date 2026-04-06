package com.ust.pos.service;

import com.ust.pos.dto.UserDto;
import com.ust.pos.model.User;

import java.util.List;

public interface UserService {

    List<User> findAll();

    UserDto findById(Long id);

    UserDto findByUserName(String username);

    UserDto update(Long id, UserDto userDto);

    void deleteById(Long id);

    boolean register(UserDto userDto);
    boolean registerjdbc(UserDto userDto);
}