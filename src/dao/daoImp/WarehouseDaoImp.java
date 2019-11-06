package dao.daoImp;

import dao.WarehouseDao;
import entity.Purchase;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;
import utils.C3p0Utils;

import java.sql.SQLException;
import java.util.List;

public class WarehouseDaoImp implements WarehouseDao {
    QueryRunner queryRunner = new QueryRunner(C3p0Utils.getDataSource());

    @Override
    public void ProcureOfGoods(Purchase purchase) throws SQLException {
        String sql = "insert into purchase(goods_id,goods_name,goods_price,goods_num,goods_time," +
                "purchaseAgent)values(?,?,?,?,?,?)";
        queryRunner.update(sql,purchase.getGoods_id(),purchase.getGoods_name(),purchase.getGoods_price(),
                purchase.getGoods_num(),purchase.getGoods_time(),purchase.getPurchaseAgent());
    }

    @Override
    public List<Purchase> goodsRecord() throws SQLException {
        String sql = "select * from purchase";
        return queryRunner.query(sql,new BeanListHandler<Purchase>(Purchase.class));
    }

    @Override
    public int goodsNum(String goods_name) throws SQLException {
        String sql = "select goods_num from purchase where goods_name=?";
        return (int) queryRunner.query(sql,new ScalarHandler(1),goods_name);
    }

}

