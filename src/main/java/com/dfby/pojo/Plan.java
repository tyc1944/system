package com.dfby.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Plan {
    private Integer pid;

    private String planname;

    private String planstate;

    private String feedback;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date planbegintime;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date planendtime;

    private String plandescription;

    private String planfeedback;

    private Integer taskid;

    private Task task;



}