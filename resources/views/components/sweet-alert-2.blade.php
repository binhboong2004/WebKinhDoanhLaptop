<!-- SweetAlert2 JS -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.all.min.js"></script>
@if (Session::has('success'))
    <input type="hidden" name="message" id="message" value="{{ Session::get('success') }}">
    <script>
        Swal.fire({
            title: 'EgaGear',
            text: document.getElementById('message').value,
            icon: 'success',
            showConfirmButton: false,
            timer: 1000
        });
    </script>
@endif
@if (Session::has('error'))
    <input type="hidden" name="message" id="message" value="{{ Session::get('error') }}">
    <script>
        Swal.fire({
            title: 'EgaGear',
            text: document.getElementById('message').value,
            icon: 'error',
            confirmButtonText: 'OK'
        });
    </script>
@endif
<script>
    function confirmAction(message, redirectUrl) {
        Swal.fire({
            title: 'Confirm',
            text: message,
            icon: 'warning',
            showCancelButton: true,
            confirmButtonText: 'OK',
            cancelButtonText: 'Cancel',
            reverseButtons: true
        }).then((result) => {
            if (result.isConfirmed) {
                window.location.href = redirectUrl;
            }
        });
    }
</script>