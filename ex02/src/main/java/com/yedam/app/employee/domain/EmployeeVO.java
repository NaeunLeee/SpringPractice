package com.yedam.app.employee.domain;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class EmployeeVO {
	
	private int employeeId;
	private String firstName;
	private String lastName;
	private String email;
	private String phoneNumber;
	@JsonFormat(pattern = "yyyy/MM/dd")
	private Date hireDate;
	private String jobId;
	private int salary;
	private int commissionPct;
	private int managerId;
	private int departmentId;
	
}
