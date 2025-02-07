package com.github.supercoding.web.dto;

import java.util.Objects;

import com.github.supercoding.repository.items.ItemEntity;

public class Item {

    private String id;
    private String name;
    private String type;
    private Integer price;
    private Spec spec;

    public Item() {
    }

    public Item(String id, ItemBody itemBody) {
      this.id = id;
      this.name = itemBody.getName();
      this.type = itemBody.getType();
      this.price = itemBody.getPrice();
      this.spec = itemBody.getSpec();
    }
    
    public Item(int id, ItemBody itemBody) {
        this.id = String.valueOf(id);  // int를 String으로 변환
        this.name = itemBody.getName();
        this.type = itemBody.getType();
        this.price = itemBody.getPrice();
        this.spec = itemBody.getSpec();  // 직접 Spec 객체를 사용
    }

    public Item(String id, String name, String type, Integer price, String cpu, String capacity) {
        this.id = id;
        this.name = name;
        this.type = type;
        this.price = price;
        this.spec = new Spec(cpu, capacity);
    }

    public Item(ItemEntity itemEntity){
        this.id = String.valueOf(itemEntity.getId());
        this.type = itemEntity.getType();
        this.price = itemEntity.getPrice();
        this.name = itemEntity.getName();
        this.spec = new Spec(itemEntity.getCpu(), itemEntity.getCapacity());
    }

    public String getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getType() {
        return type;
    }

    public Integer getPrice() {
        return price;
    }

    public Spec getSpec() {
        return spec;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (!(o instanceof Item)) {
            return false;
        }
        Item item = (Item) o;
        return id.equals(item.id);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id);
    }
}