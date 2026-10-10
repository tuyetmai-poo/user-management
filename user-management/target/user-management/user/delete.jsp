<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Xóa người dùng</title>
    <style>
        * { box-sizing: border-box; margin: 0; padding: 0; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; }
        body { background: linear-gradient(135deg, #0f172a 0%, #1e293b 100%); min-height: 100vh; display: flex; justify-content: center; align-items: center; padding: 20px; color: #f8fafc; }
        .card { background: rgba(30, 41, 59, 0.7); backdrop-filter: blur(16px); border: 1px solid rgba(255, 255, 255, 0.1); border-radius: 20px; padding: 36px; width: 100%; max-width: 480px; box-shadow: 0 20px 50px rgba(0, 0, 0, 0.4); text-align: center; }
        .header h1 { font-size: 26px; font-weight: 700; color: #f87171; margin-bottom: 16px; }
        p.warning { color: #cbd5e1; font-size: 15px; margin-bottom: 24px; }
        .info-box { background: rgba(15, 23, 42, 0.6); border-radius: 12px; padding: 18px; margin-bottom: 24px; text-align: left; font-size: 14px; line-height: 1.6; border: 1px solid rgba(255, 255, 255, 0.08); }
        .info-box div { margin-bottom: 6px; }
        .info-box strong { color: #38bdf8; }
        .btn-delete { width: 100%; padding: 12px; border: none; border-radius: 10px; background: linear-gradient(135deg, #dc2626 0%, #ef4444 100%); color: white; font-size: 15px; font-weight: 600; cursor: pointer; transition: transform 0.2s ease; }
        .btn-delete:hover { transform: translateY(-2px); }
        .back-link { display: block; text-align: center; margin-top: 18px; color: #94a3b8; text-decoration: none; font-size: 14px; }
        .back-link:hover { color: #f87171; }
    </style>
</head>
<body>
    <div class="card">
        <div class="header">
            <h1>Xác Nhận Xóa Người Dùng</h1>
        </div>

        <p class="warning">Bạn có chắc chắn muốn xóa người dùng này khỏi cơ sở dữ liệu?</p>

        <div class="info-box">
            <div><strong>ID:</strong> <c:out value="${user.id}"/></div>
            <div><strong>Họ và Tên:</strong> <c:out value="${user.name}"/></div>
            <div><strong>Email:</strong> <c:out value="${user.email}"/></div>
            <div><strong>Quốc gia:</strong> <c:out value="${user.country}"/></div>
        </div>

        <form action="${pageContext.request.contextPath}/users?action=delete" method="post">
            <input type="hidden" name="id" value="${user.id}" />
            <button type="submit" class="btn-delete">Xác nhận Xóa</button>
        </form>

        <a href="${pageContext.request.contextPath}/users" class="back-link">&larr; Hủy & Quay lại danh sách</a>
    </div>
</body>
</html>
