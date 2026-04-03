package com.ust.pos.model;

import com.ust.pos.dto.UserDto;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.List;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {
    User findByUserName(String userName);
    User findByDateOfBirth(Date dateOfBirth);
    List<User> findByAge(int age);
    User findByEmail(String email);
}
