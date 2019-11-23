package dao;

import entity.*;

import java.util.List;

public interface  Financedao {
    List<RentRoom> findorderBytime(String start, String end) throws Exception;
    List<Expend> findexpend() throws Exception;
    List<Payoff> payoff() throws  Exception;
    List<Statistic> statistic() throws Exception;
    List<StatisticYear> statisticyear() throws Exception;
    List<Statistic> selectyear(String selectyear) throws Exception;
    List<Purchase> detailfun1(String time) throws Exception;
    List<Salary> detailfun2(String time) throws Exception;
    List<RentRoom> detailfun3(String time) throws Exception;
    List<Expend> searchexpend(String search) throws Exception;
}
