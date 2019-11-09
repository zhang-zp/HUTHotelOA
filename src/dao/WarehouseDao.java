package dao;

import entity.Distribute;
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

    /**
     * 商品分配
     * @param distribute
     */
    void distribute(Distribute distribute) throws SQLException;

    /**
     * 物品记录--采购记录
     * @return
     */
    List<Purchase>buyRecord() throws SQLException;

    /**
     * 物品记录--分发记录
     * @return
     */
    List<Distribute>outRecord() throws SQLException;
}
