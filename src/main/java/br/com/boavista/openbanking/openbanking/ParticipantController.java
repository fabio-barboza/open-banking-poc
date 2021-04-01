package br.com.boavista.openbanking.openbanking;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(value="/api/participants")
public class ParticipantController {

    @Autowired
    private ParticipantService service;

    @PreAuthorize("!hasAuthority('user')")
    @GetMapping
    public ResponseEntity<?> summary() {
        return ResponseEntity.ok().body(service.getParticipants());
    }

}