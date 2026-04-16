package com.ust.pos.service;

import com.ust.pos.dto.UserDto;
import java.util.List;

public interface UserServiceInterface {

    String update(UserDto userDto);

    String createUserJdbc(UserDto userDto);

    List<UserDto> getAllUsers();

    List<UserDto> getAllUsersJdbc();

    UserDto getUserProfileByEmail(String email);

    UserDto getUserProfileByEmailJdbc(String email);

    UserDto deleteByEmailService(String email);

    UserDto getUserProfileById(long id);

    UserDto getUserProfileByIdJdbc(long id);

    UserDto saveOrUpdateUser(UserDto userDto);

    UserDto saveOrUpdateUserJdbc(UserDto userDto);

    UserDto getUserByUsername(String username);
}