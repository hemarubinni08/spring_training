package com.ust.pos.service;

import com.ust.pos.dto.UserDto;

import java.util.List;

public interface UserService {

    // Using Jpa
    UserDto createUser(UserDto userDto);

    List<UserDto> getAllUsersDetails();

    UserDto getUserDetails(String email);

    UserDto getUserDetailsById(long id);

    List<UserDto> getAllUsersByRoleName(String roleName);

    UserDto updateUserDetails(UserDto userDto);

    void deleteUser(String email);


    // Using JDBC
    boolean createUserUsingJdbc(UserDto userDto);

    List<UserDto> getAllUsersDetailsUsingJdbc();

    UserDto getUserDetailsUsingJdbc(String email);

    UserDto getUserDetailsUsingJdbcByid(long id);

    UserDto updateUserDetailsUsingJdbc(UserDto userDto);

    void deleteUserDetailsUsingJdbc(String email);

}
