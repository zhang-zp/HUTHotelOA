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
        if(uri.indexOf("RoomAll")>=0){
            //房间信息
            try {
                List<RoomInfo> list = roomDao.findAll();
                req.setAttribute("RoomAll",list);
                req.getRequestDispatcher("Room_All.jsp").forward(req,resp);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }else if(uri.indexOf("RoomPrice")>=0){
            //获取房间类型和价格
            try {
                List<RoomInfo> list = roomDao.getInfo();
                req.setAttribute("RoomPrice",list);
                req.getRequestDispatcher("Room_Price.jsp").forward(req,resp);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }else if(uri.indexOf("update")>=0){
            //修改房价
            try {
                String type = req.getParameter("type");
                String price = req.getParameter("price");
                System.out.println(type+price);
                double price1 = Double.parseDouble(price);
                //进行修改
                roomDao.update(type,price1);
                //获取修改后的房间类型和价格
                List<RoomInfo> list = roomDao.getInfo();
                req.setAttribute("RoomPrice",list);
                pw = resp.getWriter();
                pw.write("ms修改成功");
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        else if(uri.indexOf("RoomPreplot")>=0){

        }else if(uri.indexOf("RoomReg")>=0){
            //开房登记
            RentRoom rentRoom = new RentRoom();
            rentRoom.setPeople_name(req.getParameter("name"));
            rentRoom.setPeople_id(req.getParameter("ID"));
            rentRoom.setRent_tel(req.getParameter("tel"));
            rentRoom.setRoom_type(req.getParameter("type"));
            rentRoom.setRent_num(Integer.parseInt(req.getParameter("num")));
            rentRoom.setEnter_time(req.getParameter("enter"));
            rentRoom.setLeave_time(req.getParameter("leave"));
            rentRoom.setRent_status("已入住");
            try {
                //添加开房信息
                roomDao.addRoom(rentRoom);
                pw = resp.getWriter();
                pw.write("msg开房成功");
            } catch (SQLException e) {
//                pw = resp.getWriter();
//                pw.write("msg信息不完整，请补全信息");
                e.printStackTrace();
            }
        }else if(uri.indexOf("RoomType")>=0){
            //根据房间类型获取空闲房间
            try {
                String roomType = req.getParameter("newType");
                List<RoomInfo> freeRoom = roomDao.freeRoom(roomType);
//                System.out.println(JSON.toJSONString(freeRoom));
                resp.getWriter().write(JSON.toJSONString(freeRoom));
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }else if(uri.indexOf("ChangeRoom")>=0){
            try {
                roomDao.changeRoom(Integer.parseInt(req.getParameter("roomId")));
                pw = resp.getWriter();
                pw.print("msg换房成功");
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }else if(uri.indexOf("RoomPre")>=0){
            //房间预订
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
        }else if(uri.indexOf("Search")>=0) {
            //根据具体信息搜索房间
            String data1 = req.getParameter("data1");
            String data2 = req.getParameter("data2");
            try {
                if(data1.equals("房间类型")) {
                    List<RoomInfo> list = roomDao.searchType(data2);
//                    System.out.println(JSON.toJSONString(list));
                    resp.getWriter().write(JSON.toJSONString(list));
//                    resp.getWriter().write("msg你妈死了");

                }else{
                    List<RoomInfo> list = roomDao.searchFloor(Integer.parseInt(data2));
//                    System.out.println(JSON.toJSONString(list));
                    resp.getWriter().write(JSON.toJSONString(list));
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }else if(uri.indexOf("check")>=0){
            //退宿信息查询
            String info = req.getParameter("info");
            if(info.indexOf("1")>0){
                //电话退宿
                try {
                    System.out.println(info);
                    List<RentRoom> list = roomDao.checkByTel(info);
                    long days = roomDao.daysBetween(list.get(0).getEnter_time(),list.get(0).getLeave_time());
                    //此功能有待完善
                    list.get(0).setRent_num((int) days);
//                    System.out.println(JSON.toJSONString(list));
                    resp.getWriter().write(JSON.toJSONString(list));
                } catch (SQLException | ParseException e) {
                    e.printStackTrace();
                }
            }else{
                //名字退宿
                try {
                    System.out.println(info);
                    List<RentRoom> list = roomDao.checkByName(info);
                    long days = roomDao.daysBetween(list.get(0).getEnter_time(),list.get(0).getLeave_time());
                    //此功能有待完善
                    list.get(0).setRent_num((int) days);
                    System.out.println(JSON.toJSONString(list));
                    resp.getWriter().write(JSON.toJSONString(list));
                } catch (SQLException | ParseException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}
