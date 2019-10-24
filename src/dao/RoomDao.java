package dao;

import entity.RoomInfo;

import java.sql.SQLException;
import java.util.List;

public interface RoomDao {
    //查看房间信息
    List<RoomInfo> findAll() throws SQLException;
    //获取房间类型和价格
    List<RoomInfo> getInfo() throws SQLException;
    //修改房间价格
    void  update(String type, double price) throws SQLException;
}
