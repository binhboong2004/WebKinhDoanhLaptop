<script src="{{ asset('admin/js/jquery.min.js') }}"></script>
<script src="{{ asset('admin/js/popper.min.js') }}"></script>
<script src="{{ asset('admin/js/moment.min.js') }}"></script>
<script src="{{ asset('admin/js/bootstrap.min.js') }}"></script>
<script src="{{ asset('admin/js/simplebar.min.js') }}"></script>
<script src="{{ asset('admin/js/daterangepicker.js') }}"></script>
<script src="{{ asset('admin/js/jquery.stickOnScroll.js') }}"></script>
<script src="{{ asset('admin/js/tinycolor-min.js') }}"></script>
<script src="{{ asset('admin/js/config.js') }}"></script>
<script src="{{ asset('admin/js/apps.js') }}"></script>
<script src='{{ asset('admin/js/jquery.dataTables.min.js') }}'></script>
<script src='{{ asset('admin/js/dataTables.bootstrap4.min.js') }}'></script>
<script src="{{ asset('admin/js/jquery.mask.min.js') }}"></script>
<script src="{{ asset('admin/js/select2.min.js')}}"></script>
<script src="{{ asset('admin/js/jquery.steps.min.js') }}"></script>
<script src="{{ asset('admin/js/jquery.validate.min.js') }}"></script>
<script src="{{ asset('admin/js/jquery.timepicker.js') }}"></script>
<script src="{{ asset('admin/js/dropzone.min.js') }}"></script>
<script src="{{ asset('admin/js/uppy.min.js') }}"></script>
<script src="{{ asset('admin/js/quill.min.js') }}"></script>
<script src="{{ asset('admin/js/d3.min.js') }}"></script>
<script src="{{ asset('admin/js/topojson.min.js') }}"></script>
<script src="{{ asset('admin/js/datamaps.all.min.js') }}"></script>
<script src="{{ asset('admin/js/datamaps-zoomto.js') }}"></script>
<script src="{{ asset('admin/js/datamaps.custom.js') }}"></script>
<script src="{{ asset('admin/js/Chart.min.js') }}"></script>
<script>
  /* defind global options */
  Chart.defaults.global.defaultFontFamily = base.defaultFontFamily;
  Chart.defaults.global.defaultFontColor = colors.mutedColor;
</script>
<script src="{{ asset('admin/js/gauge.min.js') }}"></script>
<script src="{{ asset('admin/js/jquery.sparkline.min.js') }}"></script>
<script src="{{ asset('admin/js/apexcharts.min.js') }}"></script>
<script src="{{ asset('admin/js/apexcharts.custom.js') }}"></script>

{{-- /* ----------------------------------- add ---------------------------------- */ --}}
<script src="{{ asset('admin/js/chart-order-revenua.js') }}"></script>
{{-- /* ----------------------------------- add ---------------------------------- */ --}}
{{-- /* -------------------------------- datatable ------------------------------- */ --}}
<script>
    $('#dataTable-1').DataTable({
        autoWidth: true,
        "lengthMenu": [
            [16, 32, 64, -1],
            [16, 32, 64, "All"]
        ]
    });
</script>
{{-- /* -------------------------------- datatable ------------------------------- */ --}}

{{-- /* -------------------------------- ckeditor5 ------------------------------- */ --}}
<script src="https://cdn.ckeditor.com/ckeditor5/39.0.0/classic/ckeditor.js"></script>
<script>
    ClassicEditor
    .create(document.querySelector('#content'))
    .catch(error => {
        console.error(error);
    });
    ClassicEditor
    .create(document.querySelector('#information'))
    .catch(error => {
        console.error(error);
    });
    ClassicEditor
    .create(document.querySelector('#description'))
    .catch(error => {
        console.error(error);
    });
</script>
{{-- @include('components.admin-editor') --}}
{{-- /* -------------------------------- ckeditor5 ------------------------------- */ --}}

