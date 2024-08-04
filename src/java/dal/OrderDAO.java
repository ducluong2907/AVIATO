package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import model.User;
import model.order.Order;
import model.order.OrderDetail;
import model.order.OrderState;
import model.product.Color;
import model.product.Product;
import model.product.ProductDetail;
import model.product.Size;

public class OrderDAO extends DBContext {

    PreparedStatement st;
    ResultSet rs;

    public void actionOrder(int action, int orderID) {
        String sql = "update [Order] set stateID=? where orderID=?";
        try {
            st = connection.prepareStatement(sql);
            st.setInt(1, action);
            st.setInt(2, orderID);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public List<Order> getListOrder(String key, String from, String to, int[] stateOrder, int sortCondition, int page, int pageSize) {
        List<Order> list = new ArrayList<>();
        ControllUser cu = new ControllUser();
        String sql = "select * from [Order] o inner join OrderState os\n"
                + "on o.stateID=os.stateID inner join [User] u\n"
                + "on o.userID=u.userID where 1=1";
        //handle from to
        if ((from == "" && to == "")) {
            //handle orderState
            if (stateOrder != null) {
                sql += " and o.stateID in(";
                for (int i = 0; i < stateOrder.length; i++) {
                    sql += stateOrder[i] + ",";
                }
                if (sql.endsWith(",")) {
                    sql = sql.substring(0, sql.length() - 1);
                }
                sql += ")";
            }
//        //handle search
            if (key != null) {
                sql += " and (o.orderID like ? or u.userName like ?)";
            }
            //handle sort
            if (sortCondition == 1) {
                sql += " order by o.orderDate asc,u.userName asc,o.amount asc, o.stateID asc";
            } else if (sortCondition == 2) {
                sql += " order by o.orderDate desc,u.userName desc,o.amount desc, o.stateID desc";
            }
            sql += " offset (?-1)*? row fetch next ? rows only";
            try {
                st = connection.prepareStatement(sql);
                st.setString(1, "%" + key + "%");
                st.setString(2, "%" + key + "%");
                st.setInt(3, page);
                st.setInt(4, pageSize);
                st.setInt(5, pageSize);
                rs = st.executeQuery();
                while (rs.next()) {
                    User account = cu.getUser(rs.getInt(2));
                    OrderState o_state = getOrderStateByID(rs.getInt(5));
                    List<OrderDetail> listOrderDetail = getListOfOrder(rs.getInt(1));
                    list.add(new Order(rs.getInt(1), account, rs.getString(3), rs.getDouble(4), o_state, listOrderDetail));
                }
            } catch (Exception e) {
                System.out.println(e);
            }
        } else {
            if (stateOrder != null) {
                sql += " and o.stateID in(";
                for (int i = 0; i < stateOrder.length; i++) {
                    sql += stateOrder[i] + ",";
                }
                if (sql.endsWith(",")) {
                    sql = sql.substring(0, sql.length() - 1);
                }
                sql += ")";
            }
//        //handle search
            if (key != null) {
                sql += " and (o.orderID like ? or u.userName like ?)";
            }
            sql += " and (o.orderDate between ? and ?)";
            //handle sort
            if (sortCondition == 1) {
                sql += " order by o.orderDate asc,u.userName asc,o.amount asc, o.stateID asc";
            } else if (sortCondition == 2) {
                sql += " order by o.orderDate desc,u.userName desc,o.amount desc, o.stateID desc";
            }

            sql += " offset (?-1)*? row fetch next ? rows only";
            try {
                st = connection.prepareStatement(sql);
                st.setString(1, "%" + key + "%");
                st.setString(2, "%" + key + "%");
                st.setString(3, from);
                st.setString(4, to);
                st.setInt(5, page);
                st.setInt(6, pageSize);
                st.setInt(7, pageSize);
                rs = st.executeQuery();
                while (rs.next()) {
                    User account = cu.getUser(rs.getInt(2));
                    OrderState o_state = getOrderStateByID(rs.getInt(5));
                    List<OrderDetail> listOrderDetail = getListOfOrder(rs.getInt(1));
                    list.add(new Order(rs.getInt(1), account, rs.getString(3), rs.getDouble(4), o_state, listOrderDetail));
                }
            } catch (Exception e) {
                System.out.println(e);
            }
        }
        return list;
    }

    public List<Order> getListOrderBySearch(String key) {
        String sql = "select * from [Order] o inner join OrderState os\n"
                + "on o.stateID=os.stateID inner join [User] u\n"
                + "on o.userID=u.userID where 1=1";
        ControllUser cu = new ControllUser();
        List<Order> list = new ArrayList<>();
        if (key != null) {
            if (key != null) {
                sql += " and (o.orderID like ? or u.userName like ?)";
            }
        }

        try {
            st = connection.prepareCall(sql);
            st.setString(1, "%" + key + "%");
            st.setString(2, "%" + key + "%");
            rs = st.executeQuery();
            while (rs.next()) {
                User account = cu.getUser(rs.getInt(2));
                OrderState o_state = getOrderStateByID(rs.getInt(5));
                List<OrderDetail> listOrderDetail = getListOfOrder(rs.getInt(1));
                list.add(new Order(rs.getInt(1), account, rs.getString(3), rs.getDouble(4), o_state, listOrderDetail));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Order> getTotalPage(String key, String from, String to, int[] stateOrder) {
//        int count = 0;
        List<Order> list = new ArrayList<>();
        ControllUser cu = new ControllUser();
        String sql = "select * from [Order] o inner join OrderState os\n"
                + "on o.stateID=os.stateID inner join [User] u\n"
                + "on o.userID=u.userID where 1=1";
        //handle from to
        if ((from == "" && to == "")) {
            //handle orderState
            if (stateOrder != null) {
                sql += " and o.stateID in(";
                for (int i = 0; i < stateOrder.length; i++) {
                    sql += stateOrder[i] + ",";
                }
                if (sql.endsWith(",")) {
                    sql = sql.substring(0, sql.length() - 1);
                }
                sql += ")";
            }
//        //handle search
            if (key != null) {
                sql += " and (o.orderID like ? or u.userName like ?)";
            }
            try {
                st = connection.prepareStatement(sql);
                st.setString(1, "%" + key + "%");
                st.setString(2, "%" + key + "%");
                rs = st.executeQuery();
                while (rs.next()) {
                    User account = cu.getUser(rs.getInt(2));
                    OrderState o_state = getOrderStateByID(rs.getInt(5));
                    List<OrderDetail> listOrderDetail = getListOfOrder(rs.getInt(1));
                    list.add(new Order(rs.getInt(1), account, rs.getString(3), rs.getDouble(4), o_state, listOrderDetail));
//                    count++;
                }
            } catch (Exception e) {
                System.out.println(e);
            }
        } else {
            if (stateOrder != null) {
                sql += " and o.stateID in(";
                for (int i = 0; i < stateOrder.length; i++) {
                    sql += stateOrder[i] + ",";
                }
                if (sql.endsWith(",")) {
                    sql = sql.substring(0, sql.length() - 1);
                }
                sql += ")";
            }
            //handle search
            if (key != null) {
                sql += " and (o.orderID like ? or u.userName like ?)";
            }
            sql += " and (o.orderDate between ? and ?)";
            try {
                st = connection.prepareStatement(sql);
                st.setString(1, "%" + key + "%");
                st.setString(2, "%" + key + "%");
                st.setString(3, from);
                st.setString(4, to);
                rs = st.executeQuery();
                while (rs.next()) {
                    User account = cu.getUser(rs.getInt(2));
                    OrderState o_state = getOrderStateByID(rs.getInt(5));
                    List<OrderDetail> listOrderDetail = getListOfOrder(rs.getInt(1));
                    list.add(new Order(rs.getInt(1), account, rs.getString(3), rs.getDouble(4), o_state, listOrderDetail));
//                    count++;
                }
            } catch (Exception e) {
                System.out.println(e);
            }
        }
        return list;
    }

    public List<ProductDetail> getTop5Product() {
        ProductDAO pd = new ProductDAO();
        String sql = "with t as(select pd.detailID,pd.productID, pd.quantity,pd.colorID,pd.sizeID,o.orderID from ProductDetail pd\n"
                + "join OrderDetail od\n"
                + "on pd.detailID = od.detailID\n"
                + "join [Order] o\n"
                + "on od.orderID=o.orderID\n"
                + "join OrderState os\n"
                + "on o.stateID=os.stateID)\n"
                + "select top(5)detailID,productID,quantity,colorID,sizeID,orderID from t order by t.quantity desc";
        List<ProductDetail> list = new LinkedList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = pd.getByID(rs.getInt(2));
                Size s = pd.getSizeByID(rs.getInt(3));
                Color c = pd.getColorByID(rs.getInt(5));
                list.add(new ProductDetail(rs.getInt(1), p, s, rs.getInt(4), c));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Order> getOrderNewInLessMonth() {
        String sql = "select * from [Order]\n"
                + "where orderDate > GETDATE()-30\n"
                + "order by orderDate desc";
        ControllUser d = new ControllUser();
        List<Order> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                User account = d.getUser(rs.getInt(2));
                OrderState o_state = getOrderStateByID(rs.getInt(5));
                List<OrderDetail> listOrderDetail = getListOfOrder(rs.getInt(1));
                list.add(new Order(rs.getInt(1), account, rs.getString(3), rs.getDouble(4), o_state, listOrderDetail));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public OrderState getOrderStateByID(int id) {
        String sql = "select * from [OrderState] where stateID=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return new OrderState(rs.getInt(1), rs.getString(2));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public List<OrderState> getListOrderState() {
        String sql = "select top 5 * from [OrderState]";
        List<OrderState> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new OrderState(rs.getInt(1), rs.getString(2)));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public OrderDetail getOrderDetailByID(int id) {
        String sql = "select * from OrderDetail where orderDetailID=?";
        ProductDAO pd = new ProductDAO();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                ProductDetail p = pd.getProductDetailByID(rs.getInt(2));

                return new OrderDetail(rs.getInt(1), p, rs.getInt(3), rs.getDouble(4), rs.getDouble(5), rs.getString(6), rs.getString(7), rs.getInt(8), rs.getDouble(9), rs.getBoolean(10));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public List<OrderDetail> getListOfOrder(int orderID) {
        ProductDAO pd = new ProductDAO();
        String sql = "select * from OrderDetail where orderID=?";
        ControllUser d = new ControllUser();
        List<OrderDetail> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, orderID);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                ProductDetail p = pd.getProductDetailByID(rs.getInt(2));
                list.add(new OrderDetail(rs.getInt(1), p, rs.getInt(3), rs.getDouble(4), rs.getDouble(5), rs.getString(6), rs.getString(7), rs.getInt(8), rs.getDouble(9), rs.getBoolean(10)));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public void ReceiveOrder(int id) {
        String sql = "Update [Order] set stateID=1 where orderID=?";
        try {
            st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public int AmountPriceLessMonth() {
        String sql = "select sum(amount) from [Order]\n"
                + "where orderDate > GETDATE()-30";
        int sum = 0;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                sum += rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return sum;
    }

    //dung
    //Customer
    public List<Order> pagingOrders(int id, int index) {
        List<Order> list = new ArrayList<>();
        ControllUser d = new ControllUser();
        String query = "select * from [Order] where userID = ? order by orderID  offset ?  rows fetch next 6 rows only";
        try {
            PreparedStatement st = connection.prepareStatement(query);
            st.setInt(1, id);
            st.setInt(2, (index - 1) * 6);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                User account = d.getUser(rs.getInt(2));
                OrderState o_state = getOrderStateByID(rs.getInt(5));
                List<OrderDetail> listOrderDetail = getListOfOrder(rs.getInt(1));
                list.add(new Order(rs.getInt(1), account, rs.getString(3), rs.getDouble(4), o_state, listOrderDetail));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public int getTotalOrderByUserID(int userID) {
        String query = "select count(*) from [Order] where userID=?";
        try {
            PreparedStatement st = connection.prepareStatement(query);
            st.setInt(1, userID);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return 0;
    }

    public int getTotalOrder() {
        String query = "select count(*) from [Order] ";
        try {
            PreparedStatement st = connection.prepareStatement(query);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return 0;
    }

    public List<Order> getAllName(String name) {
        List<Order> list = new ArrayList<>();
        ControllUser d = new ControllUser();
        String query = "select * from MyOrder where Product like '%" + name + "%'";
        try {
            st = connection.prepareStatement(query);
            rs = st.executeQuery();
            while (rs.next()) {
                User account = d.getUser(rs.getInt(2));
                OrderState o_state = getOrderStateByID(rs.getInt(5));
                List<OrderDetail> listOrderDetail = getListOfOrder(rs.getInt(1));
                list.add(new Order(rs.getInt(1), account, rs.getString(3), rs.getDouble(4), o_state, listOrderDetail));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public Order getOrderByID(int id) {
        ControllUser d = new ControllUser();
        String sql = "select * from [Order] where orderID=?";
        try {
            st = connection.prepareStatement(sql);
            st.setInt(1, id);
            rs = st.executeQuery();
            while (rs.next()) {
                User account = d.getUser(rs.getInt(2));
                OrderState o_state = getOrderStateByID(rs.getInt(5));
                List<OrderDetail> listOrderDetail = getListOfOrder(rs.getInt(1));
                return new Order(rs.getInt(1), account, rs.getString(3), rs.getDouble(4), o_state, listOrderDetail);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public int addOrder(int accountID, double fee, List<ProductDetail> list) {
        LocalDate curDate = LocalDate.now();
        String date = curDate.toString();
        int orderID = 0;
        double ship = 1.0;
        try {
            // add order
            String sql = "INSERT INTO [dbo].[Order]\n"
                    + "           ([userID]\n"
                    + "           ,[orderDate]\n"
                    + "           ,[amount]\n"
                    + "           ,[stateID])\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?)";
            st = connection.prepareStatement(sql);
            st.setInt(1, accountID);
            st.setString(2, date);
            st.setDouble(3, fee * 1.1 + ship);
            st.setInt(4, 4);
            st.executeUpdate();

            // take orderID
            String sql1 = "SELECT top 1 [orderID]\n"
                    + "      ,[userID]\n"
                    + "      ,[orderDate]\n"
                    + "      ,[amount]\n"
                    + "      ,[stateID]\n"
                    + "  FROM [dbo].[Order]\n"
                    + "  order by orderID desc";
            PreparedStatement ps1 = connection.prepareStatement(sql1);
            rs = ps1.executeQuery();

            if (rs.next()) {
                orderID = rs.getInt(1);
                for (ProductDetail i : list) {
                    String sql2 = "INSERT INTO [dbo].[OrderDetail]\n"
                            + "           ([detailID]\n"
                            + "           ,[quantity]\n"
                            + "           ,[price]\n"
                            + "           ,[discount]\n"
                            + "           ,[createAt]\n"
                            + "           ,[updateAt]\n"
                            + "           ,[orderID]\n"
                            + "           ,[Amount]\n"
                            + "           ,[isFeedback])\n"
                            + "     VALUES\n"
                            + "           (?\n"
                            + "           ,?\n"
                            + "           ,?\n"
                            + "           ,?\n"
                            + "           ,?\n"
                            + "           ,?\n"
                            + "           ,?\n"
                            + "           ,?\n"
                            + "           ,?)";
                    PreparedStatement ps2 = connection.prepareStatement(sql2);
                    ps2.setInt(1, i.getId());
                    ps2.setInt(2, i.getProduct().getAmount());
                    ps2.setDouble(3, i.getProduct().getProductPrice());
                    ps2.setDouble(4, i.getProduct().getDiscount());
                    ps2.setString(5, i.getProduct().getCreateAt());
                    ps2.setString(6, date);
                    ps2.setInt(7, orderID);
                    ps2.setDouble(8, i.getProduct().getProductPrice() * i.getProduct().getAmount());
                    ps2.setBoolean(9, false);
                    ps2.executeUpdate();
                }
            }
            // update quantity of product
            String sql3 = "UPDATE [dbo].[Product]\n"
                    + "   SET [totalQuantity] = [totalQuantity] -?\n"
                    + " WHERE productID = ?";
            PreparedStatement ps3 = connection.prepareStatement(sql3);
            for (ProductDetail i : list) {
                ps3.setInt(1, i.getProduct().getAmount());
                ps3.setInt(2, i.getProduct().getProductID());
                ps3.executeUpdate();
            }
            String sql4 = "UPDATE [dbo].[ProductDetail]\n"
                    + "   SET [quantity] = [quantity] - ? \n"
                    + " WHERE detailID=?";
            PreparedStatement ps4 = connection.prepareStatement(sql4);
            for (ProductDetail i : list) {
                ps4.setInt(1, i.getProduct().getAmount());
                ps4.setInt(2, i.getId());
                ps4.executeUpdate();
            }
        } catch (Exception e) {
        }
        return orderID;
    }

    //hai new 
    public List<User> TopCustomerBuyMost(String from, String to) {
        List<User> list = new ArrayList<>();
        String sql = "select top 5 u.userID,count(o.orderID) from [Order] o\n"
                + "inner join [User] u\n"
                + "on o.userID=u.userID\n"
                + "inner join OrderDetail od\n"
                + "on od.orderID=o.orderID\n"
                + "group by u.userID\n"
                + "order by count(o.orderID) desc";
        if (from != "" && to != "") {
            sql = "select top 5 u.userID,count(o.orderID) from [Order] o\n"
                    + "inner join [User] u\n"
                    + "on o.userID=u.userID\n"
                    + "inner join OrderDetail od\n"
                    + "on od.orderID=o.orderID\n"
                    + "where o.orderDate between ? and ?\n"
                    + "group by u.userID\n"
                    + "order by count(o.orderID) desc";
            ControllUser cl = new ControllUser();
            try {
                st = connection.prepareStatement(sql);
                st.setString(1, from);
                st.setString(2, to);
                rs = st.executeQuery();
                while (rs.next()) {
                    list.add(cl.getUser(rs.getInt(1)));
                }
            } catch (Exception e) {
                System.out.println(e);
            }
            return list;
        }
        ControllUser cl = new ControllUser();
        try {
            st = connection.prepareStatement(sql);
            rs = st.executeQuery();
            while (rs.next()) {
                list.add(cl.getUser(rs.getInt(1)));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;

    }

    public List<Integer> ListIntForChartCus(String from, String to) {
        List<Integer> list = new ArrayList<>();
        String sql = "select top 5 u.userID,count(o.orderID) from [Order] o\n"
                + "inner join [User] u\n"
                + "on o.userID=u.userID\n"
                + "inner join OrderDetail od\n"
                + "on od.orderID=o.orderID\n"
                + "group by u.userID\n"
                + "order by count(o.orderID) desc";
        if (from != "" && to != "") {
            sql = "select top 5 u.userID,count(o.orderID) from [Order] o\n"
                    + "inner join [User] u\n"
                    + "on o.userID=u.userID\n"
                    + "inner join OrderDetail od\n"
                    + "on od.orderID=o.orderID\n"
                    + "where o.orderDate between ? and ?\n"
                    + "group by u.userID\n"
                    + "order by count(o.orderID) desc";
            ControllUser cl = new ControllUser();
            try {
                st = connection.prepareStatement(sql);
                st.setString(1, from);
                st.setString(2, to);
                rs = st.executeQuery();
                while (rs.next()) {
                    list.add(rs.getInt(2));
                }
            } catch (Exception e) {
                System.out.println(e);
            }
            return list;
        }
        ControllUser cl = new ControllUser();
        try {
            st = connection.prepareStatement(sql);
            rs = st.executeQuery();
            while (rs.next()) {
                list.add(rs.getInt(2));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public int TotalOrderSuccess(String from, String to) {
        int count = 0;
        String sql = "select * from [Order] where stateID=1";
        if (from != "" && to != "") {
            sql = "select * from [Order] where stateID=1 and orderDate between ? and ?";
            try {
                st = connection.prepareStatement(sql);
                st.setString(1, from);
                st.setString(2, to);
                rs = st.executeQuery();
                while (rs.next()) {
                    count++;
                }
            } catch (Exception e) {
                System.out.println(e);
            }
            return count;
        }

        try {
            st = connection.prepareStatement(sql);
            rs = st.executeQuery();
            while (rs.next()) {
                count++;
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return count;
    }

    public int TotalOrderShop(String from, String to) {
        String sql = "select * from [Order]";
        int count = 0;
        if (from != "" && to != "") {
            sql = "select * from [Order] where orderDate between ? and ?";
            try {
                st = connection.prepareStatement(sql);
                st.setString(1, from);
                st.setString(2, to);
                rs = st.executeQuery();
                while (rs.next()) {
                    count++;
                }
            } catch (Exception e) {
                System.out.println(e);
            }
            return count;
        }

        try {
            st = connection.prepareStatement(sql);
            rs = st.executeQuery();
            while (rs.next()) {
                count++;
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return count;
    }

    public static void main(String[] args) {
        OrderDAO d = new OrderDAO();
        int ar[] = {1, 2, 3};
//        List<Order> list = d.pagingOrders(7, 1);
//        System.out.println(list.get(0).getListOfOrder().get(0).getProductDetail().getProduct().getProductName());
//        System.out.println(d.getOrderByID(5).getAmount());

    }
}
