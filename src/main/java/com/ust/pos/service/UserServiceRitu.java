package com.ust.pos.service;

import com.ust.pos.dto.UserDto;
import com.ust.pos.model.User;

import java.util.List;

public interface UserServiceRitu {
    UserDto update(UserDto userDto);

    UserDto updateJdbc(UserDto userDto);


}
