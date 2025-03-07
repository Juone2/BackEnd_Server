package com.github.supercoding.repository.items;

import java.util.List;


public interface ElectronicStoreItemRepository {
    List<ItemEntity> findAllItems();

    Integer saveItem(ItemEntity itemEntity);

    ItemEntity updateItemEntity(Integer idInt, ItemEntity itemEntity);

    void deleteItem(int parseInt);

    ItemEntity findItemById(Integer idInt);

    void updateItemStock(Integer idInt, Integer stockInt);
}
 