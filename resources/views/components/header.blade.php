<!-- Humberger Begin -->
<div class="humberger__menu__overlay"></div>
<div class="humberger__menu__wrapper">
    <div class="humberger__menu__logo">
        <a href="{ route('home.index') }}"><img src="{{ asset('storage/' . $general->logo ) ??  asset('user/img/logo.png') }}" alt=""></a>
    </div>
    <div class="humberger__menu__cart">
        <ul>
            
            <li><a href="{{ route('user.cart') }}"><i class="fa fa-shopping-bag"></i> <span>3</span></a></li>
        </ul>
        <div class="header__cart__price">item: <span>$150.00</span></div>
    </div>
    <div class="humberger__menu__widget">
        <div class="header__top__right__language">
            <img src="{{ asset('user/img/language.png') }}" alt="">
            <div>English</div>
            <span class="arrow_carrot-down"></span>
            <ul>
                <li><a href="#">Spanis</a></li>
                <li><a href="#">English</a></li>
            </ul>
        </div>
    </div>
    <nav class="humberger__menu__nav mobile-menu">
        <ul>
            <li class="{{ request()->routeIs('home.index') ? 'active' : '' }}">
                <a href="{{ route('home.index') }}">Home</a>
            </li>
            <li class="{{ request()->routeIs('home.shop') ? 'active' : '' }}">
                <a href="{{ route('home.shop') }}">Shop</a>
            </li>
            <li class="{{ request()->routeIs('home.blog') ? 'active' : '' }}">
                <a href="{{ route('home.blog') }}">Blog</a>
            </li>
            <li class="{{ request()->routeIs('home.contact') ? 'active' : '' }}">
                <a href="{{ route('home.contact') }}">Contact</a>
            </li>
            <li class="{{ request()->routeIs('home.policy') ? 'active' : '' }}">
                <a href="{{ route('home.policy') }}">Policy</a>
            </li>            
            @auth
                <li><a href="{{ route('user.profile') }}">Hồ sơ</a></li>
                <li><a href="{{ route('user.my-order') }}">Đơn hàng</a></li>
                <li>
                    <form action="{{ route('logout') }}" method="POST">
                        @csrf
                        <button class="btn m-0 d-block btn-logout-mb">Logout</button>
                    </form>
                </li>
            @endauth
            @guest
                <li><a href="{{ route('login') }}">My Order</a></li>
            @endguest
        </ul>
    </nav>
    <div id="mobile-menu-wrap"></div>
    <div class="header__top__right__social">
        <a href="#"><i class="fa fa-facebook"></i></a>
        <a href="#"><i class="fa fa-twitter"></i></a>
        <a href="#"><i class="fa fa-linkedin"></i></a>
        <a href="#"><i class="fa fa-pinterest-p"></i></a>
    </div>
    <div class="humberger__menu__contact">
        <ul>
            <li><i class="fa fa-envelope"></i> {{ $contact->email ?? "" }}</li>
            <li>{{ $general->welcome ?? "" }}</li>
        </ul>
    </div>
</div>
<!-- Humberger End -->

<!-- Header Section Begin -->
<header class="header">
    <div class="header__top">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-6">
                    <div class="header__top__left">
                        <ul>
                            <li><i class="fa fa-envelope"></i> {{ $contact->email ?? "" }}</li>
                            <li>{{ $general->welcome ?? "" }}</li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6">
                    <div class="header__top__right">
                        <div class="header__top__right__social">
                            <a href="#"><i class="fa fa-facebook"></i></a>
                            <a href="#"><i class="fa fa-twitter"></i></a>
                            <a href="#"><i class="fa fa-linkedin"></i></a>
                            <a href="#"><i class="fa fa-pinterest-p"></i></a>
                        </div>
                        <div class="header__top__right__language">
                            <img src="{{ asset('user/img/language_vn.png') }}" alt="">
                            <div>VietNamese</div>
                            <span class="arrow_carrot-down"></span>
                            <ul>
                                <li><a href="#">VietNamese</a></li>
                                <li><a href="#">English</a></li>
                            </ul>
                        </div>
                        <div class="header__top__right__language mr-0">
                            @auth
                                <div><i class="fa fa-user"></i> {{ Auth::user()->name }}</div>
                                <span class="arrow_carrot-down"></span>
                                <ul>
                                    @if (Auth::user()->role->name === 'admin')
                                        <li><a href="{{ route('admin.index') }}">Quản trị</a></li>
                                    @endif
                                    <li><a href="{{ route('user.profile') }}">Hồ sơ</a></li>
                                    <li><a href="{{ route('user.my-order') }}">Đơn hàng</a></li>
                                    <li>
                                        <form action="{{ route('logout') }}" method="POST">
                                            @csrf
                                            <button class="btn m-0 d-block btn-logout">Đăng xuất</button>
                                        </form>
                                    </li>
                                </ul>
                            @endauth
                            @guest
                                <div class="header__top__right__auth">
                                    <a href="{{ route('login') }}"><i class="fa fa-user"></i> Đăng nhập</a>
                                </div>
                            @endguest
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-lg-3">
                <div class="header__logo">
                    <a href="{{ route('home.index') }}">
                        @if (is_null($general->logo))
                            <img src="{{ asset('user/img/logo.png') }}" alt="">
                        @else
                            <img src="{{ asset('storage/' . $general->logo ) ?? asset('user/img/logo.png') }}" alt="" width="100%" height="50px" style="object-fit: cover">
                        @endif
                    </a>
                </div>
            </div>
            <div class="col-lg-6">
                <nav class="header__menu">
                    <ul>
                        <li class="{{ request()->routeIs('home.index') ? 'active' : '' }}">
                            <a href="{{ route('home.index') }}">Trang chủ</a>
                        </li>
                        <li class="{{ request()->routeIs('home.shop') ? 'active' : '' }}">
                            <a href="{{ route('home.shop') }}">Cửa hàng</a>
                        </li>
                        <li class="{{ request()->routeIs('home.contact') ? 'active' : '' }}">
                            <a href="{{ route('home.contact') }}">Liên hệ</a>
                        </li>
                        <li class="{{ request()->routeIs('home.policy') ? 'active' : '' }}">
                            <a href="{{ route('home.policy') }}">Chính sách</a>
                        </li>                        
                    </ul>
                </nav>
            </div>
            <div class="col-lg-3">
                <div class="header__cart">
                    <ul>
                        <li>
                            <a href="{{ route('user.cart') }}">
                                <i class="fa fa-shopping-bag"></i>
                                <span>{{ is_array(Session::get('cart')) ? count(Session::get('cart')) : 0 }}</span>
                            </a>
                        </li>
                    </ul>                    
                    <div class="header__cart__price">
                        @php
                            $cart = session()->get('cart', []); // Mặc định trả về mảng rỗng nếu không có giá trị
                            $total = 0;
                        
                            // Đảm bảo rằng $cart là một mảng trước khi sử dụng foreach
                            if (is_array($cart)) {
                                foreach ($cart as $item) {
                                    $total += isset($item['price']) ? ($item['price'] * ($item['quantity'] ?? 1)) : 0;
                                }
                            }
                        @endphp
                        <span>{{ number_format($total) }} VNĐ</span>
                    </div>
                </div>
            </div>
        </div>
        <div class="humberger__open">
            <i class="fa fa-bars"></i>
        </div>
    </div>
</header>
<!-- Header Section End -->