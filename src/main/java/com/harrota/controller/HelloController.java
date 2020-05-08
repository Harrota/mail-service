package com.harrota.controller;

import com.harrota.model.Letter;
import com.harrota.repos.LetterRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.Map;

@Controller
public class HelloController {
    @Autowired
    LetterRepo letterRepo;


    @GetMapping("/greeting")
    public String greeting(@RequestParam(name = "name", required = false, defaultValue = "World") String name, Map<String, Object> model) {
        model.put("name", name);
        return "greeting";
    }

    @GetMapping("/")
    public String main(Map<String, Object> model) {
        Iterable<Letter> letters = letterRepo.findAll();
        model.put("letters", letters);
        return "index";
    }

    @PostMapping
    public String sendLetter(@RequestParam String text,@RequestParam String subject,  Map<String, Object> model){
        Letter letter = new Letter(subject, text);
        letterRepo.save(letter);

        Iterable<Letter> letters = letterRepo.findAll();
        model.put("letters", letters);

        return "index";
    }

    @PostMapping("filter")
    public String filter(@RequestParam String filter,  Map<String, Object> model){
        Iterable<Letter> letters;
        if (filter != null && !filter.isEmpty()){
            letters = letterRepo.findBySubject(filter);
        }else{
            letters = letterRepo.findAll();
        }
        model.put("letters", letters);
        return "index";
    }
}