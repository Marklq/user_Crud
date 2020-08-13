package com.dd.pojo;

import com.dd.utils.TimeUtils;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;


@AllArgsConstructor
@NoArgsConstructor
@Data
public class User {

    private Integer id;
    private String mobile;
    private String password;
    private String sex;

    private String address;
    private String email;
    private String state;
    private Date birthdateStr;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date birthdate;
    private Date create_time;
    private Date update_time;



    public String getBirthdateStr() {
        TimeUtils timeUtils = new TimeUtils();
        String date = timeUtils.DateToString(birthdate);

        return date;
    }


}
