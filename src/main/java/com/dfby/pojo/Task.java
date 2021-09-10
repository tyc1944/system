package com.dfby.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;
import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Task {
    private Integer tid;

    private String taskname;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date taskbegintime;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date taskendtiime;

    private String taskstate;

    private String taskdescription;

    private String staffid;

    private String empid;

 private User user;

// private List<Plan> planList;



}