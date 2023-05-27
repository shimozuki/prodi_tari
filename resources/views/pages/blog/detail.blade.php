@extends('layout.app')
@section('content')
<div class="row">
    <div class="col-md-12">
        <div class="card">
            <div class="card-header">
                <h4>{{ $blog->name_blog }}</h4>
                <div class="card-header-action">
                    <a href="{{ route('admin.blog.edit',Crypt::encrypt($blog->id)) }}"
                        class="btn btn-warning">Edit</a>
                        <a href="{{ route('admin.blog.hapus', Crypt::encrypt($blog->id)) }}" class="btn btn-danger" onclick="confirmDelete()">Hapus</a>

                    <button id="btn-back" class="btn btn-primary">
                        Kembali
                    </button>
                </div>
            </div>
            <div class="card-body">
                <div class="row">
                    <div class="col-md-6">
                        <table>
                            <tr>
                                <td style="vertical-align: top">Konten</td>
                                <td style="vertical-align: top" class="py-2 px-3">:</td>
                                <td>{!! $blog->content_blog !!}</td>
                            </tr>
                        </table>
                    </div>
                    <div class="col-md-6">
                        <img src="{{ asset('storage/'.$blog->thumbnail_blog) }}" width="100%" alt="" srcset="">
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
function confirmDelete() {
    if (confirm("Apakah Anda yakin ingin menghapus?")) {
        // Kode yang akan dieksekusi jika pengguna menekan tombol OK
        // Misalnya, Anda dapat memanggil fungsi untuk menghapus data
        // atau mengirimkan permintaan AJAX ke server.
        alert("Data berhasil dihapus!");
    } else {
        // Kode yang akan dieksekusi jika pengguna menekan tombol Batal
        alert("Penghapusan dibatalkan.");
    }
}
</script>
@endsection