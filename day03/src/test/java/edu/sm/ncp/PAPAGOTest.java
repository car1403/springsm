package edu.sm.ncp;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import edu.sm.util.PapagoUtil;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.test.context.SpringBootTest;
@Slf4j
@SpringBootTest
class PAPAGOTest {

	@Value("${app.key.papagoId}")
	String clientId;
	@Value("${app.key.papagoSecret}")
	String clientSecret;

	@Test
	void contextLoads() {
		String msg = "오늘 날씨 아주 좋네";
		String result = PapagoUtil.getMsg(clientId,clientSecret,msg,"en");
		log.info(result);

	}	
}
