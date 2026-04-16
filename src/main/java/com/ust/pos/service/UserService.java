package com.ust.pos.service;

import com.ust.pos.dto.UserDto;

import java.util.List;

public interface UserService {
    Boolean register(UserDto userDto);

    boolean createUserJdbc(UserDto userDto);

    List<UserDto> getUsersListJpa();

    List<UserDto> getUsersListJdbc();

    UserDto findByEmailJpa(String email);

    UserDto findByEmailJdbc(String email);

    UserDto findByUsernameJpa(String userName);

    UserDto findByIdJpa(long id);

    UserDto findByIdJdbc(long id);

    void deleteByEmailJpa(String email);

    void deleteByEmailJdbc(String email);

    boolean updateUserJpa(UserDto userDto);

    boolean updateUserJdbc(UserDto userDto);
}
