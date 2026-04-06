package com.ust.pos.service;

import com.ust.pos.dto.UserDto;

import java.util.List;

public interface UserService {

    UserDto createUser(UserDto user);

    boolean emailExists(String email);

    boolean emailExistsJdbc(String email);

    void createUserJdbc(UserDto userDto);


}
