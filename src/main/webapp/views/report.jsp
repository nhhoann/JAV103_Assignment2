<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Báo cáo - OE</title>
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
            position: sticky;
            top: 0;
            z-index: 1000;
        }

        .brand-logo {
            font-size: 1.45rem;
            font-weight: 800;
            text-decoration: none;
            background: linear-gradient(135deg,#ff5c8a,#ff8a5c);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
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

        .cute-pill:hover {
            background: #fff0f6;
            color: #e91e63;
        }

        .cute-card {
            background: rgba(255,255,255,.92);
            border: 1px solid #ffe0ea;
            border-radius: 24px;
            box-shadow: 0 14px 35px rgba(255,92,138,.12);
            overflow: hidden;
        }

        .section-title {
            font-weight: 800;
            color: #2b2b2b;
        }

        .table {
            margin-bottom: 0;
        }

        .table thead th {
            background: #fff0f6;
            color: #ff4f86;
            border-bottom: 1px solid #ffd6e5;
            font-weight: 800;
        }

        .table td, .table th {
            vertical-align: middle;
        }

        .form-select {
            border-radius: 999px;
            border: 1px solid #ffd6e5;
            padding: 11px 18px;
        }

        .form-select:focus {
            border-color: #ff5c8a;
            box-shadow: 0 0 0 4px rgba(255,92,138,.15);
        }

        .btn-cute {
            background: linear-gradient(135deg,#ff5c8a,#ff8a5c);
            color: white;
            border: none;
            font-weight: 800;
            border-radius: 999px;
            padding: 11px 22px;
            box-shadow: 0 10px 22px rgba(255,92,138,.22);
        }

        .btn-cute:hover {
            color: white;
            opacity: .93;
        }

        .icon-box {
            width: 44px;
            height: 44px;
            border-radius: 14px;
            background: #fff0f6;
            color: #ff4f86;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            margin-right: 10px;
        }

        .empty-text {
            color: #999;
            font-style: italic;
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
            <a href="${pageContext.request.contextPath}/admin/users" class="cute-pill">
                <i class="fa-solid fa-users me-1"></i> Quản lý User
            </a>

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
        <h2 class="section-title mb-1">
            Báo cáo - Thống kê 📊
        </h2>
        <p class="text-muted mb-0">
            Theo dõi lượt yêu thích, người yêu thích và email đã chia sẻ theo từng tiểu phẩm.
        </p>
    </div>

    <div class="cute-card p-4 mb-4">
        <h5 class="fw-bold mb-3">
            <span class="icon-box">
                <i class="fa-solid fa-heart"></i>
            </span>
            Số người yêu thích từng tiểu phẩm
        </h5>

        <div class="table-responsive">
            <table class="table table-hover align-middle">
                <thead>
                    <tr>
                        <th>Video ID</th>
                        <th>Tiêu đề</th>
                        <th>Số lượt thích</th>
                    </tr>
                </thead>

                <tbody>
                    <c:forEach var="r" items="${favoriteReport}">
                        <tr>
                            <td class="fw-bold">${r[0]}</td>
                            <td>${r[1]}</td>
                            <td>
                                <span class="badge rounded-pill text-bg-danger">
                                    ${r[2]} lượt
                                </span>
                            </td>
                        </tr>
                    </c:forEach>

                    <c:if test="${empty favoriteReport}">
                        <tr>
                            <td colspan="3" class="text-center empty-text py-4">
                                Chưa có dữ liệu thống kê.
                            </td>
                        </tr>
                    </c:if>
                </tbody>
            </table>
        </div>
    </div>

    <div class="cute-card p-4 mb-4">
        <h5 class="fw-bold mb-3">
            <span class="icon-box">
                <i class="fa-solid fa-filter"></i>
            </span>
            Lọc dữ liệu theo tiểu phẩm
        </h5>

        <form method="get" action="${pageContext.request.contextPath}/admin/reports" class="row g-3 align-items-center">
            <div class="col-md-10">
                <select name="videoId" class="form-select" required>
                    <option value="">-- Chọn video cần xem báo cáo --</option>

                    <c:forEach var="v" items="${videos}">
                        <option value="${v.id}" ${selectedVideoId == v.id ? 'selected' : ''}>
                            ${v.title}
                        </option>
                    </c:forEach>
                </select>
            </div>

            <div class="col-md-2">
                <button class="btn btn-cute w-100">
                    Lọc
                </button>
            </div>
        </form>
    </div>

    <div class="row g-4">

        <div class="col-lg-6">
            <div class="cute-card p-4 h-100">
                <h5 class="fw-bold mb-3">
                    <span class="icon-box">
                        <i class="fa-solid fa-user-check"></i>
                    </span>
                    Người yêu thích
                </h5>

                <div class="table-responsive">
                    <table class="table table-hover align-middle">
                        <thead>
                            <tr>
                                <th>User ID</th>
                                <th>Họ tên</th>
                                <th>Email</th>
                            </tr>
                        </thead>

                        <tbody>
                            <c:forEach var="u" items="${likedUsers}">
                                <tr>
                                    <td class="fw-bold">${u.id}</td>
                                    <td>${u.fullname}</td>
                                    <td>${u.email}</td>
                                </tr>
                            </c:forEach>

                            <c:if test="${empty likedUsers}">
                                <tr>
                                    <td colspan="3" class="text-center empty-text py-4">
                                        Chưa chọn video hoặc chưa có người thích.
                                    </td>
                                </tr>
                            </c:if>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <div class="col-lg-6">
            <div class="cute-card p-4 h-100">
                <h5 class="fw-bold mb-3">
                    <span class="icon-box">
                        <i class="fa-regular fa-paper-plane"></i>
                    </span>
                    Người nhận đã chia sẻ
                </h5>

                <div class="table-responsive">
                    <table class="table table-hover align-middle">
                        <thead>
                            <tr>
                                <th>Người gửi</th>
                                <th>Email người nhận</th>
                                <th>Ngày gửi</th>
                            </tr>
                        </thead>

                        <tbody>
                            <c:forEach var="s" items="${shareUsers}">
                                <tr>
                                    <td class="fw-bold">${s[0]}</td>
                                    <td>${s[1]}</td>
                                    <td>${s[2]}</td>
                                </tr>
                            </c:forEach>

                            <c:if test="${empty shareUsers}">
                                <tr>
                                    <td colspan="3" class="text-center empty-text py-4">
                                        Chưa chọn video hoặc chưa có lượt chia sẻ.
                                    </td>
                                </tr>
                            </c:if>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

    </div>

</main>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>