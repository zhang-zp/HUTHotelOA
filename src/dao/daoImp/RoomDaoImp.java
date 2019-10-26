package dao.daoImp;

import dao.RoomDao;
import entity.RentRoom;
import entity.RoomInfo;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import utils.C3p0Utils;

import java.sql.SQLException;
import java.util.List;

public class RoomDaoImp implements RoomDao {
    QueryRunner queryRunner = new QueryRunner(C3p0Utils.getDataSource());


    @Override
    //查看房间信息
    public List<RoomInfo> findAll() throws SQLException {
        String sql = "select * from room_info";
        return queryRunner.query(sql,new BeanListHandler<RoomInfo>(RoomInfo.class));
    }

    @Override
    //获取房间类型和价格
    public List<RoomInfo> getInfo() throws SQLException {
        String sql = "select DISTINCT(room_type),room_price from ROOM_INFO ORDER BY ROOM_PRICE";
        return queryRunner.query(sql,new BeanListHandler<RoomInfo>(RoomInfo.class));
    }

    @Override
    //修改房间价格
    public void update(String type, double price) throws SQLException {
        String sql = "update ROOM_INFO set room_price = ? where ROOM_TYPE = ?";
        queryRunner.update(sql,price,type);
    }

    @Override
    //预定管理
    public List<RentRoom> preplot() throws SQLException {
        return null;
    }

    @Override
    //开房
    public  void addRoom(RentRoom rentRoom) throws SQLException {
        String sql = "insert into rent_room values(?,?,?,?,?,?,?,?)";
         queryRunner.update(sql,rentRoom.getPeople_name(),rentRoom.getPeople_id(),rentRoom.getRoom_type(), rentRoom.getRent_num(),
                 rentRoom.getEnter_time(),rentRoom.getLeave_time(),rentRoom.getRent_status(),rentRoom.getRent_tel());
    }


}
