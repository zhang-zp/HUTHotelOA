package control;


import dao.WarehouseDao;
import dao.daoImp.WarehouseDaoImp;
import entity.Purchase;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

@WebServlet("*.goods")
public class GoodsControl extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String uri = req.getRequestURI();
        PrintWriter pw = resp.getWriter();
        WarehouseDao warehouseDao = new WarehouseDaoImp();

//        采购记录
        if(uri.indexOf("showRecord")>=0){
            List<Purchase>list = null;
            try {
                list = warehouseDao.goodsRecord();
                req.getSession().setAttribute("goodsRecord",list);
//                req.getRequestDispatcher("warehouse_buyshop.jsp").forward(req,resp);
                req.getRequestDispatcher("dataTable.jsp").forward(req,resp);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }else if(uri.indexOf("buyShopAction")>=0){//采购商品
////  获取前台的值
//            String goods_name = req.getParameter("goods_name");
//            String goods_price = req.getParameter("goods_price");
//            String goods_count = req.getParameter("goods_count");
//            String goods_time = req.getParameter("goods_time");
//            String goods_man = req.getParameter("goods_man");
//            System.out.println(goods_count+goods_name+goods_price+goods_time+goods_man);
//  构建商品对象
            Purchase purchase = new Purchase();
            purchase.setGoods_name(req.getParameter("goods_name"));
            if(req.getParameter("goods_count")!=null){
                int goods_num = Integer.parseInt(req.getParameter("goods_count"));
                purchase.setGoods_num(goods_num);
            }
            if(req.getRequestDispatcher("goods_price")!=null){
                double double_price = Double.parseDouble(req.getParameter("goods_price"));
                purchase.setGoods_price(double_price);
            }
            purchase.setGoods_time(req.getParameter("goods_time"));
            purchase.setPurchaseAgent(req.getParameter("goods_man"));
            try {
//                采购商品插入到对应表中
                warehouseDao.ProcureOfGoods(purchase);
//                重新获取到最新的进货表内容
                List<Purchase>list = warehouseDao.goodsRecord();
                req.getSession().setAttribute("goodsRecord",list);
                req.getRequestDispatcher("warehouse_buyshop.jsp").forward(req,resp);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }else if(uri.indexOf("CheckGoodsNum")>=0){
            int goodsNum = Integer.parseInt(req.getParameter("GoodsNum"));
            String goodsName = req.getParameter("GoodsName");
            System.out.println(goodsName+goodsNum);
            System.out.println("来了老弟");
            try {
                if(warehouseDao.goodsNum(goodsName)<goodsNum){
                    pw.write("数量不足");
                }else {
                    pw.write("数量充足");
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }else if(uri.indexOf("shopout")>=0){//商品分发
            System.out.println("商品分发");
        }
    }
}
