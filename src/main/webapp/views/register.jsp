<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

        <!DOCTYPE html>
        <html lang="vi">

        <head>
            <meta charset="UTF-8">
            <title>Đăng ký - OE</title>
            <meta name="viewport" content="width=device-width, initial-scale=1.0">

            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
            <link
                href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700;800&display=swap"
                rel="stylesheet">
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

            <style>
                body {
                    min-height: 100vh;
                    background: linear-gradient(135deg, #fff5f8, #fffaf0);
                    font-family: 'Plus Jakarta Sans', sans-serif;
                    display: flex;
                    align-items: center;
                    justify-content: center;
                }

                .register-card {
                    width: 450px;
                    background: rgba(255, 255, 255, 0.92);
                    border: 1px solid #ffe0ea;
                    border-radius: 28px;
                    box-shadow: 0 18px 45px rgba(255, 92, 138, 0.16);
                    padding: 2.6rem;
                }

                .brand-logo {
                    font-size: 1.45rem;
                    font-weight: 800;
                    text-decoration: none;
                    background: linear-gradient(135deg, #ff5c8a, #ff8a5c);
                    -webkit-background-clip: text;
                    -webkit-text-fill-color: transparent;
                }

                .icon-circle {
                    width: 64px;
                    height: 64px;
                    border-radius: 50%;
                    background: #fff0f6;
                    color: #ff4f86;
                    display: flex;
                    align-items: center;
                    justify-content: center;
                    margin: 0 auto 18px;
                    box-shadow: 0 10px 20px rgba(255, 92, 138, 0.12);
                }

                .form-label-custom {
                    font-size: 0.88rem;
                    font-weight: 800;
                    color: #495057;
                    margin-bottom: 7px;
                }

                .form-control {
                    border-radius: 999px;
                    padding: 12px 18px;
                    border: 1px solid #ffd6e5;
                    background: #fff;
                    font-size: 0.95rem;
                }

                .form-control:focus {
                    border-color: #ff5c8a;
                    box-shadow: 0 0 0 4px rgba(255, 92, 138, 0.15);
                }

                .btn-cute {
                    background: linear-gradient(135deg, #ff5c8a, #ff8a5c);
                    color: white;
                    border: none;
                    font-weight: 800;
                    border-radius: 999px;
                    padding: 12px;
                    box-shadow: 0 10px 22px rgba(255, 92, 138, 0.25);
                }

                .btn-cute:hover {
                    color: white;
                    opacity: 0.93;
                    transform: translateY(-1px);
                }

                .cute-link {
                    color: #ff4f86;
                    font-weight: 800;
                    text-decoration: none;
                }

                .cute-link:hover {
                    color: #e91e63;
                    text-decoration: underline;
                }

                .alert-cute {
                    background: #fff0f6;
                    color: #e91e63;
                    border: 1px solid #ffd1e2;
                    border-radius: 18px;
                    font-weight: 700;
                }
            </style>
        </head>

        <body>

            <div class="register-card">

                <div class="text-center mb-4">
                    <a href="${pageContext.request.contextPath}/home" class="brand-logo">
                        ✨ ONLINE ENTERTAINMENT
                    </a>

                    <div class="icon-circle mt-4">
                        <i class="fa-solid fa-user-plus fa-lg"></i>
                    </div>

                    <h3 class="fw-bold mb-1">Đăng ký</h3>
                    <p class="text-muted small mb-0">Tạo tài khoản để trải nghiệm OE 🌷</p>
                </div>

                <c:if test="${not empty error}">
                    <div class="alert alert-cute d-flex align-items-center mb-4">
                        <i class="fa-solid fa-circle-exclamation me-2"></i>
                        <div>${error}</div>
                    </div>
                </c:if>

                <form method="post" action="${pageContext.request.contextPath}/register">

                    <div class="mb-3">
                        <label class="form-label-custom">Tên đăng nhập</label>
                        <input type="text" name="username" class="form-control"
                            placeholder="Nhập tên tài khoản mong muốn" required>
                    </div>

                    <div class="mb-3">
                        <label class="form-label-custom">Mật khẩu</label>
                        <input type="password" name="password" class="form-control" placeholder="Nhập mật khẩu bảo mật"
                            required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label-custom">Email</label>
                        <input type="email" name="email" class="form-control" placeholder="Email" required>
                    </div>
                    <div class="mb-4">
                        <label class="form-label-custom">Họ và tên</label>
                        <input type="text" name="fullname" class="form-control" placeholder="Nhập họ và tên của bạn"
                            required>
                    </div>

                    <button type="submit" class="btn btn-cute w-100">
                        Tạo tài khoản <i class="fa-solid fa-circle-check ms-1 small"></i>
                    </button>

                </form>

                <div class="text-center mt-4">
                    <p class="small text-muted mb-0">
                        Bạn đã có tài khoản?
                        <a href="${pageContext.request.contextPath}/login" class="cute-link">
                            Đăng nhập tại đây
                        </a>
                    </p>
                </div>

            </div>

            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
        </body>

        </html>