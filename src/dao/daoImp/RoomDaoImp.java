package dao.daoImp;

import dao.RoomDao;
import entity.RentRoom;
import entity.RoomInfo;
import entity.Select;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import utils.C3p0Utils;

import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
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

    @Override
    //根据房间类型拿到空闲房间
    public List<RoomInfo> freeRoom(String roomType) throws SQLException {
        String sql = "select * from room_info where room_status = '空闲' and room_type = ?";
        return queryRunner.query(sql,new BeanListHandler<RoomInfo>(RoomInfo.class),roomType);
    }

    @Override
    //更换房间
    public void changeRoom(int id) throws SQLException {
        String sql = "update room_info set room_status = '已入住' where room_id = ?";
        queryRunner.update(sql,id);
    }

    @Override
    //根据第一个select的选择进行搜索
    public List<Select> searchOne(String search) throws SQLException {
        String sql = "select distinct(?) as moreInfo from room_info";
        return queryRunner.query(sql,new BeanListHandler<Select>(Select.class),search);

    }

    @Override
    //根据类型查找所有房间
    public List<RoomInfo> searchType(String type) throws SQLException {
        String sql = "select * from room_info where room_type = ?";
        return queryRunner.query(sql,new BeanListHandler<RoomInfo>(RoomInfo.class),type);
    }

    @Override
    //根据楼层查找所有房间
    public List<RoomInfo> searchFloor(int floor) throws SQLException {
        String sql = "select * from room_info where room_floor = ?";
        return queryRunner.query(sql,new BeanListHandler<RoomInfo>(RoomInfo.class),floor);

    }

    @Override
    //根据姓名退宿
    public List<RentRoom> checkByName(String name) throws SQLException {
        String sql = "select * from rent_room where people_name = ?";
        return queryRunner.query(sql,new BeanListHandler<RentRoom>(RentRoom.class),name);
    }

    @Override
    //根据电话号码退宿
    public List<RentRoom> checkByTel(String tel) throws SQLException {
        String sql = "select * from rent_room where people_tel = ?";
        return queryRunner.query(sql,new BeanListHandler<RentRoom>(RentRoom.class),tel);
    }

    @Override
    //计算住宿的天数
    public int daysBetween(String date1, String date2) throws ParseException {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date d1 = sdf.parse(String.valueOf(date1));
        Date d2 = sdf.parse(String.valueOf(date1));
        long days = (d2.getTime()-d1.getTime())/(1000*60*60*24);
        return (int) days;
    }


}
