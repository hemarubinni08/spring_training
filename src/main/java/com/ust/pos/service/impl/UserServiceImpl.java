package com.ust.pos.service.impl;

import com.ust.pos.dao.UserDao;
import com.ust.pos.dto.UserDto;
import com.ust.pos.model.User;
import com.ust.pos.model.UserRepository;
import com.ust.pos.service.UserService;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service

public class UserServiceImpl implements UserService {
    @Autowired
    ModelMapper modelMapper;
    @Autowired
    PasswordEncoder passwordEncoder;
    @Autowired
    UserDao userDao;
    @Autowired
    private UserRepository userRepository;

    @Override
    public UserDto createUserJpa(UserDto userDto) {
        User user = userRepository.findByEmail(userDto.getEmail());
        if (user == null) {
            User user1 = modelMapper.map(userDto, User.class);
            user1.setPassword(passwordEncoder.encode(userDto.getPassword()));
            userRepository.save(user1);
            userDto.setSuccess(true);
            return userDto;
        } else {
            userDto.setSuccess(false);
            return userDto;
        }
    }

    @Override
    public UserDto createUserJdbc(UserDto userDto) {
        User user = userDao.findByEmail(userDto.getEmail());
        if (user == null) {
            boolean success = userDao.createUser(userDto);
            userDto.setSuccess(success);
            return userDto;
        }
        return userDto;
    }

    @Override
    public List<UserDto> listOfUsersJpa() {
        List<User> users = userRepository.findAll();
        return users.stream()
                .map(user -> modelMapper.map(user, UserDto.class))
                .collect(Collectors.toList());
    }

    @Override
    public List<UserDto> listOfUsersJdbc() {
        List<User> users = userDao.listOfUsers();

        return users.stream()
                .map(user -> modelMapper.map(user, UserDto.class))
                .collect(Collectors.toList());
    }

    @Override
    public UserDto findByEmailJpa(String email) {
        return modelMapper.map(userRepository.findByEmail(email), UserDto.class);
    }

    @Override
    public UserDto findByEmailJdbc(String email) {
        return modelMapper.map(userDao.findByEmail(email), UserDto.class);
    }

    @Override
    public UserDto findByIdJpa(Long id) {
        return modelMapper.map(userRepository.findById(id), UserDto.class);
    }

    @Override
    public UserDto findByIdJdbc(Long id) {
        return modelMapper.map(userDao.findById(id), UserDto.class);
    }

    @Override
    public UserDto updateUserJpa(UserDto userDto) {
        Optional<User> userOptional = userRepository.findById(userDto.getId());
        if (userOptional.isPresent()) {
            User existingUser = userOptional.get();
            modelMapper.map(userDto, existingUser);
            userRepository.save(existingUser);
            userDto.setSuccess(true);
            return userDto;
        }
        return userDto;
    }

    @Override
    public UserDto updateUserJdbc(UserDto userDto) {
        User user = userDao.findById(userDto.getId());
        if (user != null) {
            boolean success = userDao.updateUser(userDto);
            userDto.setSuccess(success);
            return userDto;
        }
        return userDto;
    }

    @Override
    public void deleteByEmailJpa(String email) {
        User user = userRepository.findByEmail(email);
        userRepository.deleteById(user.getId());
    }

    @Override
    public void deleteByEmailJdbc(String email) {
        userDao.deleteByEmail(email);
    }

//    @Override
//    @Transactional(readOnly = true)
//    public UserDetails loadUserByUsername(String username) {
//        User user = userRepository.findByUsername(username);
//        if (user == null || !user.getStatus()) throw new UsernameNotFoundException(username);
//        Set<GrantedAuthority> grantedAuthorities = new HashSet<>();
//        for (Role role : user.getRoles()) {
//            grantedAuthorities.add(new SimpleGrantedAuthority(role.getName()));
//        }
//        return new org.springframework.security.core.userdetails.User(user.getUsername(), user.getPassword(), grantedAuthorities);
//    }
}




