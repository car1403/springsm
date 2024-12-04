package edu.sm.controller;

import edu.sm.app.dto.Msg;
import edu.sm.util.PapagoUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.simp.SimpMessageHeaderAccessor;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;
@Slf4j
@Controller
public class MsgController {
    @Autowired
    SimpMessagingTemplate template;

    @Value("${app.key.papago-id}")
    String clientId;
    @Value("${app.key.papago-secret}")
    String clientSecret;

    @MessageMapping("/receiveall") // 모두에게 전송
    public void receiveall(Msg msg, SimpMessageHeaderAccessor headerAccessor) {
        System.out.println(msg);
        template.convertAndSend("/send",msg);
    }
    @MessageMapping("/receiveme") // 나에게만 전송 ex)Chatbot
    public void receiveme(Msg msg, SimpMessageHeaderAccessor headerAccessor) {
        System.out.println(msg);

        String id = msg.getSendid();
        template.convertAndSend("/send/"+id,msg);
    }
    @MessageMapping("/receiveto") // 특정 Id에게 전송
    public void receiveto(Msg msg, SimpMessageHeaderAccessor headerAccessor) {
        String id = msg.getSendid();
        String target = msg.getReceiveid();
        log.info("-------------------------");
        log.info(target);
        String txt = msg.getContent1();
        String tmsg = PapagoUtil.getMsg(clientId,clientSecret,txt,"vi");
        msg.setContent1(tmsg);
        template.convertAndSend("/send/to/"+target,msg);
    }
}





