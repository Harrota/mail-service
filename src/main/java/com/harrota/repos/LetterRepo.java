package com.harrota.repos;

import com.harrota.model.Letter;
import com.harrota.model.User;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface LetterRepo extends CrudRepository<Letter, Long> {

    List<Letter> findBySubject(String subject);

    List<Letter> findByAuthor(User user);

    List<Letter> findByDestination(User user);
}
