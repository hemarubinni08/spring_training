package com.ust.pos.service;

import com.ust.pos.dto.UserDto;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public interface UserService {
    UserDto register(UserDto userDto);

    UserDto createUserUsingJdbc(UserDto userDto);

    List<UserDto> getAllUsers();

    List<UserDto> displayValuesJdbc();

    UserDto findByEmailPage(String email);

    UserDto findByEmailPageJdbc(String email);

    void deleteByEmail(String email);

    void deleteByEmailJdbc(String email);

    UserDto findById(Long id);

    UserDto findByIdJdbc(Long id);

    UserDto edit(UserDto userDto);

    UserDto editJdbc(UserDto userDto);

    List<UserDto> findByRoleName(String roleName);

    List<UserDto> findByRoleNames(String roleName);

    UserDto getUserByUsername(String userName);

}