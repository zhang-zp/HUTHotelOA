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
        String sql="SELECT * from SALARY,STAFF_INFO where STAFF_INFO.STAFF_ID=SALARY.STAFF_ID order by salary_time";
        return queryRunner.query(sql,new BeanListHandler<Payoff>(Payoff.class));
    }

    @Override
    public List<Statistic> statistic() throws Exception {
        String sql="select * from \n" +
                "(select * from (select  to_char(to_date(ENTER_TIME,'yyyy-mm-dd'),'yyyy-mm') as month,sum(room_price) as room_price from rent_room GROUP BY to_char(to_date(ENTER_TIME,'yyyy-mm-dd'),'yyyy-mm') ORDER BY month)  t1 full join  \n" +
                "              (select  to_char(to_date(goods_time,'yyyy-mm-dd'),'yyyy-mm') as month1,sum(goods_price*goods_num) as goods_price from purchase GROUP BY to_char(to_date(goods_time,'yyyy-mm-dd'),'yyyy-mm') ORDER BY month1)  t2  \n" +
                "              on t1.month=t2.month1) t3 full join \n" +
                "              (select  to_char(to_date(salary_time,'yyyy-mm-dd'),'yyyy-mm') as month2,sum(renish_amount) as salary_price from salary GROUP BY to_char(to_date(salary_time,'yyyy-mm-dd'),'yyyy-mm') ORDER BY month2) t4\n" +
                "              on t3.month=t4.month2";
        return queryRunner.query(sql,new BeanListHandler<Statistic>(Statistic.class));
    }

    @Override
    public List<StatisticYear> statisticyear() throws Exception {
        String sql="select * from \n" +
                "(select * from (select  to_char(to_date(ENTER_TIME,'yyyy-mm-dd'),'yyyy') as year,sum(room_price) as room_price from rent_room GROUP BY to_char(to_date(ENTER_TIME,'yyyy-mm-dd'),'yyyy') ORDER BY year)  t1 full join  \n" +
                "              (select  to_char(to_date(goods_time,'yyyy-mm-dd'),'yyyy') as year1,sum(goods_price*goods_num) as goods_price from purchase GROUP BY to_char(to_date(goods_time,'yyyy-mm-dd'),'yyyy') ORDER BY year1)  t2  \n" +
                "              on t1.year=t2.year1) t3 full join \n" +
                "              (select  to_char(to_date(salary_time,'yyyy-mm-dd'),'yyyy') as year2,sum(renish_amount) as salary_price from salary GROUP BY to_char(to_date(salary_time,'yyyy-mm-dd'),'yyyy') ORDER BY year2) t4\n" +
                "              on t3.year=t4.year2";
        return queryRunner.query(sql,new BeanListHandler<StatisticYear>(StatisticYear.class));
    }

}
