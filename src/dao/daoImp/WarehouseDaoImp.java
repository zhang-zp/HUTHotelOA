package dao.daoImp;

import dao.WarehouseDao;
import entity.Distribute;
import entity.Purchase;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import utils.C3p0Utils;

import java.sql.SQLException;
import java.util.List;

public class WarehouseDaoImp implements WarehouseDao {
    static QueryRunner queryRunner = new QueryRunner(C3p0Utils.getDataSource());

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


    public  int goodsNum(String goods_name) throws SQLException {
        String sql = "select goods_num from purchase where goods_name=?";
        Purchase purchase = queryRunner.query(sql,new BeanHandler<Purchase>(Purchase.class),goods_name);
        return purchase.getGoods_num();
    }

    @Override
    public void distribute(Distribute distribute) throws SQLException {
        String sql = "insert into distribute(goods_name,goods_num,distri_path,distri_time,receiver)values(?,?,?,?,?)";
        queryRunner.update(sql,distribute.getGoods_name(),distribute.getGoods_num(),distribute.getDistri_path(),
                distribute.getDistri_time(),distribute.getReceiver());
    }

    @Override
    public List<Purchase> buyRecord() throws SQLException {
        String sql = "select * from purchase,goods where goods.goods_name=purchase.goods_name";
        return queryRunner.query(sql,new BeanListHandler<Purchase>(Purchase.class));
    }

    @Override
    public List<Distribute> outRecord() throws SQLException {
        String sql = "select * from distribute,goods where distribute.goods_name=goods.goods_name";
        return queryRunner.query(sql,new BeanListHandler<Distribute>(Distribute.class));
    }

}

