package com.github.supercoding.web.controller;

import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.github.supercoding.service.ElectronicStoreItemService;
import com.github.supercoding.web.dto.BuyOrder;
import com.github.supercoding.web.dto.Item;
import com.github.supercoding.web.dto.ItemBody;

import java.util.List;

import org.springframework.web.bind.annotation.PostMapping;  
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;

@RestController
@RequestMapping("/api")
public class ElectronicStoreController {

  private ElectronicStoreItemService electronicStoreItemService;

  public ElectronicStoreController(ElectronicStoreItemService electronicStoreItemService) {
    this.electronicStoreItemService = electronicStoreItemService;
  }

  @GetMapping("/items")
  public List<Item> getAllItems() {
    return electronicStoreItemService.findAllItem();
  }

  @PostMapping("/items")
  public String registerItem(@RequestBody ItemBody itemBody){
      Integer itemId = electronicStoreItemService.savaItem(itemBody);
      return "ID: " +  itemId;
  }

  @GetMapping("/items/{id}")
  public Item getItemById(@PathVariable String id) {
    return electronicStoreItemService.findItemById(id);
  }

  @GetMapping("/items-query")
  public Item getItemByQueryId(@RequestParam("id") String id) {
    return electronicStoreItemService.findItemById(id);
  }

  @GetMapping("/items-queries")
  public List<Item> getItemByQueryId(@RequestParam("id") List<String> ids) {
    return electronicStoreItemService.findItemsByIds(ids);
  }

  @DeleteMapping("/items/{id}")
  public String deleteItemByPathId(@PathVariable String id){
      electronicStoreItemService.deleteItem(id);
      return "Object with id =" + id + "has been deleted";
  }
  
  @PutMapping("/items/{id}")
  public Item updateItem(@PathVariable String id, @RequestBody ItemBody itemBody) {
    return electronicStoreItemService.updateItem(id, itemBody);
  }

  @PostMapping("/items/buy") 
  public String buyItem(@RequestBody BuyOrder buyOrder) {
    Integer orderItemNums = electronicStoreItemService.buyItems(buyOrder);
    return "요청하신 Item 중 " + orderItemNums + "개를 구매 하였습니다.";
  }
}