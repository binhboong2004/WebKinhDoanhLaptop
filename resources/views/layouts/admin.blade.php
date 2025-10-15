<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="shortcut icon" href="{{ asset('user/img/favicon.png') }}" type="image/x-icon">
    <title>@yield('title', 'Admin ' . $general->app_name ?? "")</title>
    {{-- LINK --}}
    @include('components.admin-link')
    {{-- LINK --}}
</head>

<body class="vertical light">
    <div class="wrapper">
        {{-- NAV --}}
        @include('components.admin-nav')
        {{-- NAV --}}
        {{-- ASIDE --}}
        @include('components.admin-aside')
        {{-- ASIDE --}}

        <main role="main" class="main-content">
            <div class="container-fluid">
                <div class="row justify-content-center">
                    <div class="col-12">
                        {{-- CONTENT --}}
                        @yield('content')
                        {{-- CONTENT --}}
                    </div>
                </div>
            </div>
            {{-- NOTIFICATION --}}
            @include('components.admin-notification')
            {{-- NOTIFICATION --}}
            {{-- LOGOUT MODEL --}}
            @include('components.admin-logout-model')
            {{-- LOGOUT MODEL --}}
        </main> <!-- main -->
    </div> <!-- .wrapper -->
    {{-- SCRIPT --}}
    @include('components.admin-script')
    @include('components.sweet-alert-2')
    {{-- SCRIPT --}}
</body>
</html>
