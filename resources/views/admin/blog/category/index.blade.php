@extends('layouts.admin')
@section('title', 'Category Blog List')
@section('content')
    <h2 class="mb-2 page-title">Category Blog List</h2>
    <div class="row my-4">
        <!-- Small table -->
        <div class="col-md-12">
            <div class="card shadow">
                <div class="card-body">
                    <!-- table -->
                    <table class="table datatables" id="dataTable-1">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>Name</th>
                                <th>Status</th>
                                <th>Thao tác</th>
                            </tr>
                        </thead>
                        <tbody>
                            @php
                                $stt = 1;
                            @endphp
                            @foreach ($categories as $category)
                            <tr>
                                <td>{{ $stt }}</td>
                                <td>{{ $category->category_name }}</td>
                                <td>
                                    <form action="{{ route('admin.blog.category.update-status', ['id' => $category->id]) }}" method="POST">
                                        @csrf
                                        @method('PUT')
                                        <input type="hidden" value="{{ $category->status }}" name="status">
                                        <button class="btn"><span class="fe fe-23 fe-{{ translateClassStatusCustom($category->status) }}" style="font-size: 20px"></span></button>
                                    </form>
                                </td>
                                <td>
                                    <button class="btn btn-sm dropdown-toggle more-horizontal" type="button"
                                        data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <span class="text-muted sr-only">Action</span>
                                    </button>
                                    <div class="dropdown-menu dropdown-menu-right">
                                        <a class="dropdown-item" href="{{ route('admin.blog.category.edit', ['id' => $category->id]) }}"><i class="fe fe-edit fe-12 mr-4"></i> Edit</a>
                                        <a class="dropdown-item" href="{{ route('admin.blog.category.destroy', ['id' => $category->id]) }}" onclick="return confirm('Are you sure?')"><i class="fe fe-delete fe-12 mr-4"></i> Delete</a>
                                    </div>
                                </td>
                            </tr>
                            @php
                                $stt ++;
                            @endphp
                            @endforeach
                        </tbody>
                    </table>
                </div>
            </div>
        </div> <!-- simple table -->
    </div> <!-- end section -->
@endsection
