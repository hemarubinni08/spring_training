package com.ust.pos.service;

import com.ust.pos.dto.UserDto;

import java.util.List;

public interface UserService {
    boolean createUser(UserDto userDto);
    boolean createUserJdbc(UserDto userDto);
    List<UserDto> allUsersDto();
    List<UserDto> allUsersDtoJdbc();
    UserDto getByEmailJdbc(String email);
    UserDto getByEmailJpa(String email);
    void deleteByEmailJpa(String email);
    void deleteByEmailJdbc(String email);
    UserDto  getUserByidJpa(Long id);
    UserDto getUserByidJdbc(Long id);
    boolean updateUserByid(UserDto userDto);
    boolean updateUserByid2(UserDto userDto);
    boolean updateUserByIdJdbc(UserDto userDto);
    List<UserDto> findByRoleId(Long id);
    UserDto getUserByUserName(String userName);
}
