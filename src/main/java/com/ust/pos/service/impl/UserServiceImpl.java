package com.ust.pos.service.impl;

import com.ust.pos.dto.UserDto;
import com.ust.pos.model.User;
import com.ust.pos.model.UserRepository;
import com.ust.pos.service.UserService;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import java.util.ArrayList;
import java.util.List;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private  ModelMapper modelMapper;

    @Override
    public List<UserDto> findAll() {

        List<User> allUsers = userRepository.findAll();
        List<UserDto> allUserDtos = new ArrayList<>();

        for (User user : allUsers){
            UserDto userDto = new UserDto();
            userDto.setId(user.getId());
            userDto.setName(user.getName());
            userDto.setUserName(user.getUserName());
            userDto.setAge(user.getAge());
            userDto.setEmail(user.getEmail());
            userDto.setPhoneNo(user.getPhoneNo());
            userDto.setPassword(user.getPassword());
            userDto.setDateOfBirth(user.getDateOfBirth());
            allUserDtos.add(userDto);
        }
        return allUserDtos;
    }

    @Override
    public UserDto findById(Long id) {
        User user = userRepository.findById(id).orElseThrow();
        UserDto userDto = new UserDto();
//        userDto.setId(user.getId());
//        userDto.setName(user.getName());
//        userDto.setUserName(user.getUserName());
//        userDto.setAge(user.getAge());
//        userDto.setEmail(user.getEmail());
//        userDto.setPhoneNo(user.getPhoneNo());
//        userDto.setPassword(user.getPassword());
//        userDto.setDateOfBirth(user.getDateOfBirth());

        return modelMapper.map(user, UserDto.class);
    }

    @Override
    public void deleteById(Long id) {
        userRepository.deleteById(id);
    }

    @Override
    public UserDto updateById(UserDto userDto) {

        User currentUser = userRepository.findById(userDto.getId()).orElseThrow();

        currentUser.setId(userDto.getId());
        currentUser.setName(userDto.getName());
        currentUser.setUserName(userDto.getUserName());
        currentUser.setAge(userDto.getAge());
        currentUser.setEmail(userDto.getEmail());
        currentUser.setPhoneNo(userDto.getPhoneNo());
        currentUser.setPassword(userDto.getPassword());
        currentUser.setDateOfBirth(userDto.getDateOfBirth());

        userRepository.save(currentUser);

        return userDto;
    }
}
