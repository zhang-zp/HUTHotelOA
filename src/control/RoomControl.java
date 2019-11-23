package control;

import com.alibaba.fastjson.JSON;
import dao.RoomDao;
import dao.daoImp.RoomDaoImp;
import entity.RentRoom;
import entity.RoomInfo;
import entity.Select;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.List;

@WebServlet("*.room")
public class RoomControl extends HttpServlet {

        RoomDao roomDao = new RoomDaoImp();
        RentRoom rentRoom = new RentRoom();
        PrintWriter pw ;
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String uri = req.getRequestURI();
            //房间信息
        if(uri.indexOf("RoomAll")>=0){
            try {
                List<RoomInfo> list = roomDao.findAll();
                req.setAttribute("RoomAll",list);
                req.getRequestDispatcher("Room_All.jsp").forward(req,resp);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
            //获取房间类型和价格
        else if(uri.indexOf("RoomPrice")>=0){
            try {
                List<RoomInfo> list = roomDao.getInfo();
                req.setAttribute("RoomPrice",list);
                req.getRequestDispatcher("Room_Price.jsp").forward(req,resp);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
            //修改房价
        else if(uri.indexOf("update")>=0){
            try {
                String type = req.getParameter("type");
                String price = req.getParameter("price");
                double price1 = Double.parseDouble(price);
                String reg = "/^[+]{0,1}(\\d+)$|^[+]{0,1}(\\d+\\.\\d+)$/";
                //进行修改
                if(price1>0){
                    roomDao.update(type,price1);
                    //获取修改后的房间类型和价格
                    List<RoomInfo> list = roomDao.getInfo();
                    req.setAttribute("RoomPrice",list);
                    resp.getWriter().write("修改成功");
                }else{
                    resp.getWriter().write("价格需为正数");
                }

            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
            //开房登记
        else if(uri.indexOf("RoomReg")>=0){
            RentRoom rentRoom = new RentRoom();
            rentRoom.setRent_id(req.getParameter("bookId"));
            rentRoom.setRoom_price(req.getParameter("price"));
            rentRoom.setRoom_id(req.getParameter("roomId"));
            rentRoom.setPeople_name(req.getParameter("name"));
            rentRoom.setPeople_id(req.getParameter("ID"));
            rentRoom.setRent_tel(req.getParameter("tel"));
            rentRoom.setRoom_type(req.getParameter("type"));
            rentRoom.setRent_num(1);
            rentRoom.setEnter_time(req.getParameter("enter"));
            rentRoom.setLeave_time(req.getParameter("leave"));
            rentRoom.setRent_status("已入住");
            System.out.println(rentRoom.getEnter_time()+rentRoom.getLeave_time());
            if(rentRoom.getEnter_time().indexOf("1")<0||rentRoom.getLeave_time().indexOf("1")<0){
                resp.getWriter().write("请检查补全信息");
            }else{
                try {
                    //添加开房信息
                    roomDao.addRoom(rentRoom);
                    //修改房间状态
                    roomDao.status(Integer.parseInt(req.getParameter("roomId")));
                    resp.getWriter().write("开房成功");
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }

        }
            //根据房间类型获取空闲房间
        else if(uri.indexOf("RoomType")>=0){
            try {
                String roomType = req.getParameter("newType");
                List<RoomInfo> freeRoom = roomDao.freeRoom(roomType);
//                System.out.println(JSON.toJSONString(freeRoom));
                resp.getWriter().write(JSON.toJSONString(freeRoom));
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
            //换房
        else if(uri.indexOf("ChangeRoom")>=0){
            String reRoomId = req.getParameter("reRoomId");
            String newRoomId = req.getParameter("newRoomId");
            String rentId = req.getParameter("rentId");
            String changeTime = req.getParameter("changeTime");
            try {
                roomDao.changeRoom(Integer.parseInt(req.getParameter("reRoomId")),
                        Integer.parseInt(req.getParameter("newRoomId")),rentId);
                resp.getWriter().write("换房成功");
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
            //换房时根据手机号查询信息
        else if(uri.indexOf("look")>=0){
            String tel = req.getParameter("tel");
            try {
                List<RentRoom> list = roomDao.look(tel);
                System.out.println(JSON.toJSONString(list));
                resp.getWriter().write(JSON.toJSONString(list));
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
            //房间预订
        else if(uri.indexOf("RoomPre")>=0){
                RentRoom preRoom = new RentRoom();
                preRoom.setPeople_name(req.getParameter("pName"));
                preRoom.setPeople_id(req.getParameter("pID"));
                preRoom.setRent_tel(req.getParameter("pTel"));
                preRoom.setRoom_type(req.getParameter("pType"));
                preRoom.setRent_num(Integer.parseInt(req.getParameter("pNum")));
                preRoom.setEnter_time(req.getParameter("pEnter"));
                preRoom.setLeave_time(req.getParameter("pLeave"));
                preRoom.setRent_status("已预订");
            try {
                //添加开房信息
                roomDao.addRoom(preRoom);
                pw = resp.getWriter();
                pw.write("msg预订成功");
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
            //根据具体信息搜索房间
        else if(uri.indexOf("Search")>=0) {
            String data1 = req.getParameter("data1");
            String data2 = req.getParameter("data2");
            try {
                List<RoomInfo> list = roomDao.sel(Integer.parseInt(data1),data2);
                resp.getWriter().write(JSON.toJSONString(list));
            } catch (SQLException e) {
                e.printStackTrace();
            }
//            try {
//                if(data1.equals("房间类型")) {
//                    List<RoomInfo> list = roomDao.searchType(data2);
////                    System.out.println(JSON.toJSONString(list));
//                    resp.getWriter().write(JSON.toJSONString(list));
////                    resp.getWriter().write("msg你妈死了");
//
//                }else{
//                    List<RoomInfo> list = roomDao.searchFloor(Integer.parseInt(data2));
////                    System.out.println(JSON.toJSONString(list));
//                    resp.getWriter().write(JSON.toJSONString(list));
//                }
//            } catch (SQLException e) {
//                e.printStackTrace();
//            }
        }
            //退宿信息查询
        else if(uri.indexOf("check")>=0){
            String info = req.getParameter("info");
            if(info.indexOf("1")>0){
                //电话退宿
                try {
                    List<RentRoom> list = roomDao.checkByTel(info);
                    long days = roomDao.daysBetween(list.get(0).getEnter_time(),list.get(0).getLeave_time());
                    list.get(0).setRent_num((int) days);
                    resp.getWriter().write(JSON.toJSONString(list));
                } catch (SQLException | ParseException e) {
                    e.printStackTrace();
                }
            }else{
                //名字退宿
                try {
                    List<RentRoom> list = roomDao.checkByName(info);
                    long days = roomDao.daysBetween(list.get(0).getEnter_time(),list.get(0).getLeave_time());
                    list.get(0).setRent_num((int) days*Integer.parseInt(list.get(0).getRoom_price()));
                    resp.getWriter().write(JSON.toJSONString(list));
                } catch (SQLException | ParseException e) {
                    e.printStackTrace();
                }
            }
        }
            //开房时根据房间类型拿到价格
        else if(uri.indexOf("regPrice")>=0){
                String type = req.getParameter("newType");
            try {
                List<RoomInfo> list = roomDao.price(type);
                resp.getWriter().write(JSON.toJSONString(list));
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
            //获取订单编号
        else if(uri.indexOf("get")>=0){
            resp.getWriter().write(JSON.toJSONString(roomDao.time()+roomDao.enterDate()));
        }
            //点击退宿
        else if(uri.indexOf("leave")>=0){
            String roomId = req.getParameter("roomId");
            String rentId = req.getParameter("rentId");
            try {
                roomDao.leaveRoom(rentId,roomId);
                resp.getWriter().write("退房成功");
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
