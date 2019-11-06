package dao;

import entity.Purchase;

import java.sql.SQLException;
import java.util.List;

/**
 * 仓库管理层
 */
public interface WarehouseDao {

    /**
     * 采购商品
     * @param purchase
     */
    void ProcureOfGoods(Purchase purchase) throws SQLException;

    /**
     * 展示最新的采购表信息
     * @return
     * @throws SQLException
     */
    List<Purchase>goodsRecord() throws SQLException;

    /**
     * 查询商品剩余数量
     * @param goods_name
     * @return
     */
    int goodsNum(String goods_name) throws SQLException;
}
