package com.pet.home.member;

import java.util.List;

public class MemberDTO {   
	
	private String userId;
	private Long roleNum;
	private String userName;
	private String password;
	private String email;
	private String phone;
	private String address;
	private Integer block;
	private Integer agEmail;
	private Integer agValue;
	private Integer agMes;
	private List<RoleDTO> roleDTOs;
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public Long getRoleNum() {
		return roleNum;
	}
	public void setRoleNum(Long roleNum) {
		this.roleNum = roleNum;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public Integer getBlock() {
		return block;
	}
	public void setBlock(Integer block) {
		this.block = block;
	}
	public Integer getAgEmail() {
		return agEmail;
	}
	public void setAgEmail(Integer agEmail) {
		this.agEmail = agEmail;
	}
	public Integer getAgValue() {
		return agValue;
	}
	public void setAgValue(Integer agValue) {
		this.agValue = agValue;
	}
	public Integer getAgMes() {
		return agMes;
	}
	public void setAgMes(Integer agMes) {
		this.agMes = agMes;
	}
	public List<RoleDTO> getRoleDTOs() {
		return roleDTOs;
	}
	public void setRoleDTOs(List<RoleDTO> roleDTOs) {
		this.roleDTOs = roleDTOs;
	}
	

}