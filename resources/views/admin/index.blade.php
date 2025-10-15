@extends('layouts.admin')
@section('title', 'Admin EgaGear')
@section('content')
    <div class="container-fluid">
        <div class="row justify-content-center">
            <div class="col-12">
                <div class="row">
                    <div class="col-md-6 col-xl-3 mb-4">
                        <div class="card shadow border-0">
                            <div class="card-body">
                                <div class="row align-items-center">
                                    <div class="col-3 text-center">
                                        <span class="circle circle-sm bg-primary">
                                            <i class="fe fe-16 fe-shopping-cart text-white mb-0"></i>
                                        </span>
                                    </div>
                                    <div class="col pr-0">
                                        <p class="small text-muted mb-0">Đơn hàng</p>
                                        <span class="h3 mb-0">{{ $totalOrders }}</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-xl-3 mb-4">
                        <div class="card shadow border-0">
                            <div class="card-body">
                                <div class="row align-items-center">
                                    <div class="col-3 text-center">
                                        <span class="circle circle-sm bg-primary">
                                            <i class="fe fe-16 fe-users text-white mb-0"></i>
                                        </span>
                                    </div>
                                    <div class="col">
                                        <p class="small text-muted mb-0">Người dùng</p>
                                        <div class="row align-items-center no-gutters">
                                            <div class="col-auto">
                                                <span class="h3 mr-2 mb-0"> {{ $totalUsers }} </span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-xl-3 mb-4">
                        <div class="card shadow border-0">
                            <div class="card-body">
                                <div class="row align-items-center">
                                    <div class="col-3 text-center">
                                        <span class="circle circle-sm bg-primary">
                                            <i class="fe fe-16 fe-database text-white mb-0"></i>
                                        </span>
                                    </div>
                                    <div class="col">
                                        <p class="small text-muted mb-0">Sản phẩm</p>
                                        <span class="h3 mb-0">{{ $totalProducts }}</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div> <!-- end section -->
                <div class="row align-items-center my-2">
                    <div class="col-auto ml-auto">
                        <form class="form-inline">
                            <div class="form-group">
                                <label for="reportrange" class="sr-only">Date Ranges</label>
                                <div id="reportrange" class="px-2 py-2 text-muted">
                                    <i class="fe fe-calendar fe-16 mx-2"></i>
                                    <span class="small"></span>
                                </div>
                            </div>
                            <div class="form-group">
                                <button type="button" class="btn btn-sm"><span
                                        class="fe fe-refresh-ccw fe-12 text-muted"></span></button>
                                <button type="button" class="btn btn-sm"><span
                                        class="fe fe-filter fe-12 text-muted"></span></button>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="row my-4">
                    <div class="col-md-12">
                        <div class="chart-box">
                            <div id="columnChart"></div>
                        </div>
                    </div> <!-- .col -->
                </div> <!-- end section -->
                <div class="row">
                    <div class="col-md-6">
                        <div class="card shadow mb-4">
                            <div class="card-header">
                                <strong class="card-title">Top Selling</strong>
                                <a class="float-right small text-muted" href="#!">View all</a>
                            </div>
                            <div class="card-body">
                                <div class="list-group list-group-flush my-n3">
                                    @foreach ($topSelling as $product)
                                        <div class="list-group-item">
                                            <div class="row align-items-center">
                                                <div class="col-3 col-md-2">
                                                    <img src="{{ asset('storage/' . $product->image) }}" alt="..."
                                                        class="thumbnail-sm rounded">
                                                </div>
                                                <div class="col">
                                                    <strong>{{ $product->product_name }}</strong>
                                                    <div class="my-0 text-muted small">{{ $product->category->category_name }}</div>
                                                </div>
                                                <div class="col-auto">
                                                    <strong class="">+85%</strong>
                                                    <div class="progress mt-2" style="height: 4px;">
                                                        <div class="progress-bar bg-success" role="progressbar" style="width: 85%"
                                                            aria-valuenow="85" aria-valuemin="0" aria-valuemax="100"></div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    @endforeach
                                </div> <!-- / .list-group -->
                            </div> <!-- / .card-body -->
                        </div> <!-- .card -->
                    </div> <!-- .col -->
                </div> <!-- .row -->
            </div>
        </div> <!-- .row -->
    </div> <!-- .container-fluid -->
@endsection

