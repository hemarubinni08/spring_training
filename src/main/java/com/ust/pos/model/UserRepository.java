package com.ust.pos.model;

import com.ust.pos.dto.UserDto;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {
    User findByUserName(String userName);

    User findByEmail(String email);
    List<User> findByEmailOrName(String email, String userName);

    void deleteByEmail(String email);

    UserDto save(UserDto userDto);

    Optional<User> findByEmailAndIdNot(String email, long id);

    List<User> findByRole(String role);

}
