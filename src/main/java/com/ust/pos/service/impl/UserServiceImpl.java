package com.ust.pos.service.impl;

import com.ust.pos.dao.UserDao;
import com.ust.pos.dto.UserDto;
import com.ust.pos.model.RoleRepository;
import com.ust.pos.model.User;
import com.ust.pos.model.UserRepository;
import com.ust.pos.service.UserService;
import jakarta.transaction.Transactional;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Autowired
    private UserDao userDao;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private RoleRepository roleRepository;

    @Autowired
    private ModelMapper modelMapper;

    @Override
    public boolean saveAUSer(UserDto userDto) {

        if (existsByEmail(userDto.getEmail()) || existsByUserName(userDto.getUserName())) {

            return false;
        }

        userDto.setPassword(passwordEncoder.encode(userDto.getPassword()));
        userRepository.save(modelMapper.map(userDto, User.class));

        return true;
    }

    @Override
    public boolean saveAUserJdbc(UserDto userDto) {

        if (existsByEmailJdbc(userDto.getEmail())) {

            return false;
        }

        userDto.setPassword(passwordEncoder.encode(userDto.getPassword()));
        userDao.saveAUser(userDto);

        return true;
    }

    @Override
    public boolean existsByEmailJdbc(String email) {

        return userDao.existsByEmail(email);
    }

    @Override
    public List<UserDto> fetchAllUsersList() {

        List<UserDto> users_list = new java.util.ArrayList<>();

        for (User user : userDao.findAllUsers()) {

            users_list.add(modelMapper.map(user, UserDto.class));
        }

        return users_list;
    }

    @Override
    public List<UserDto> fetchAllUsersListUsingJpa() {

        List<UserDto> users_list = new ArrayList<>();

        for (User user : userRepository.findAll()) {

            UserDto dto = modelMapper.map(user, UserDto.class);
            users_list.add(dto);
        }

        return users_list;
    }

    @Override
    @Transactional
    public UserDto deleteByEmailService(String email) {

        return modelMapper.map(userRepository.deleteByEmail(email), UserDto.class);
    }

    @Override
    @Transactional
    public boolean deleteByEmailServiceJdbc(String email) {

        if (userDao.deleteByEmail(email)) {

            return true;
        } else {

            return false;
        }
    }

    @Override
    public UserDto findByIdService(Long id) {

        User user = userRepository.findById(id).orElseThrow();
        UserDto dto = modelMapper.map(user, UserDto.class);

        return dto;
    }

    @Override
    public UserDto findByIdServiceUsingJdbc(Long id) {

        return modelMapper.map(userDao.findById(id), UserDto.class);
    }

    @Override
    public UserDto updateUsingJpaService(UserDto userDto) {

        Optional<User> optionalUser = userRepository.findById(userDto.getId());

        if (!optionalUser.isPresent()) {

            userDto.setMessage("Not Present in Server");
            return null;
        }

        User existingUser = optionalUser.get();
        String existingEmail = existingUser.getEmail();
        String newEmail = userDto.getEmail();

        if (!existingEmail.equals(newEmail)) {

            if (userRepository.existsByEmail(newEmail)) {

                userDto.setMessage("Email Already Exists");
                return null;
            }
        }

        modelMapper.map(userDto, existingUser);
        userDto.setMessage("User updated successfully");

        return modelMapper.map(userRepository.save(existingUser), UserDto.class);
    }

    @Override
    public int updateUsingJpaServiceUsingJdbc(UserDto userDto) {

        if (userDao.updateUser(userDto) < 1) {

            userDto.setMessage("Failed Updating");
            return 0;
        }

        userDto.setMessage("Successfull Updating");

        return 1;
    }

    @Override
    public UserDto findByEmail(String email) {

        User user = userDao.findByEmail(email);

        return modelMapper.map(user, UserDto.class);
    }

    @Override
    public UserDto findByEmailUsingJpa(String email) {

        return modelMapper.map(userRepository.findByEmail(email), UserDto.class);
    }

    @Override
    public boolean existsByEmail(String email) {

        return false;
    }

    @Override
    public UserDto findByUserNameService(String userName) {

        User user = userRepository.findByUserName(userName);

        if (user == null) {
            return null;
        }

        return modelMapper.map(user, UserDto.class);
    }

    @Override
    public boolean existsByUserName(String userName) {

        return userRepository.existsByUserName(userName);

    }


}
