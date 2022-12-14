package com.pet.home.sell;

import java.util.List;

import com.pet.home.member.MemberDTO;
import com.pet.home.sell.file.SellFileDTO;
import com.pet.home.sell.purchase.PurchaseDTO;
import com.pet.home.sell.sellcategory.CategoryDTO;

public class SellItemDTO {

	private Long itemNum;
	private String userId;
	private String itemName;
	private Long itemPrice;
	private String itemContents;
	private Long itemZipCode;
	private String itemAddress;
	private String itemDeAddress;
	private Long itemCatg;
	
	

	private List<PickDTO> pickDTOs;

	public List<PickDTO> getPickDTOs() {
		return pickDTOs;
	}

	public void setPickDTOs(List<PickDTO> pickDTOs) {
		this.pickDTOs = pickDTOs;
	}

	private List<SellFileDTO> fileDTOs;
	private List<ShopCartDTO> shopCartDTOs;
	private List<PurchaseDTO> purchaseDTO;
	
	
	public List<PurchaseDTO> getPurchaseDTO() {
		return purchaseDTO;
	}

	public void setPurchaseDTO(List<PurchaseDTO> purchaseDTO) {
		this.purchaseDTO = purchaseDTO;
	}

	public List<ShopCartDTO> getShopCartDTOs() {
		return shopCartDTOs;
	}

	public void setShopCartDTOs(List<ShopCartDTO> shopCartDTOs) {
		this.shopCartDTOs = shopCartDTOs;
	}

	private CategoryDTO categoryDTO;

	public CategoryDTO getCategoryDTO() {
		return categoryDTO;
	}

	public void setCategoryDTO(CategoryDTO categoryDTO) {
		this.categoryDTO = categoryDTO;
	}

	public Long getItemNum() {
		return itemNum;
	}

	public void setItemNum(Long itemNum) {
		this.itemNum = itemNum;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	public Long getItemPrice() {
		return itemPrice;
	}

	public void setItemPrice(Long itemPrice) {
		this.itemPrice = itemPrice;
	}

	public String getItemContents() {
		return itemContents;
	}

	public void setItemContents(String itemContents) {
		this.itemContents = itemContents;
	}

	public Long getItemZipCode() {
		return itemZipCode;
	}

	public void setItemZipCode(Long itemZipCode) {
		this.itemZipCode = itemZipCode;
	}

	public String getItemAddress() {
		return itemAddress;
	}

	public void setItemAddress(String itemAddress) {
		this.itemAddress = itemAddress;
	}

	public String getItemDeAddress() {
		return itemDeAddress;
	}

	public void setItemDeAddress(String itemDeAddress) {
		this.itemDeAddress = itemDeAddress;
	}

	public Long getItemCatg() {
		if (this.itemCatg == null||this.itemCatg>3L) {
			itemCatg = 1L;
		}
		return itemCatg;
	}

	public void setItemCatg(Long itemCatg) {
		this.itemCatg = itemCatg;
	}

	public List<SellFileDTO> getFileDTOs() {
		return fileDTOs;
	}

	public void setFileDTOs(List<SellFileDTO> fileDTOs) {
		this.fileDTOs = fileDTOs;
	}

}