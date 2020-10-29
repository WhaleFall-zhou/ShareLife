package com.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Chat {
    private int id;
    private User send;
    private User receiver;
    private String message_content;
    private Date send_time;
    private int status;
}
