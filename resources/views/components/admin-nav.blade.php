<nav class="topnav navbar navbar-light">
    <button type="button" class="navbar-toggler text-muted mt-2 p-0 mr-3 collapseSidebar">
        <i class="fe fe-menu navbar-toggler-icon"></i>
    </button>
    <form class="form-inline mr-auto searchform text-muted">
        <input class="form-control mr-sm-2 bg-transparent border-0 pl-4 text-muted" type="search"
            placeholder="Type something..." aria-label="Search">
    </form>
    <ul class="nav">
        <li class="nav-item">
            <a class="nav-link text-muted my-2" href="#" id="modeSwitcher" data-mode="light">
                <i class="fe fe-sun fe-16"></i>
            </a>
        </li>
        <li class="nav-item nav-notif">
            <a class="nav-link text-muted my-2" href="./#" data-toggle="modal" data-target=".modal-notif">
                <span class="fe fe-bell fe-16"></span>
                @if (count($notifications) > 0)
                    <span class="dot dot-md bg-danger"></span>
                @endif
            </a>
        </li>
        <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle text-muted pr-0" href="#" id="navbarDropdownMenuLink"
                role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <span class="avatar avatar-sm mt-2">
                    <img style="height: 35px !important;width: 35px !important" src="{{ asset('storage/' . Auth::user()->avatar ) ?? asset('admin/assets/images/profile-default.png') }}"
                        alt="..." class="avatar-img rounded-circle">
                </span>
            </a>
            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownMenuLink">
                <a class="dropdown-item" href="{{ route('admin.user.show', ['id' => auth()->user()]) }}">Hồ sơ</a>
                {{-- <a class="dropdown-item" href="#">Settings</a> --}}
                {{-- <a class="dropdown-item" href="#">Activities</a> --}}
                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#defaultModal">Đăng xuất</a>
            </div>
        </li>
    </ul>
</nav>
