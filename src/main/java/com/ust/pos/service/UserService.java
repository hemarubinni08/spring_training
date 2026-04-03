package com.ust.pos.service;

import com.ust.pos.dto.UserDto;
import com.ust.pos.model.User;

import java.util.List;

public interface UserService {

    List<UserDto> findAll();
    UserDto findById(Long id);
    void deleteById(Long id);
    UserDto updateById(UserDto userDto);

}
