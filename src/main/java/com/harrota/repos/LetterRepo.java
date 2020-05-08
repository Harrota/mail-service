package com.harrota.repos;

import com.harrota.model.Letter;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface LetterRepo extends CrudRepository<Letter, Long> {
    List<Letter> findBySubject(String subject);
}
