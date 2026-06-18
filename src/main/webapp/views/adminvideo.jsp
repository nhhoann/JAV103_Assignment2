<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Quản lý Video - OE</title>
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

        textarea.form-control {
            border-radius: 18px;
        }

        .form-control:focus {
            border-color: #ff5c8a;
            box-shadow: 0 0 0 4px rgba(255,92,138,.15);
        }

        .poster-img {
            width: 120px;
            height: 70px;
            object-fit: cover;
            border-radius: 12px;
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

            <a href="${pageContext.request.contextPath}/home" class="cute-pill">
                <i class="fa-solid fa-house me-1"></i> Trang chủ
            </a>
        </div>
    </div>
</header>

<main class="container py-5">

    <div class="mb-4">
        <h2 class="fw-bold mb-1">Quản lý Video 🎬</h2>
        <p class="text-muted mb-0">Thêm, cập nhật và xóa video trong hệ thống.</p>
    </div>

    <div class="cute-card p-4 mb-4">
        <h5 class="fw-bold mb-3">
            <c:choose>
                <c:when test="${not empty editVideo}">
                    Cập nhật Video
                </c:when>
                <c:otherwise>
                    Thêm Video
                </c:otherwise>
            </c:choose>
        </h5>

        <form action="${pageContext.request.contextPath}/admin/videos" method="post" class="row g-3">

            <div class="col-md-2">
                <input name="id"
                       class="form-control"
                       placeholder="YouTube ID"
                       value="${editVideo.id}"
                       ${not empty editVideo ? 'readonly' : ''}
                       required>
            </div>

            <div class="col-md-3">
                <input name="title"
                       class="form-control"
                       placeholder="Tiêu đề"
                       value="${editVideo.title}"
                       required>
            </div>

            <div class="col-md-3">
                <input name="poster"
                       class="form-control"
                       placeholder="Poster URL"
                       value="${editVideo.poster}">
            </div>

            <div class="col-md-2">
                <input name="views"
                       type="number"
                       class="form-control"
                       placeholder="Views"
                       value="${not empty editVideo ? editVideo.views : 0}">
            </div>

            <div class="col-md-2 d-flex align-items-center">
                <input type="checkbox"
                       name="active"
                       class="form-check-input me-2"
                       ${empty editVideo || editVideo.active ? 'checked' : ''}>
                <label class="fw-semibold">Active</label>
            </div>

            <div class="col-12">
                <textarea name="description"
                          class="form-control"
                          rows="3"
                          placeholder="Mô tả">${editVideo.description}</textarea>
            </div>

            <div class="col-12 d-flex gap-2">
                <c:choose>
                    <c:when test="${not empty editVideo}">
                        <button name="action" value="update" class="btn btn-outline-primary rounded-pill px-4">
                            <i class="fa-solid fa-pen me-1"></i> Cập nhật
                        </button>

                        <a href="${pageContext.request.contextPath}/admin/videos"
                           class="btn btn-outline-secondary rounded-pill px-4">
                            Hủy
                        </a>
                    </c:when>

                    <c:otherwise>
                        <button name="action" value="create" class="btn btn-cute px-4">
                            <i class="fa-solid fa-plus me-1"></i> Thêm
                        </button>
                    </c:otherwise>
                </c:choose>
            </div>
        </form>
    </div>

    <div class="cute-card p-3">
        <table class="table table-hover align-middle mb-0">
            <thead>
                <tr>
                    <th>Id</th>
                    <th>Poster</th>
                    <th>Title</th>
                    <th>Views</th>
                    <th>Active</th>
                    <th>Hành động</th>
                </tr>
            </thead>

            <tbody>
                <c:forEach var="v" items="${videos}">
                    <tr>
                        <td class="fw-bold">${v.id}</td>

                        <td>
                            <img src="${v.poster}"
                                 class="poster-img"
                                 alt="${v.title}"
                                 onerror="this.src='https://via.placeholder.com/120x70?text=No+Image'">
                        </td>

                        <td>${v.title}</td>
                        <td>${v.views}</td>

                        <td>
                            <c:choose>
                                <c:when test="${v.active}">
                                    <span class="badge rounded-pill text-bg-success">Active</span>
                                </c:when>
                                <c:otherwise>
                                    <span class="badge rounded-pill text-bg-secondary">Hidden</span>
                                </c:otherwise>
                            </c:choose>
                        </td>

                        <td>
                            <div class="d-flex gap-2">
                                <a href="${pageContext.request.contextPath}/admin/videos?action=edit&id=${v.id}"
                                   class="btn btn-outline-primary btn-sm rounded-pill">
                                    Sửa
                                </a>

                                <form action="${pageContext.request.contextPath}/admin/videos" method="post">
                                    <input type="hidden" name="id" value="${v.id}">
                                    <button name="action" value="delete"
                                            class="btn btn-outline-danger btn-sm rounded-pill">
                                        Xóa
                                    </button>
                                </form>
                            </div>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>

</main>

</body>
</html>