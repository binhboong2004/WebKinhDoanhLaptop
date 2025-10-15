<footer class="footer spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-3 col-md-6 col-sm-6">
                <div class="footer__about">
                    <div class="footer__about__logo">
                        <a href="{{ route('home.index') }}">
                            @if (is_null($general->logo))
                                <img src="{{ asset('user/img/logo.png') }}" alt="">
                            @else
                                <img src="{{ asset('storage/' . $general->logo ) ?? asset('user/img/logo.png') }}" alt="" width="100%" height="50px" style="object-fit: cover">
                            @endif
                        </a>
                    </div>
                    <ul>
                        <li>Địa chỉ: {{ $contact->address }}</li>
                        <li>Số điện thoại: {{ $contact->phone }}</li>
                        <li>Email: {{ $contact->email }}</li>
                    </ul>
                </div>
            </div>
            <div class="col-lg-4 col-md-6 col-sm-6 offset-lg-1">
                <div class="footer__widget">
                    <h6>Liên kết hữu ích</h6>
                    <ul>
                        <li><a href="#">Về chúng tôi</a></li>
                        <li><a href="#">Giới thiệu cửa hàng</a></li>
                        <li><a href="#">Mua sắm an toàn</a></li>
                        <li><a href="#">Thông tin giao hàng</a></li>
                        <li><a href="#">Chính sách bảo mật</a></li>
                        <li><a href="#">Sơ đồ trang web</a></li>
                    </ul>
                    <ul>
                        <li><a href="#">Chúng tôi là ai</a></li>
                        <li><a href="#">Dịch vụ của chúng tôi</a></li>
                        <li><a href="#">Dự án</a></li>
                        <li><a href="#">Liên hệ</a></li>
                        <li><a href="#">Đổi mới</a></li>
                        <li><a href="#">Đánh giá khách hàng</a></li>
                    </ul>
                </div>
                
            </div>
            <div class="col-lg-4 col-md-12">
                <div class="footer__widget">
                    <h6>Tham gia bản tin của chúng tôi ngay bây giờ</h6>
                    <p>Nhận email cập nhật về cửa hàng mới nhất và các ưu đãi đặc biệt của chúng tôi.</p>
                    <form action="#">
                        <input type="text" placeholder="Nhập email của bạn">
                        <button type="submit" class="site-btn">Đăng ký</button>
                    </form>
                    <div class="footer__widget__social">
                        <a href="#"><i class="fa fa-facebook"></i></a>
                        <a href="#"><i class="fa fa-instagram"></i></a>
                        <a href="#"><i class="fa fa-twitter"></i></a>
                        <a href="#"><i class="fa fa-pinterest"></i></a>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12">
                <div class="footer__copyright">
                    <div class="footer__copyright__text">
                        <p>
                            Copyright &copy;
                            <script>
                                document.write(new Date().getFullYear());
                            </script> Bản quyền thuộc về <i
                                class="fa fa-heart" aria-hidden="true"></i> <a href="#"
                                target="_blank">EgaGear</a>
                        </p>
                    </div>
                    <div class="footer__copyright__payment"><img src="{{ asset('user/img/payment-item.png') }}" alt=""></div>
                </div>
            </div>
        </div>
    </div>
</footer>
