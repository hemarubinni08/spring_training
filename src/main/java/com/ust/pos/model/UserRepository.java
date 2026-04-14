package com.ust.pos.model;

import com.ust.pos.dto.UserDto;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.yaml.snakeyaml.events.Event;

import java.util.List;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {
    User findByUserName(String userName);

    User findByEmail(String email);

    void deleteByEmail(String email);

    List<User> findByRole(long role);

    List<User> findByRoles(long id);
}