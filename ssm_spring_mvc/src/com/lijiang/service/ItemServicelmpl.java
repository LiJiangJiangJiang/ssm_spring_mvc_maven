package com.lijiang.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lijiang.bean.ItemInfo;
import com.lijiang.mapper.ItemMapper;

@Service
public class ItemServicelmpl implements ItemService {

	@Autowired
	private ItemMapper itemMapper;
	@Override
	public List<ItemInfo> selectAll(ItemInfo itemInfo) {
		return itemMapper.selectAll(itemInfo);
	}
	@Override
	public void deleteById(Integer id) {
		itemMapper.deleteById(id);
	}
	@Override
	public void saveItem(ItemInfo itemInfo) {
		itemMapper.saveItem(itemInfo);
	}
	@Override
	public void updateItem(ItemInfo itemInfo) {
		itemMapper.updateItem(itemInfo);
	}
	@Override
	public ItemInfo selectItemInfoById(Integer id) {
		return itemMapper.selectItemInfoById(id);
	}

	

	
	

}
