package com.ust.pos.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.List;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {

    User findByUserName(String userName);

    List<User> findByAge(int age);

    User findByDateOfBirth(Date dateOfBirth);

    boolean existsByEmail(String email);
}