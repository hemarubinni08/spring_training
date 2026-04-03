package com.ust.pos.service;

import com.ust.pos.dto.UserDto;
import com.ust.pos.model.User;

import java.util.List;

public interface UserService {
    UserDto findByUserName(String userName);

    UserDto findById(Long id);

    List<UserDto> findAllUsers();

    void deleteById(Long id);

    UserDto update(UserDto userDto);

}
