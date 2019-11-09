package dao;

import entity.RentRoom;
import entity.RoomInfo;
import entity.Select;

import java.sql.SQLException;
import java.text.ParseException;
import java.util.Date;
import java.util.List;

public interface RoomDao {
    //查看房间信息
    List<RoomInfo> findAll() throws SQLException;
    //获取房间类型和价格
    List<RoomInfo> getInfo() throws SQLException;
    //修改房间价格
    void  update(String type, double price) throws SQLException;
    //预定管理
    List<RentRoom> preplot() throws SQLException;
    //开房
    void addRoom(RentRoom rentRoom) throws SQLException;
    //根据房间类型查找空闲房间
    List<RoomInfo> freeRoom(String roomType) throws SQLException;
    //更换房间
    void changeRoom(int id) throws SQLException;
    //根据第一个select的选择进行搜索
    List<Select> searchOne(String search) throws SQLException;
    //根据类型查找所有房间
    List<RoomInfo> searchType(String type) throws SQLException;
    //根据楼层查找所有房间
    List<RoomInfo> searchFloor(int floor) throws SQLException;
    //根据姓名退宿
    List<RentRoom> checkByName(String name) throws SQLException;
    //根据电话号码退宿
    List<RentRoom> checkByTel(String tel) throws SQLException;
    //计算住宿的天数
    int daysBetween(String date1, String date2) throws ParseException;
}
