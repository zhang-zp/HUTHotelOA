package dao.daoImp;

import dao.Financedao;
import entity.RentRoom;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import utils.C3p0Utils;

import java.util.List;

public class FinanceImp implements Financedao {
    QueryRunner queryRunner = new QueryRunner(C3p0Utils.getDataSource());
    @Override
    public List<RentRoom> findorderBytime(String start,String end) throws Exception {

        String sql="select * from rent_room where enter_time<=? and leave_time>=? and rent_status="+"已完成";
        return queryRunner.query(sql,new BeanListHandler<RentRoom>(RentRoom.class),start,end);
    }
}
