package dao;

import entity.RentRoom;
import entity.RoomInfo;
import entity.Select;

import java.sql.SQLException;
import java.text.ParseException;
import java.util.List;

public interface RoomDao {
    //查看房间信息
    List<RoomInfo> findAll() throws SQLException;
    //获取房间类型和价格
    List<RoomInfo> getInfo() throws SQLException;
    //修改房间价格
    void update(String type, double price) throws SQLException;
    //预定管理
    List<RentRoom> preplot() throws SQLException;
    //开房
    void addRoom(RentRoom rentRoom) throws SQLException;
    //根据房间类型查找空闲房间
    List<RoomInfo> freeRoom(String roomType) throws SQLException;
    //更换房间
    void changeRoom(int reRoomId, int newRoomId,String rentId) throws SQLException;
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
    long daysBetween(String date1, String date2) throws ParseException;
    //根据房间类型查看价格
    List<RoomInfo> price(String type) throws SQLException;
    //修改房间状态
    void status(int roomId) throws SQLException;
    //楼层加类型
    List<RoomInfo> sel(int floor, String type) throws SQLException;
    //获取订单编号
    String time();
    //退房
    void leaveRoom(String rentId, String roomId) throws SQLException;
    //换房时根据手机号查询信息
    List<RentRoom> look(String tel) throws SQLException;
    //时间限制
    String enterDate();

}
