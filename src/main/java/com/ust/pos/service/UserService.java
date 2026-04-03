package com.ust.pos.service;


import com.ust.pos.dto.UserDto;


import java.util.List;

public interface UserService {

    public UserDto getById(long id);
    public void updateById(int id);
    public void deleteById(int id);
    UserDto getByUserName(String name);
}

