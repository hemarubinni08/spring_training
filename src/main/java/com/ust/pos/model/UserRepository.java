package com.ust.pos.model;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.List;
import java.util.Optional;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {
    User findByUserName(String userName);

    User findByDateOfBirth(Date dateOfBirth);

    List<User> findByAge(int age);

    User findByEmail(String email);

    void deleteByEmail(String email);

    Optional<User> findById(long id);

}
