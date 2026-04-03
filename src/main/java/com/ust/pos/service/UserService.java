package com.ust.pos.service;

import com.ust.pos.dto.UserDto;
import com.ust.pos.model.User;

import java.util.List;

public interface UserService {
    UserDto getById(Long id);
    List<UserDto> getAllUser();
    void update(UserDto userDto);
    void deleteById(Long id);
}