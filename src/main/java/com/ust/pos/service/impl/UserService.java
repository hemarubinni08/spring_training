package com.ust.pos.service.impl;

import com.ust.pos.dto.UserDto;

public interface UserService {
    boolean putInformation(UserDto userDto);
    boolean putInformationJdbc(UserDto userDto);
}
