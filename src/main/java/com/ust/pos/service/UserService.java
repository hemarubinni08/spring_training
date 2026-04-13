package com.ust.pos.service;

import com.ust.pos.dto.UserDto;

import java.util.List;

public interface UserService {
    UserDto updateUniqueUser(UserDto userDto);

    boolean createUserUsingDao(UserDto userDto);

    List<UserDto> getAllUsersDetailsUsingJdbc();

    List<UserDto> getAllUsersDetailsUsingJpa();

    UserDto getUserDetailsUsingJdbc(String email);

    UserDto getUserDetailsUsingJpa(String email);

    UserDto getUserDetailsUsingJdbcByid(long id);

    UserDto getUserDetailsUsingJpaByid(long id);

    void deleteUserDetailsUsingJdbc(String email);

    void deleteUserDetailsUsingJpa(String email);

    UserDto updateUserDetailsUsingJdbc(UserDto userDto);

    UserDto updateUserDetailsUsingJpa(UserDto userDto);
}
