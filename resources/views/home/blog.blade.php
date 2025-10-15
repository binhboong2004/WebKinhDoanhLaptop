@extends('layouts.user')
@section('title', 'Blog')
@section('content')
    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="{{ asset('user/img/breadcrumb.jpg') }}">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>Blog</h2>
                        <div class="breadcrumb__option">
                            <a href="./index.html">Home</a>
                            <span>Blog</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Blog Section Begin -->
    <section class="blog spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 col-md-7 order-md-1 order-1">
                    @if (count($blogs) > 0)
                        <h4 class="mb-4 mt-5 text-success font-weight-bold">{{ $title ?? "" }}</h4>
                        <div class="row">
                            @foreach ($blogs as $blog)
                                <div class="col-lg-6 col-md-6 col-sm-6">
                                    <div class="blog__item">
                                        <div class="blog__item__pic">
                                            <img src="{{ asset('storage/' . $blog->image)}}" alt="">
                                        </div>
                                        <div class="blog__item__text">
                                            <ul>
                                                <li><i class="fa fa-calendar-o"></i> {{ $blog->created_at }}</li>
                                            </ul>
                                            <h5><a href="{{ route('home.blog-details', ['id' => $blog->id]) }}">{{ $blog->title }}</a></h5>
                                            <p>{{ $blog->description }}</p>
                                            <a href="{{ route('home.blog-details', ['id' => $blog->id]) }}" class="blog__btn">READ MORE <span class="arrow_right"></span></a>
                                        </div>
                                    </div>
                                </div>
                                @endforeach
                                @if (count($blogs) > 6)
                                    <div class="col-lg-12 mt-3">
                                        <div class="product__pagination blog__pagination">
                                            <a href="#">1</a>
                                            <a href="#">2</a>
                                            <a href="#">3</a>
                                            <a href="#"><i class="fa fa-long-arrow-right"></i></a>
                                        </div>
                                    </div>
                                @endif
                        </div>
                    @else
                        <h4 class="mb-4 mt-5 text-danger font-weight-bold">No post.</h4>
                    @endif
                </div>
                <div class="col-lg-4 col-md-5 order-md-1 order-2">
                    @include('sections.blog-sidebar')
                </div>
            </div>
        </div>
    </section>
    <!-- Blog Section End -->
@endsection