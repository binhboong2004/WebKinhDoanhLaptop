<div class="modal fade modal-notif modal-slide" tabindex="-1" role="dialog" aria-labelledby="defaultModalLabel"
    aria-hidden="true">
    <div class="modal-dialog modal-sm" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="defaultModalLabel">Thông báo</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                @if (count($notifications) > 0)
                    <div class="list-group list-group-flush my-n3">
                        @foreach ($notifications as $notification)
                            <div class="list-group-item bg-transparent">
                                <div class="row align-items-center">
                                    <div class="col-auto">
                                        <span class="fe fe-{{ translateClassIconNotification($notification->type) }} fe-24"></span>
                                    </div>
                                    <div class="col">
                                        <a href="{{ route(routeViewNotification($notification->type), ['id' => $notification->id_link]) }}" class="d-block"><small><strong>{{ $notification->content }}</strong></small></a>
                                        <small class="badge badge-pill badge-success text-white">{{ formatDateTime($notification->created_at) }}</small>
                                    </div>
                                </div>
                            </div>
                        @endforeach
                    </div> 
                @else
                <span><strong class="text-danger">Không có thông báo nào.</strong></span>
                @endif
            </div>
            <div class="modal-footer">
                <a href="{{ route('admin.notification.clear') }}" class="btn btn-secondary btn-block">Xóa tất cả</a>
            </div>
        </div>
    </div>
</div>
