//package vn.edu.hcmuaf.fit.controller.user_page;
//
//import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//import vn.edu.hcmuaf.fit.model.Order;
//
//import java.io.IOException;
//
//@WebServlet(urlPatterns = "/user/order_detail")
//public class OrderDetailServlet extends HttpServlet {
//
//    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        doGet(request, response);
//    }
//
//    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        // Lấy giá trị của tham số "id" từ request
//        String orderIdParam = request.getParameter("id");
//
//        // Kiểm tra xem tham số "id" có giá trị hay không
//        if (orderIdParam != null && !orderIdParam.isEmpty()) {
//            try {
//                // Chuyển đổi giá trị "id" sang kiểu int
//                int order_id = Integer.parseInt(orderIdParam);
//                // Gọi hàm loadOrder_view để lấy thông tin đơn hàng
//                Order order = OrderDAO.loadOrder_view(order_id);
//                // Thêm đối tượng Order vào request để sử dụng trong JSP
//                request.setAttribute("order", order);
//                // Gọi hàm loadOrderProductByOrderId để lấy danh sách sản phẩm trong đơn hàng
//                List<OrderProduct> productList = OrderProductDAO.loadOrderProductByOrderId(order_id);
//
//
//                // Tính tổng tiền sản phẩm
//                double sum = order.getTotalPay();
////                for (OrderProduct o : productList) {
////                    sum += o.getTotal();
////                }
//
//                // Lấy phí ship từ đơn hàng
//                double ship = order.getShipPrice();
//
//                // Tính tổng tiền cả đơn hàng
//                double total_money = sum + ship;
//
//                // Thêm các giá trị vào request để sử dụng trong JSP
//                request.setAttribute("sum", sum);
//                request.setAttribute("ship", ship);
//                request.setAttribute("total_money", total_money);
//                request.setAttribute("p_list", productList);
//
//                // Chuyển hướng đến trang order_detail.jsp
//                request.getRequestDispatcher("./order_detail.jsp").forward(request, response);
//
//            } catch (NumberFormatException e) {
//                // Xử lý nếu có lỗi khi chuyển đổi id sang kiểu int
//                response.getWriter().println("Invalid order ID format.");
//            }
//        } else {
//            // Xử lý nếu tham số id không tồn tại hoặc rỗng
//            response.getWriter().println("Order ID is missing or empty.");
//        }
//
//    }
//}
