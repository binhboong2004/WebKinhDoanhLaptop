<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="EgaGear">
    <meta name="keywords" content="user, layout, template">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>@yield('title', $general->app_name ?? 'EgaGear')</title>
    <link rel="shortcut icon" href="{{ asset('user/img/favicon.png') }}" type="image/x-icon">

    <meta name="csrf-token" content="{{ csrf_token() }}">

    {{-- /* ---------------------------------- LINK ---------------------------------- */ --}}
    @include('components.link')
    {{-- /* ---------------------------------- LINK ---------------------------------- */ --}}
</head>

<body>
    {{-- /* --------------------------------- HEADER --------------------------------- */ --}}
    @include('components.loader')
    @include('components.header')
    @include('components.nav')
    {{-- /* --------------------------------- HEADER --------------------------------- */ --}}
    
    {{-- /* ---------------------------------- MAIN ---------------------------------- */ --}}
    @yield('content')
    {{-- /* ---------------------------------- MAIN ---------------------------------- */ --}}
    
    {{-- /* --------------------------------- FOOTER --------------------------------- */ --}}
    @include('components.footer')
    @include('components.script')
    @include('components.sweet-alert-2')
    {{-- /* --------------------------------- FOOTER --------------------------------- */ --}}
    @include('partials.chatbot')
    @vite('resources/js/app.js')

</body>

</html>
