package com.ust.pos.service.serviceimpl;

import com.ust.pos.dto.UserDto;
import com.ust.pos.model.User;
import com.ust.pos.model.UserRepository;
import com.ust.pos.service.UserService;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private ModelMapper modelMapper;
    @Autowired
    private UserRepository userRepository;

    @Override
    public UserDto getById(long id){
        Optional<User> user= userRepository.findById(id);
        return modelMapper.map(user,UserDto.class);
    }

    @Override
    public UserDto getByUserName(String name) {
        User user = userRepository.findByUsername(name);
        return modelMapper.map(user,UserDto.class);
    }

    @Override
    public void updateById(int id) {

    }

    @Override
    public void deleteById(int id) {

    }


}
