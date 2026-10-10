<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chỉnh sửa người dùng</title>
    <style>
        * { box-sizing: border-box; margin: 0; padding: 0; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; }
        body { background: linear-gradient(135deg, #0f172a 0%, #1e293b 100%); min-height: 100vh; display: flex; justify-content: center; align-items: center; padding: 20px; color: #f8fafc; }
        .card { background: rgba(30, 41, 59, 0.7); backdrop-filter: blur(16px); border: 1px solid rgba(255, 255, 255, 0.1); border-radius: 20px; padding: 36px; width: 100%; max-width: 480px; box-shadow: 0 20px 50px rgba(0, 0, 0, 0.4); }
        .header { text-align: center; margin-bottom: 24px; }
        .header h1 { font-size: 26px; font-weight: 700; background: linear-gradient(135deg, #fbbf24, #f59e0b); -webkit-background-clip: text; -webkit-text-fill-color: transparent; }
        .form-group { margin-bottom: 18px; }
        label { display: block; margin-bottom: 8px; color: #cbd5e1; font-size: 14px; font-weight: 500; }
        input[type="text"], input[type="email"] { width: 100%; padding: 12px 16px; border-radius: 10px; border: 1px solid rgba(255, 255, 255, 0.15); background: rgba(15, 23, 42, 0.6); color: #fff; font-size: 15px; outline: none; transition: all 0.3s ease; }
        input:focus { border-color: #fbbf24; box-shadow: 0 0 0 3px rgba(251, 191, 36, 0.2); }
        .btn-submit { width: 100%; padding: 12px; border: none; border-radius: 10px; background: linear-gradient(135deg, #d97706 0%, #f59e0b 100%); color: white; font-size: 15px; font-weight: 600; cursor: pointer; margin-top: 10px; transition: transform 0.2s ease; }
        .btn-submit:hover { transform: translateY(-2px); }
        .back-link { display: block; text-align: center; margin-top: 18px; color: #94a3b8; text-decoration: none; font-size: 14px; }
        .back-link:hover { color: #fbbf24; }
    </style>
</head>
<body>
    <div class="card">
        <div class="header">
            <h1>Chỉnh Sửa Người Dùng</h1>
        </div>

        <form action="${pageContext.request.contextPath}/users?action=edit" method="post">
            <input type="hidden" name="id" value="${user.id}" />

            <div class="form-group">
                <label for="name">Họ và Tên:</label>
                <input type="text" id="name" name="name" value="<c:out value="${user.name}"/>" required />
            </div>

            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" value="<c:out value="${user.email}"/>" required />
            </div>

            <div class="form-group">
                <label for="country">Quốc gia:</label>
                <input type="text" id="country" name="country" value="<c:out value="${user.country}"/>" required />
            </div>

            <button type="submit" class="btn-submit">Cập nhật thông tin</button>
        </form>

        <a href="${pageContext.request.contextPath}/users" class="back-link">&larr; Quay lại danh sách</a>
    </div>
</body>
</html>
