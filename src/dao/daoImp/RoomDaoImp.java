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
import java.util.Calendar;
import java.util.Date;
import java.util.List;

public class RoomDaoImp implements RoomDao {
    QueryRunner queryRunner = new QueryRunner(C3p0Utils.getDataSource());

    @Override
    //查看房间信息
    public List<RoomInfo> findAll() throws SQLException {
        String sql = "select * from room_info order by room_id";
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
        String sql = "insert into RENT_ROOM " +
                "(rent_id,PEOPLE_NAME,PEOPLE_ID,RENT_TEL,ROOM_TYPE,room_id,room_price,RENT_NUM,ENTER_TIME,LEAVE_TIME,RENT_STATUS) " +
                "VALUES(?,?,?,?,?,?,?,?,?,?,?)";
         queryRunner.update(sql,rentRoom.getRent_id(),rentRoom.getPeople_name(),rentRoom.getPeople_id(),
                 rentRoom.getRent_tel(),rentRoom.getRoom_type(),rentRoom.getRoom_id(),rentRoom.getRoom_price(),rentRoom.getRent_num(),
                 rentRoom.getEnter_time(),rentRoom.getLeave_time(),rentRoom.getRent_status());
    }

    @Override
    //根据房间类型拿到空闲房间
    public List<RoomInfo> freeRoom(String roomType) throws SQLException {
        String sql = "select * from room_info where room_status = '空闲' and room_type = ?";
        return queryRunner.query(sql,new BeanListHandler<RoomInfo>(RoomInfo.class),roomType);
    }

    @Override
    //更换房间
    public void changeRoom(int reRoomId, int newRoomId, String rentId) throws SQLException {
        //修改新房间状态
        String sql1 = "update room_info set room_status = '已入住' where room_id = ?";
        //修改老房间状态
        String sql2 = "update room_info set room_status = '空闲' where room_id = ?";
        //修改对应订单的信息
        String sql3 = "update rent_room set room_id = ? where rent_id = ?";
        queryRunner.update(sql1,newRoomId);
        queryRunner.update(sql2,reRoomId);
        queryRunner.update(sql3,newRoomId,rentId);
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
        String sql = "select * from rent_room where rent_tel = ?";
        return queryRunner.query(sql,new BeanListHandler<RentRoom>(RentRoom.class),tel);
    }

    @Override
    //修改房间状态
    public void status(int roomId) throws SQLException {
        String sql = "update ROOM_INFO set room_status = '已入住' where ROOM_ID = ?";
        queryRunner.update(sql,roomId);
    }

    @Override
    public List<RoomInfo> sel(int floor, String type) throws SQLException {
        String sql = "select * from room_info where room_floor = ? and room_type = ?";
        return queryRunner.query(sql,new BeanListHandler<RoomInfo>(RoomInfo.class),floor,type);
    }

    @Override
    //获取订单编号
    public String time() {
        Calendar calendar = Calendar.getInstance();
        SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
        return formatter.format(calendar.getTime());
    }

    @Override
    //退房
    public void leaveRoom(String rentId,String roomId) throws SQLException {
        String sql1 = "update ROOM_INFO set room_status = '空闲' where ROOM_ID = ?";
        String sql2 = "update RENT_ROOM set Rent_STATUS  = '已完成' where rent_id = ?";
        queryRunner.update(sql1,roomId);
        queryRunner.update(sql2,rentId);
    }

    @Override
    //换房时根据手机号查询信息
    public List<RentRoom> look(String tel) throws SQLException {
        String sql = "select * from rent_room where rent_tel = ?";
        return queryRunner.query(sql, new BeanListHandler<RentRoom>(RentRoom.class),tel);
    }

    @Override
    //入住时间限制
    public String enterDate() {
        Calendar calendar = Calendar.getInstance();
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        Date date_now = new Date();
        calendar.setTime(date_now);
        int day=calendar.get(Calendar.DATE);
        calendar.set(Calendar.DATE,day+1);
        return formatter.format(date_now)+formatter.format(calendar.getTime());
    }

    @Override
    //计算住宿的天数
    public long daysBetween(String date1, String date2) throws ParseException {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date d1 = sdf.parse(String.valueOf(date1));
        Date d2 = sdf.parse(String.valueOf(date2));
        long days = (d2.getTime()-d1.getTime())/(1000*60*60*24);
        return days;
    }

    @Override
    public List<RoomInfo> price(String type) throws SQLException {
        String sql = "select * from ROOM_INFO where room_type = ?";
        return queryRunner.query(sql,new BeanListHandler<RoomInfo>(RoomInfo.class),type);
    }


}
