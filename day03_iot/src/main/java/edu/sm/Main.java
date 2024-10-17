package edu.sm;

import edu.sm.util.HttpSendData;

//TIP To <b>Run</b> code, press <shortcut actionId="Run"/> or
// click the <icon src="AllIcons.Actions.Execute"/> icon in the gutter.
public class Main {
    public static void main(String[] args) {
        String url = "http://127.0.0.1/iot/power";
        String data = "100.0";

        HttpSendData.send(url,data);
    }
}