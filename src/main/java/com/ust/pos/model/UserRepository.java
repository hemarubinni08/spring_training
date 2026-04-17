package com.ust.pos.model;

import org.springframework.stereotype.Repository;

@Repository
public interface UserRepository extends CommonRepository<User, Long> {
    User findByEmail(String email);

    void deleteByEmail(String email);

    boolean existsByEmail(String newEmail);

}
