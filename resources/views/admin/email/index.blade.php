@extends('layouts.admin')
@section('title', 'Email List')
@section('content')
    <h2 class="mb-2 page-title">Email List</h2>
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
                                <th>Email</th>
                                <th>Thao tác</th>
                            </tr>
                        </thead>
                        <tbody>
                            @php
                                $stt = 1;
                            @endphp
                            @foreach ($emails as $email)
                            <tr>
                                <td>{{ $stt }}</td>
                                <td>{{ $email->name }}</td>
                                <td>{{ $email->email }}</td>
                                <td>
                                    <button class="btn btn-sm dropdown-toggle more-horizontal" type="button"
                                        data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <span class="text-muted sr-only">Action</span>
                                    </button>
                                    <div class="dropdown-menu dropdown-menu-right">
                                        <a class="dropdown-item" href="{{ route('admin.email.show', ['id' => $email->id]) }}"><i class="fe fe-eye fe-12 mr-4"></i> View</a>
                                        <a class="dropdown-item" href="{{ route('admin.email.destroy', ['id' => $email->id]) }}" onclick="return confirm('Are you sure?')"><i class="fe fe-delete fe-12 mr-4"></i> Delete</a>
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
