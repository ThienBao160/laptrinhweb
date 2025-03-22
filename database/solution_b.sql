-- B. Truy vấn đơn hàng
--1. Liệt kê các hóa đơn của khách hàng, thông tin hiển thị gồm: mã user, tên user, mã hóa đơn
SELECT o.user_id, u.user_name, o.order_id
FROM orders o
JOIN users u ON o.user_id = u.user_id;
--2. Liệt kê số lượng các hóa đơn của khách hàng: mã user, tên user, số đơn hàng
SELECT o.user_id, u.user_name, COUNT(o.order_id) AS so_don_hang
FROM orders o
JOIN users u ON o.user_id = u.user_id
GROUP BY o.user_id, u.user_name;
--3. Liệt kê thông tin hóa đơn: mã đơn hàng, số sản phẩm
SELECT od.order_id, COUNT(od.product_id) AS so_san_pham
FROM order_details od
GROUP BY od.order_id;
--4. Liệt kê thông tin mua hàng của người dùng: mã user, tên user, mã đơn hàng, tên sản phẩm. Lưu ý: gôm nhóm theo đơn hàng, tránh hiển thị xen kẻ các đơn hàng với nhau
SELECT o.user_id, u.user_name, o.order_id, p.product_name
FROM orders o
JOIN users u ON o.user_id = u.user_id
JOIN order_details od ON o.order_id = od.order_id
JOIN products p ON od.product_id = p.product_id
ORDER BY o.order_id;
--5. Liệt kê 7 người dùng có số lượng đơn hàng nhiều nhất, thông tin hiển thị gồm: mã user, tên user, số lượng đơn hàng
SELECT TOP 7 o.user_id, u.user_name, COUNT(o.order_id) AS so_luong_don_hang
FROM orders o
JOIN users u ON o.user_id = u.user_id
GROUP BY o.user_id, u.user_name
ORDER BY so_luong_don_hang DESC;
--6. Liệt kê 7 người dùng mua sản phẩm có tên: Samsung hoặc Apple trong tên sản phẩm, thông tin hiển thị gồm: mã user, tên user, mã đơn hàng, tên sản phẩm
SELECT TOP 7 o.user_id, u.user_name, o.order_id, p.product_name
FROM orders o
JOIN users u ON o.user_id = u.user_id
JOIN order_details od ON o.order_id = od.order_id
JOIN products p ON od.product_id = p.product_id
WHERE p.product_name LIKE '%Samsung%' OR p.product_name LIKE '%Apple%'
ORDER BY o.order_id;
--7. Liệt kê danh sách mua hàng của user bao gồm giá tiền của mỗi đơn hàng, thông tin hiển thị gồm: mã user, tên user, mã đơn hàng, tổng tiền
SELECT o.user_id, u.user_name, o.order_id, SUM(p.product_price) AS tong_tien
FROM orders o
JOIN users u ON o.user_id = u.user_id
JOIN order_details od ON o.order_id = od.order_id
JOIN products p ON od.product_id = p.product_id
GROUP BY o.user_id, u.user_name, o.order_id;
--8. Liệt kê danh sách mua hàng của user bao gồm giá tiền của mỗi đơn hàng, thông tin hiển thị gồm: mã user, tên user, mã đơn hàng, tổng tiền. Mỗi user chỉ chọn ra 1 đơnhàng có giá tiền lớn nhất. 
WITH CTE AS (
    SELECT o.user_id, u.user_name, o.order_id, SUM(p.product_price) AS tong_tien,
           ROW_NUMBER() OVER (PARTITION BY o.user_id ORDER BY SUM(p.product_price) DESC) AS rank
    FROM orders o
    JOIN users u ON o.user_id = u.user_id
    JOIN order_details od ON o.order_id = od.order_id
    JOIN products p ON od.product_id = p.product_id
    GROUP BY o.user_id, u.user_name, o.order_id
)
SELECT user_id, user_name, order_id, tong_tien
FROM CTE
WHERE rank = 1;
--9. Liệt kê danh sách mua hàng của user bao gồm giá tiền của mỗi đơn hàng, thông tin hiển thị gồm: mã user, tên user, mã đơn hàng, tổng tiền, số sản phẩm. Mỗi user chỉ chọn ra 1 đơn hàng có giá tiền nhỏ nhất. 
WITH CTE AS (
    SELECT o.user_id, u.user_name, o.order_id, SUM(p.product_price) AS tong_tien,
           ROW_NUMBER() OVER (PARTITION BY o.user_id ORDER BY SUM(p.product_price) ASC) AS rank
    FROM orders o
    JOIN users u ON o.user_id = u.user_id
    JOIN order_details od ON o.order_id = od.order_id
    JOIN products p ON od.product_id = p.product_id
    GROUP BY o.user_id, u.user_name, o.order_id
)
SELECT user_id, user_name, order_id, tong_tien
FROM CTE
WHERE rank = 1;
--10. Liệt kê danh sách mua hàng của user bao gồm giá tiền của mỗi đơn hàng, thông tinhiển thị gồm: mã user, tên user, mã đơn hàng, tổng tiền, số sản phẩm. Mỗi user chỉ chọn ra 1 đơn hàng có số sản phẩm là nhiều nhất.
WITH CTE AS (
    SELECT o.user_id, u.user_name, o.order_id, COUNT(od.product_id) AS so_san_pham, SUM(p.product_price) AS tong_tien,
           ROW_NUMBER() OVER (PARTITION BY o.user_id ORDER BY COUNT(od.product_id) DESC) AS rank
    FROM orders o
    JOIN users u ON o.user_id = u.user_id
    JOIN order_details od ON o.order_id = od.order_id
    JOIN products p ON od.product_id = p.product_id
    GROUP BY o.user_id, u.user_name, o.order_id
)
SELECT user_id, user_name, order_id, tong_tien, so_san_pham
FROM CTE
WHERE rank = 1;