<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Quản lý User - OE</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

    <style>
        body {
            min-height: 100vh;
            background: linear-gradient(135deg, #fff5f8, #fffaf0);
            font-family: 'Plus Jakarta Sans', sans-serif;
        }

        .top-bar {
            background: rgba(255,255,255,.85);
            backdrop-filter: blur(12px);
            border-bottom: 1px solid #ffe0ea;
        }

        .brand-logo {
            font-size: 1.45rem;
            font-weight: 800;
            text-decoration: none;
            background: linear-gradient(135deg,#ff5c8a,#ff8a5c);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }

        .cute-card {
            background: rgba(255,255,255,.92);
            border: 1px solid #ffe0ea;
            border-radius: 24px;
            box-shadow: 0 14px 35px rgba(255,92,138,.12);
        }

        .cute-pill {
            border-radius: 999px;
            padding: 10px 18px;
            font-weight: 800;
            border: 1px solid #ffd6e5;
            background: #fff;
            color: #ff4f86;
            text-decoration: none;
        }

        .btn-cute {
            background: linear-gradient(135deg,#ff5c8a,#ff8a5c);
            color: #fff;
            border: none;
            font-weight: 800;
            border-radius: 999px;
        }

        .btn-cute:hover {
            color: #fff;
            opacity: .93;
        }

        .form-control {
            border-radius: 999px;
            border: 1px solid #ffd6e5;
        }

        .form-control:focus {
            border-color: #ff5c8a;
            box-shadow: 0 0 0 4px rgba(255,92,138,.15);
        }

        table {
            overflow: hidden;
            border-radius: 18px;
        }
    </style>
</head>

<body>

<header class="top-bar">
    <div class="container py-3 d-flex justify-content-between align-items-center">
        <a href="${pageContext.request.contextPath}/home" class="brand-logo">
            ✨ ONLINE ENTERTAINMENT
        </a>

        <div class="d-flex gap-2">
            <a href="${pageContext.request.contextPath}/admin/videos" class="cute-pill">
                <i class="fa-solid fa-film me-1"></i> Quản lý Video
            </a>
            <a href="${pageContext.request.contextPath}/home" class="cute-pill">
                <i class="fa-solid fa-house me-1"></i> Trang chủ
            </a>
        </div>
    </div>
</header>

<main class="container py-5">

    <div class="mb-4">
        <h2 class="fw-bold mb-1">Quản lý User 👤</h2>
        <p class="text-muted mb-0">Thêm, cập nhật và xóa tài khoản người dùng.</p>
    </div>

    <div class="cute-card p-4 mb-4">
        <h5 class="fw-bold mb-3">Thêm / Sửa User</h5>

        <form action="${pageContext.request.contextPath}/admin/users" method="post" class="row g-3">
            <div class="col-md-2">
                <input name="id" class="form-control" placeholder="Username" required>
            </div>

            <div class="col-md-2">
                <input name="password" class="form-control" placeholder="Password" required>
            </div>

            <div class="col-md-3">
                <input name="email" type="email" class="form-control" placeholder="Email" required>
            </div>

            <div class="col-md-3">
                <input name="fullname" class="form-control" placeholder="Họ tên">
            </div>

            <div class="col-md-2 d-flex align-items-center">
                <input type="checkbox" name="admin" class="form-check-input me-2">
                <label class="fw-semibold">Admin</label>
            </div>

            <div class="col-12 d-flex gap-2">
                <button name="action" value="create" class="btn btn-cute px-4">
                    <i class="fa-solid fa-plus me-1"></i> Thêm
                </button>

                <button name="action" value="update" class="btn btn-outline-primary rounded-pill px-4">
                    <i class="fa-solid fa-pen me-1"></i> Cập nhật
                </button>
            </div>
        </form>
    </div>

    <div class="cute-card p-3">
        <table class="table table-hover align-middle mb-0">
            <thead>
                <tr>
                    <th>Id</th>
                    <th>Password</th>
                    <th>Email</th>
                    <th>Fullname</th>
                    <th>Admin</th>
                    <th>Hành động</th>
                </tr>
            </thead>

            <tbody>
                <c:forEach var="u" items="${users}">
                    <tr>
                        <td class="fw-bold">${u.id}</td>
                        <td>${u.password}</td>
                        <td>${u.email}</td>
                        <td>${u.fullname}</td>
                        <td>
                            <c:choose>
                                <c:when test="${u.admin}">
                                    <span class="badge rounded-pill text-bg-danger">Admin</span>
                                </c:when>
                                <c:otherwise>
                                    <span class="badge rounded-pill text-bg-secondary">User</span>
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td>
                            <form action="${pageContext.request.contextPath}/admin/users" method="post">
                                <input type="hidden" name="id" value="${u.id}">
                                <button name="action" value="delete" class="btn btn-outline-danger btn-sm rounded-pill">
                                    Xóa
                                </button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>

</main>

</body>
</html>