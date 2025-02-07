package com.github.supercoding.repository.storeSales;

public interface StoreSalesRepository {

  StoreSales findStoreSalesById(Integer idInt);

  void updateSalesAmount(Integer itemId, Integer stock);
  
}
