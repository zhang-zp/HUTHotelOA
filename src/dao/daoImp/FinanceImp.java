package dao.daoImp;

import dao.Financedao;
import entity.*;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import utils.C3p0Utils;

import java.util.List;

public class FinanceImp implements Financedao {
    QueryRunner queryRunner = new QueryRunner(C3p0Utils.getDataSource());
    @Override
    public List<RentRoom> findorderBytime(String start,String end) throws Exception {
        String sql="select * from rent_room where enter_time>=? and leave_time<=? and rent_status='已完成'";
        return queryRunner.query(sql,new BeanListHandler<RentRoom>(RentRoom.class),start,end);
    }


    @Override
    public List<Expend> findexpend() throws Exception {
        String sql="select SALARY_TIME,GOODS_TIME,GOODS_PRICE*goods_num as GOODS_PRICE,sum(RENISH_AMOUNT) as renish_amount from purchase full join salary on goods_time=salary_time  GROUP BY SALARY_TIME,GOODS_TIME,GOODS_PRICE,goods_num";
        return queryRunner.query(sql,new BeanListHandler<Expend>(Expend.class));
    }

    @Override
    public List<Payoff> payoff() throws Exception {
        String sql="SELECT * from SALARY,STAFF_INFO where STAFF_INFO.STAFF_ID=SALARY.STAFF_ID";
        return queryRunner.query(sql,new BeanListHandler<Payoff>(Payoff.class));
    }

}
