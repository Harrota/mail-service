package com.harrota.controller;

import com.harrota.model.Letter;
import com.harrota.model.User;
import com.harrota.repos.LetterRepo;
import com.harrota.repos.UserRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Map;

@Controller
public class MainController {
    @Autowired
    LetterRepo letterRepo;
    @Autowired
    UserRepo userRepo;


    @GetMapping("/")
    public String greeting(Map<String, Object> model) {
        return "greeting";
    }

    @GetMapping("/main")
    public String main(@RequestParam(required = false) String filter, @AuthenticationPrincipal User user, Model model) {
        Iterable<Letter> letters;
        if (filter != null && !filter.isEmpty()) {
            letters = letterRepo.findBySubject(filter);
        } else {
            letters = letterRepo.findByDestination(user);
        }
        model.addAttribute("letters", letters);
        model.addAttribute("filter", filter);
        return "main";
    }

    @PostMapping("/main")
    public String sendLetter(
            @AuthenticationPrincipal User user,
            @RequestParam String text,
            @RequestParam String email,
            @RequestParam String subject, Map<String, Object> model) {
        User destinationUser = userRepo.findByEmail(email);
        Letter letter = new Letter(subject, text, user, destinationUser);
        letterRepo.save(letter);

        Iterable<Letter> letters = letterRepo.findByDestination(user);
        model.put("letters", letters);

        return "main";
    }

}