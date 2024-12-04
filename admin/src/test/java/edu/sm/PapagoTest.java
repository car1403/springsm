package edu.sm;

import edu.sm.util.PapagoUtil;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.test.context.SpringBootTest;
@Slf4j
@SpringBootTest
class PapagoTest {
    @Value("${app.key.papago-id}")
    String clientId;
    @Value("${app.key.papago-secret}")
    String clientSecret;

    @Test
    void contextLoads() {
        String msg = "오늘 날씨 춥다.";
        String result = "";
        result = PapagoUtil.getMsg(clientId,clientSecret,msg,"vi");
        log.info(result);
    }

}
