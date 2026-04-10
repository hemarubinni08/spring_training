package com.ust.pos.dao;

import com.ust.pos.dto.UserDto;
import com.ust.pos.model.User;

import java.util.List;

public interface UserDao {

    boolean createUser(UserDto userDto);

    boolean emailExists(String email);

    List<UserDto> getUsers();

    UserDto getUserByEmail(String email);


    void deleteUserByEmail(String email);

    UserDto getUserByIdJdbc(Long id);

    UserDto updateUserJdbc(UserDto userDto);

    boolean emailExistsForAnotherUser(String email, Long userId);




}