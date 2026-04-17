package com.ust.pos.service;

import com.ust.pos.dto.UserDto;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface UserService {
    UserDto saveUser(UserDto userDto);

    boolean saveUserJdbc(UserDto userDto);

    List<UserDto> getAllUsers();

    List<UserDto> getAllUserJdbc();

    UserDto getByEmail(String email);

    UserDto getByEmailJdbc(String email);

    void deleteByEmail(String email);

    UserDto getUserById(Long id);

    UserDto getUserByIdJdbc(Long id);

    UserDto updateUser(UserDto userDto);

    UserDto findById(Long id);

    UserDto findByUserNameService(String userName);
}