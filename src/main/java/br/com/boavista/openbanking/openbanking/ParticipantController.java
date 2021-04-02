package br.com.boavista.openbanking.openbanking;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.security.RolesAllowed;

@RestController
@RequestMapping(value="/api/participants")
public class ParticipantController {

    @Autowired
    private ParticipantService service;

    @RolesAllowed({"user"})
    @GetMapping
    public ResponseEntity<?> participants() {
        return ResponseEntity.ok().body(service.getParticipants());
    }

}