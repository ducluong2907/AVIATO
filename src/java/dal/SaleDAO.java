/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Role;
import model.User;
import model.order.Order;
import model.order.OrderDetail;
import model.order.OrderState;

/**
 *
 * @author hophu
 */
public class SaleDAO extends DBContext {
//    public int getTotalOrder(){
//        String 
//    }

    public static void main(String[] args) {
        SaleDAO sd = new SaleDAO();
//        List<User> list = s.getAllSale();
//        System.out.println(list.get(0).getFullname());

        int totalSuccess = sd.getTotalSuccessByUserID(3, 2022, 5, 2, 9);
//        List<Order> list = s.sortListOrderByUserID(3);
//        System.out.println(list.get(0).getAmount());
        System.out.println(totalSuccess);
    }

    public List<String> getDayLatestByID(int id, int year, int month, int startDay, int endDay) {
        ControllUser d = new ControllUser();
        OrderDAO od = new OrderDAO();
        List<String> list = new ArrayList<>();
        String total ="";
        String sql = "select top 7 sum(amount) as Total, Day(orderDate) as date from [Order] where stateID=1 and userID = ?\n"
                + "and YEAR(orderDate) =? and MONTH(orderDate) = ? and DAY(orderDate) between ? and ?\n"
                + "group by orderDate\n"
                + "order by orderDate desc";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.setInt(2, year);
            st.setInt(3, month);
            st.setInt(4, startDay);
            st.setInt(5, endDay);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                total = rs.getString(2);
                list.add(total);
            }
        } catch (Exception e) {
        }

        return list;
    }

    public List<String> getDayLatest(int year, int month, int startDay, int endDay) {
        ControllUser d = new ControllUser();
        OrderDAO od = new OrderDAO();
        List<String> list = new ArrayList<>();
        String total = "";
        String sql = "select top 7 sum(amount) as Total, Day(orderDate) as date from [Order] where stateID=1\n"
                + "and YEAR(orderDate) =? and MONTH(orderDate) = ? and DAY(orderDate) between ? and ?\n"
                + "group by orderDate\n"
                + "order by orderDate desc";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, year);
            st.setInt(2, month);
            st.setInt(3, startDay);
            st.setInt(4, endDay);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                total = rs.getString(2);
                list.add(total);
            }
        } catch (Exception e) {
        }

        return list;
    }

    public List<Double> sortListOrderByUserID(int id, int year, int month, int startDay, int endDay) {
        ControllUser d = new ControllUser();
        OrderDAO od = new OrderDAO();
        List<Double> list = new ArrayList<>();
        double total = 0.0;
        String sql = "select top 7 sum(amount) as Total from [Order] where stateID=1 and userID = ?\n"
                + "and YEAR(orderDate) =? and MONTH(orderDate) = ? and DAY(orderDate) between ? and ?\n"
                + "group by orderDate\n"
                + "order by orderDate desc";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.setInt(2, year);
            st.setInt(3, month);
            st.setInt(4, startDay);
            st.setInt(5, endDay);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                total = rs.getDouble(1);
                list.add(total);
            }
        } catch (Exception e) {
        }

        return list;
    }

    public List<Double> sortListOrder(int year, int month, int startDay, int endDay) {
        ControllUser d = new ControllUser();
        OrderDAO od = new OrderDAO();
        List<Double> list = new ArrayList<>();
        double total = 0.0;
        String sql = "select top 7 sum(amount) as Total from [Order] where stateID=1\n"
                + "and YEAR(orderDate) =? and MONTH(orderDate) = ? and DAY(orderDate) between ? and ?\n"
                + "group by orderDate\n"
                + "order by orderDate desc";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, year);
            st.setInt(2, month);
            st.setInt(3, startDay);
            st.setInt(4, endDay);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                total = rs.getDouble(1);
                list.add(total);
            }
        } catch (Exception e) {
        }

        return list;
    }

    public List<Order> getListOrder(int year, int month, int startDay, int endDay) {
        ControllUser d = new ControllUser();
        OrderDAO od = new OrderDAO();
        List<Order> list = new ArrayList<>();
        String sql = "select * from [Order] where stateID=1 "
                + "and YEAR(orderDate) =? and MONTH(orderDate) = ? and DAY(orderDate) between ? and ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, year);
            st.setInt(2, month);
            st.setInt(3, startDay);
            st.setInt(4, endDay);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                User account = d.getUser(rs.getInt(2));
                OrderState o_state = od.getOrderStateByID(rs.getInt(5));
                List<OrderDetail> listOrderDetail = od.getListOfOrder(rs.getInt(1));
                Order o = new Order(rs.getInt(1), account, rs.getString(3), rs.getDouble(4), o_state, listOrderDetail);
                list.add(o);
            }
        } catch (Exception e) {
        }

        return list;
    }

    public List<Order> getListOrderByUserID(int id, int year, int month, int startDay, int endDay) {
        ControllUser d = new ControllUser();
        OrderDAO od = new OrderDAO();
        List<Order> list = new ArrayList<>();
        String sql = "select * from [Order] where stateID=1 and userID=? "
                + "and YEAR(orderDate) =? and MONTH(orderDate) = ? and DAY(orderDate) between ? and ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.setInt(2, year);
            st.setInt(3, month);
            st.setInt(4, startDay);
            st.setInt(5, endDay);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                User account = d.getUser(rs.getInt(2));
                OrderState o_state = od.getOrderStateByID(rs.getInt(5));
                List<OrderDetail> listOrderDetail = od.getListOfOrder(rs.getInt(1));
                Order o = new Order(rs.getInt(1), account, rs.getString(3), rs.getDouble(4), o_state, listOrderDetail);
                list.add(o);
            }
        } catch (Exception e) {
        }

        return list;
    }

    public int getTotalSuccess(int year, int month, int startDay, int endDay) {
        String sql = "select count(*) from [Order] where stateID =1 "
                + "and YEAR(orderDate) =? and MONTH(orderDate) = ? and DAY(orderDate) between ? and ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, year);
            st.setInt(2, month);
            st.setInt(3, startDay);
            st.setInt(4, endDay);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return 0;
    }

    /*
    and YEAR(orderDate) =2022 and MONTH(orderDate) = 5 and DAY(orderDate) between 2 and 9
     */
    public int getTotalSuccessByUserID(int id, int year, int month, int startDay, int endDay) {
        String sql = "select count(*) from [Order] where stateID = 1 and userID = ? "
                + "and YEAR(orderDate) =? and MONTH(orderDate) = ? and DAY(orderDate) between ? and ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.setInt(2, year);
            st.setInt(3, month);
            st.setInt(4, startDay);
            st.setInt(5, endDay);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return 0;
    }

    public int getTotalOrder(int year, int month, int startDay, int endDay) {
        String query = "select count(*) from [Order] where YEAR(orderDate) =? and MONTH(orderDate) = ? and DAY(orderDate) between ? and ? ";
        try {
            PreparedStatement st = connection.prepareStatement(query);
            st.setInt(1, year);
            st.setInt(2, month);
            st.setInt(3, startDay);
            st.setInt(4, endDay);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return 0;
    }

    public int getTotalOrderByID(int id, int year, int month, int startDay, int endDay) {
        String query = "select count(*) from [Order] where userID = ? "
                + "and YEAR(orderDate) =? and MONTH(orderDate) = ? and DAY(orderDate) between ? and ?";
        try {
            PreparedStatement st = connection.prepareStatement(query);
            st.setInt(1, id);
            st.setInt(2, year);
            st.setInt(3, month);
            st.setInt(4, startDay);
            st.setInt(5, endDay);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return 0;
    }

    public List<User> getAllSale() {
        List<User> list = new ArrayList<>();
        String sql = "select * from [User] where userRole=3";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Role x = new Role(rs.getInt(11), "");
                User u = new User(rs.getInt("userID"),
                        rs.getString("userName"),
                        rs.getString("userPass"),
                        rs.getString("fullName"),
                        rs.getString("userAvatar"),
                        rs.getString("userAdress"),
                        rs.getString("userBirth"),
                        rs.getBoolean("userGender"),
                        rs.getString("userEmail"),
                        rs.getString("userPhone"),
                        x,
                        rs.getInt("uStatusId"));
                list.add(u);
            }
        } catch (Exception e) {
        }
        return list;
    }
}
