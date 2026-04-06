package com.ust.pos.service;

import com.ust.pos.dto.UserDto;

public interface UserService {

    boolean updateUserDetailsById(UserDto userDto);

    boolean existsByEmail(String email);

    boolean createUserJdbc(UserDto userDto);
}
