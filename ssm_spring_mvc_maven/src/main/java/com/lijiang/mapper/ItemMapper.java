package com.lijiang.mapper;

import java.util.List;

import com.lijiang.bean.ItemInfo;

public interface ItemMapper {

	List<ItemInfo> selectAll(ItemInfo itemInfo);

	void deleteById(Integer id);

	void saveItem(ItemInfo itemInfo);

	void updateItem(ItemInfo itemInfo);

	ItemInfo selectItemInfoById(Integer id);

	


	

}
