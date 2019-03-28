package com.etoak.bean;

import java.util.Date;

import javax.validation.constraints.Max;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Past;

import lombok.Data;

/**
 * 测试校验框架
 *
 */
@Data
public class Student {

	@NotNull(message = "name不能为空")
	public String name;

	@Past(message = "出生日期必须是过去的时间")
	private Date birthday;

	@Max(value = 120, message = "年龄不能超过120")
	private Integer age;

}
