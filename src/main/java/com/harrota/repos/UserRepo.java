package com.harrota.repos;

import com.harrota.model.User;
import org.springframework.data.repository.CrudRepository;

public interface UserRepo extends CrudRepository<User, Long> {
    User findByUsername(String username);

    User findByEmail(String email);
}
