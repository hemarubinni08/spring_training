package com.ust.pos.model;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {

    boolean existsByEmail(String email);

    User findByEmail(String email);

    void deleteByEmail(String email);

    List<User> findByRole(String role);

    List<User> findByRoles(List<String> roles);

    User findByUserName(String userName);
}
