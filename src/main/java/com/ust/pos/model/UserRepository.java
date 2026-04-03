package com.ust.pos.model;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.List;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {
    User findByUsername();

    User findByDateOfBirth(Date dateOfBirth);

    List<User> findByAge(int age);
}
