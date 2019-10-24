package dao;

import entity.*;

import java.util.List;

public interface  Financedao {
    List<RentRoom> findorderBytime(String start, String end) throws Exception;
    List<Expend> findexpend() throws Exception;
    List<Payoff> payoff() throws  Exception;
}
