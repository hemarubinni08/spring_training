package com.ust.pos.service;

import com.ust.pos.dto.UserDto;

import java.util.List;

public interface UserService {
    UserDto saveData(UserDto userDto);

    boolean saveDataJdbc(UserDto userDto);

    List<UserDto> fetchUserJdbc();

    List<UserDto> fetchUser1();

    UserDto findByIdJdbc(Long id);

    UserDto findByIdJpa(Long id);

    UserDto findByEmail(String email);

    UserDto findByEmailJpa(String email);

    void deleteByEmail(String email);

    void deleteByEmailJdbc(String email);

    boolean updateByEmail(UserDto userdto);

    UserDto getUserByUsername(String username);
}
