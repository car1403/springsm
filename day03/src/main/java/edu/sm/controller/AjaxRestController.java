package edu.sm.controller;

import lombok.extern.slf4j.Slf4j;
import netscape.javascript.JSObject;
import org.json.simple.JSONObject;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@Slf4j
public class AjaxRestController {
    @RequestMapping("/getctime")
    public Object getctime(){
        JSONObject obj = new JSONObject();
        // {'ctime','2023-12-12'}
        obj.put("ctime", System.currentTimeMillis());
        return obj;
    }
}
