package dao;

import entity.RentRoom;

import java.util.List;

public interface  Financedao {
    List<RentRoom> findorderBytime(String start, String end) throws Exception;
}
