package com.pet.home.member;

import java.util.List;

import com.pet.home.board.event.coupon.CouponDTO;
import com.pet.home.sell.PickDTO;
import com.pet.home.sell.ReservationDTO;
import com.pet.home.sell.SellItemDTO;
import com.pet.home.sell.ShopCartDTO;
import com.pet.home.sell.file.SellFileDTO;
import com.pet.home.sell.purchase.PurchaseDTO;

public class MemberDTO {

	private String userId;
	private Integer roleNum;
	private String userName;
	private String password;
	private String email;
	private String phone;
	private String address;
	private Integer block;
	private Integer agMail;
	private Integer agValue;
	private Integer agMes;
	private Long itemZipCode;
	private String deAddress;
	private String petCatg;
	private String petName;
	private Long guestId;
	private List<CouponDTO> couponDTOs;
	private Long totalPrice;
	private List<ShopCartDTO> shopCartDTOs;
	private List<RoleDTO> roleDTOs;
	private List<SellItemDTO> itemDTOs;
	private List<SellFileDTO> fileDTOs;
	private List<FollowDTO> followDTOs;
	private FollowDTO followDTO;
	private RoleDTO roleDTO;
	private MemberFileDTO memberFileDTO;
	private ReservationDTO reservationDTO;
	private String follower;
	private String followee;
	private String search;
	private String roleName;
	

	public String getRoleName() {
		return roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	public String getSearch() {
		return search;
	}

	public void setSearch(String search) {
		this.search = search;
	}

	public String getFollowee() {
		return followee;
	}

	public void setFollowee(String followee) {
		this.followee = followee;
	}

	public String getFollower() {
		return follower;
	}

	public void setFollower(String follower) {
		this.follower = follower;
	}

	public ReservationDTO getReservationDTO() {
		return reservationDTO;
	}

	public void setReservationDTO(ReservationDTO reservationDTO) {
		this.reservationDTO = reservationDTO;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public Integer getRoleNum() {
		return roleNum;
	}

	public void setRoleNum(Integer roleNum) {
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

	public Integer getAgMail() {
		return agMail;
	}

	public void setAgMail(Integer agMail) {
		this.agMail = agMail;
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

	public Long getItemZipCode() {
		return itemZipCode;
	}

	public void setItemZipCode(Long itemZipCode) {
		this.itemZipCode = itemZipCode;
	}

	public String getDeAddress() {
		return deAddress;
	}

	public void setDeAddress(String deAddress) {
		this.deAddress = deAddress;
	}

	public String getPetCatg() {
		return petCatg;
	}

	public void setPetCatg(String petCatg) {
		this.petCatg = petCatg;
	}

	public String getPetName() {
		return petName;
	}

	public void setPetName(String petName) {
		this.petName = petName;
	}

	public Long getGuestId() {
		return guestId;
	}

	public void setGuestId(Long guestId) {
		this.guestId = guestId;
	}

	public List<CouponDTO> getCouponDTOs() {
		return couponDTOs;
	}

	public void setCouponDTOs(List<CouponDTO> couponDTOs) {
		this.couponDTOs = couponDTOs;
	}

	public Long getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(Long totalPrice) {
		this.totalPrice = totalPrice;
	}

	public List<ShopCartDTO> getShopCartDTOs() {
		return shopCartDTOs;
	}

	public void setShopCartDTOs(List<ShopCartDTO> shopCartDTOs) {
		this.shopCartDTOs = shopCartDTOs;
	}

	public List<RoleDTO> getRoleDTOs() {
		return roleDTOs;
	}

	public void setRoleDTOs(List<RoleDTO> roleDTOs) {
		this.roleDTOs = roleDTOs;
	}

	public List<SellItemDTO> getItemDTOs() {
		return itemDTOs;
	}

	public void setItemDTOs(List<SellItemDTO> itemDTOs) {
		this.itemDTOs = itemDTOs;
	}

	public List<SellFileDTO> getFileDTOs() {
		return fileDTOs;
	}

	public void setFileDTOs(List<SellFileDTO> fileDTOs) {
		this.fileDTOs = fileDTOs;
	}

	public List<FollowDTO> getFollowDTOs() {
		return followDTOs;
	}

	public void setFollowDTOs(List<FollowDTO> followDTOs) {
		this.followDTOs = followDTOs;
	}

	public FollowDTO getFollowDTO() {
		return followDTO;
	}

	public void setFollowDTO(FollowDTO followDTO) {
		this.followDTO = followDTO;
	}

	public RoleDTO getRoleDTO() {
		return roleDTO;
	}

	public void setRoleDTO(RoleDTO roleDTO) {
		this.roleDTO = roleDTO;
	}

	public MemberFileDTO getMemberFileDTO() {
		return memberFileDTO;
	}

	public void setMemberFileDTO(MemberFileDTO memberFileDTO) {
		this.memberFileDTO = memberFileDTO;
	}


}
