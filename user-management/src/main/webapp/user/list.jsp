<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quản lý người dùng</title>
    <style>
        * { box-sizing: border-box; margin: 0; padding: 0; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; }
        body { background: linear-gradient(135deg, #0f172a 0%, #1e293b 100%); min-height: 100vh; display: flex; justify-content: center; align-items: center; padding: 40px 20px; color: #f8fafc; }
        .container { width: 100%; max-width: 1000px; background: rgba(30, 41, 59, 0.7); backdrop-filter: blur(16px); border: 1px solid rgba(255, 255, 255, 0.1); border-radius: 20px; padding: 36px; box-shadow: 0 20px 50px rgba(0, 0, 0, 0.4); }
        .header { display: flex; justify-content: space-between; align-items: center; margin-bottom: 24px; flex-wrap: wrap; gap: 16px; }
        .header h1 { font-size: 28px; font-weight: 700; background: linear-gradient(135deg, #38bdf8, #818cf8); -webkit-background-clip: text; -webkit-text-fill-color: transparent; }
        .btn-create { display: inline-block; padding: 10px 20px; border-radius: 10px; background: linear-gradient(135deg, #0284c7 0%, #6366f1 100%); color: white; text-decoration: none; font-weight: 600; font-size: 14px; transition: transform 0.2s ease, box-shadow 0.2s ease; }
        .btn-create:hover { transform: translateY(-2px); box-shadow: 0 6px 16px rgba(99, 102, 241, 0.4); }
        
        .filter-card { background: rgba(15, 23, 42, 0.5); border: 1px solid rgba(255, 255, 255, 0.08); border-radius: 14px; padding: 20px; margin-bottom: 24px; }
        .filter-form { display: flex; flex-wrap: wrap; gap: 16px; align-items: flex-end; }
        .filter-group { display: flex; flex-direction: column; gap: 6px; flex: 1; min-width: 200px; }
        .filter-group label { font-size: 13px; color: #94a3b8; font-weight: 500; }
        .filter-input, .filter-select { width: 100%; padding: 10px 14px; border-radius: 8px; border: 1px solid rgba(255, 255, 255, 0.15); background: rgba(15, 23, 42, 0.7); color: #fff; font-size: 14px; outline: none; }
        .filter-input:focus, .filter-select:focus { border-color: #38bdf8; }
        .filter-select option { background: #1e293b; color: #fff; }
        .btn-filter { padding: 10px 20px; border-radius: 8px; border: none; background: linear-gradient(135deg, #38bdf8 0%, #3b82f6 100%); color: white; font-weight: 600; cursor: pointer; transition: transform 0.2s ease; }
        .btn-filter:hover { transform: translateY(-2px); }
        .btn-reset { padding: 10px 16px; border-radius: 8px; border: 1px solid rgba(255, 255, 255, 0.2); background: transparent; color: #94a3b8; text-decoration: none; font-size: 14px; font-weight: 500; text-align: center; }
        .btn-reset:hover { color: #fff; border-color: #fff; }

        .table-responsive { overflow-x: auto; border-radius: 14px; border: 1px solid rgba(255, 255, 255, 0.08); }
        table { width: 100%; border-collapse: collapse; text-align: left; background: rgba(15, 23, 42, 0.4); }
        th { background: rgba(15, 23, 42, 0.8); color: #38bdf8; font-weight: 600; padding: 16px; font-size: 13px; text-transform: uppercase; letter-spacing: 0.5px; border-bottom: 1px solid rgba(255, 255, 255, 0.1); }
        td { padding: 16px; border-bottom: 1px solid rgba(255, 255, 255, 0.05); vertical-align: middle; font-size: 14px; color: #e2e8f0; }
        tr:last-child td { border-bottom: none; }
        tr:hover td { background: rgba(56, 189, 248, 0.05); }
        .action-links a { text-decoration: none; font-size: 13px; font-weight: 600; padding: 6px 12px; border-radius: 6px; margin-right: 6px; display: inline-block; }
        .btn-edit { background: rgba(251, 191, 36, 0.15); color: #fbbf24; border: 1px solid rgba(251, 191, 36, 0.3); }
        .btn-delete { background: rgba(248, 113, 113, 0.15); color: #f87171; border: 1px solid rgba(248, 113, 113, 0.3); }
        .action-links a:hover { transform: translateY(-1px); filter: brightness(1.2); }
        .empty-msg { text-align: center; padding: 30px; color: #94a3b8; font-size: 15px; }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>Quản Lý Người Dùng (MySQL JDBC)</h1>
            <a href="${pageContext.request.contextPath}/users?action=create" class="btn-create">+ Thêm Người Dùng Mới</a>
        </div>

        <div class="filter-card">
            <form action="${pageContext.request.contextPath}/users" method="get" class="filter-form">
                <div class="filter-group">
                    <label for="country">Tìm theo Quốc gia (Country):</label>
                    <input type="text" id="country" name="country" class="filter-input" placeholder="Nhập quốc gia..." value="<c:out value="${country}"/>" autocomplete="off" />
                </div>

                <div class="filter-group">
                    <label for="sort">Sắp xếp theo Tên (Name):</label>
                    <select id="sort" name="sort" class="filter-select">
                        <option value="">-- Mặc định (Theo ID) --</option>
                        <option value="asc" ${sort == 'asc' ? 'selected' : ''}>Tên tăng dần (A → Z)</option>
                        <option value="desc" ${sort == 'desc' ? 'selected' : ''}>Tên giảm dần (Z → A)</option>
                    </select>
                </div>

                <button type="submit" class="btn-filter">Lọc & Sắp xếp</button>
                <c:if test="${not empty country or not empty sort}">
                    <a href="${pageContext.request.contextPath}/users" class="btn-reset">Đặt lại</a>
                </c:if>
            </form>
        </div>

        <div class="table-responsive">
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Họ và Tên</th>
                        <th>Email</th>
                        <th>Quốc gia</th>
                        <th>Hành động</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${listUser}" var="user">
                        <tr>
                            <td><c:out value="${user.id}"/></td>
                            <td><strong><c:out value="${user.name}"/></strong></td>
                            <td><c:out value="${user.email}"/></td>
                            <td><c:out value="${user.country}"/></td>
                            <td class="action-links">
                                <a href="${pageContext.request.contextPath}/users?action=edit&id=${user.id}" class="btn-edit">Sửa</a>
                                <a href="${pageContext.request.contextPath}/users?action=delete&id=${user.id}" class="btn-delete">Xóa</a>
                            </td>
                        </tr>
                    </c:forEach>
                    <c:if test="${empty listUser}">
                        <tr>
                            <td colspan="5" class="empty-msg">Không tìm thấy người dùng phù hợp trong cơ sở dữ liệu!</td>
                        </tr>
                    </c:if>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>
