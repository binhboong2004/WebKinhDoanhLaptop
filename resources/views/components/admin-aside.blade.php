<aside class="sidebar-left border-right bg-white shadow" id="leftSidebar" data-simplebar>
    <a href="#" class="btn collapseSidebar toggle-btn d-lg-none text-muted ml-2 mt-3" data-toggle="toggle">
        <i class="fe fe-x"><span class="sr-only"></span></i>
    </a>
    <nav class="vertnav navbar navbar-light">
        <!-- nav bar -->
        <div class="w-100 mb-4 d-flex">
            <a class="navbar-brand mx-auto mt-2 flex-fill text-center" href="">
                <svg class="w-6 h-6 text-dark dark:text-white" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="none" viewBox="0 0 24 24">
                    <path fill="currentColor" fill-rule="evenodd" d="M3.005 12 3 6.408l6.8-.923v6.517H3.005ZM11 5.32 19.997 4v8H11V5.32ZM20.067 13l-.069 8-9.065-1.275L11 13h9.067ZM9.8 19.58l-6.795-.931V13H9.8v6.58Z" clip-rule="evenodd"/>
                </svg>
            </a>
        </div>
        <ul class="navbar-nav flex-fill w-100">
            <li class="nav-item w-100">
                <a class="nav-link" href="{{ route('admin.index') }}">
                    <i class="fe fe-home fe-16"></i>
                    <span class="ml-3 item-text">Thống kê</span>
                </a>
            </li>
        </ul>
        <p class="text-muted nav-heading mt-2 mb-1">
            <span>Quản lý</span>
        </p>
        <ul class="navbar-nav flex-fill w-100 mb-2">
            <li class="nav-item dropdown">
                <a href="#ui-elements" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle nav-link">
                    <i class="fe fe-users fe-16"></i>
                    <span class="ml-3 item-text">Người dùng</span>
                </a>
                <ul class="collapse list-unstyled pl-4 w-100" id="ui-elements">
                    <li class="nav-item">
                        <a class="nav-link pl-3" href="{{ route('admin.user.index') }}">
                            <i class="fe fe-list fe-12"></i>
                            <span class="ml-1 item-text">Danh sách</span>
                        </a>
                    </li>
                </ul>
            </li>
            <li class="nav-item dropdown">
                <a href="#category" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle nav-link">
                    <i class="fe fe-grid fe-16"></i>
                    <span class="ml-3 item-text">Danh mục</span>
                </a>
                <ul class="collapse list-unstyled pl-4 w-100" id="category">
                    <li class="nav-item">
                        <a class="nav-link pl-3" href="{{ route('admin.category.index') }}">
                            <i class="fe fe-list fe-12"></i>
                            <span class="ml-1 item-text">
                                Danh sách
                            </span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link pl-3" href="{{ route('admin.category.create') }}">
                            <i class="fe fe-plus fe-12"></i>
                            <span class="ml-1 item-text">
                                Thêm mới
                            </span>
                        </a>
                    </li>
                </ul>
            </li>
            <li class="nav-item dropdown">
                <a href="#forms" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle nav-link">
                    <i class="fe fe-database fe-16"></i>
                    <span class="ml-3 item-text">Sản phẩm</span>
                </a>
                <ul class="collapse list-unstyled pl-4 w-100" id="forms">
                    <li class="nav-item">
                        <a class="nav-link pl-3" href="{{ route('admin.product.index') }}">
                            <i class="fe fe-list fe-12"></i>
                            <span class="ml-1 item-text">
                                Danh sách
                            </span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link pl-3" href="{{ route('admin.product.create') }}">
                            <i class="fe fe-plus fe-12"></i>
                            <span class="ml-1 item-text">
                                Thêm mới
                            </span>
                        </a>
                    </li>
                </ul>
            </li>
            <li class="nav-item dropdown">
                <a href="#order" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle nav-link">
                    <i class="fe fe-shopping-bag fe-16"></i>
                    <span class="ml-3 item-text">Đơn hàng</span>
                </a>
                <ul class="collapse list-unstyled pl-4 w-100" id="order">
                    <li class="nav-item">
                        <a class="nav-link pl-3" href="{{ route('admin.order.index') }}">
                            <i class="fe fe-list fe-12"></i>
                            <span class="ml-1 item-text">
                                Danh sách
                            </span>
                        </a>
                    </li>
                </ul>
            </li>
        </ul>
    </nav>
</aside>
