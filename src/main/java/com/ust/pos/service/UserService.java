package com.ust.pos.service;

import com.ust.pos.dto.UserDto;
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

    void deleteUserByEmailJpa(String email);

    void deleteUserByEmailJdbc(String email);

    UserDto getUserByIdJpa(Long id);

    UserDto getUserByIdJdbc(Long id);

    UserDto updateUserJdbc(UserDto userDto);

    UserDto updateUserJpa(UserDto userDto);

    UserDto getUserByUserName(String userName);
}