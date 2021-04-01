package br.com.boavista.openbanking.openbanking;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

@Service
public class ParticipantService {

    public String getParticipants() {
        RestTemplate restTemplate = new RestTemplate();
        ResponseEntity<String> responseEntity = restTemplate.getForEntity(
                "https://data.directory.openbankingbrasil.org.br/participants",
                String.class);
        return responseEntity.getBody();
    }

}
