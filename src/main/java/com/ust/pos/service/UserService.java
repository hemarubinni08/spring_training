package com.ust.pos.service;

import com.ust.pos.dto.UserDto;

import java.util.List;

public interface UserService {
    UserDto findByUserName(String userName);

    List<UserDto> findAll();
    UserDto findById(Long id);
    void deleteById(Long id);
    UserDto updateById(Long id);

    UserDto updateById(UserDto userDto);

    UserDto update(UserDto userDto);
}
