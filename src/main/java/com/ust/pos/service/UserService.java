package com.ust.pos.service;

import com.ust.pos.dto.UserDto;
import com.ust.pos.model.User;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserService {
    UserDto registerUser(UserDto userDto);

    UserDto registerUserJdbc(UserDto userDto);

    List<UserDto> getUsersJpa();

    List<UserDto> getUsersJdbc();

    UserDto getUserByEmail(String email);

    UserDto getUserByEmailJdbc(String email);
}