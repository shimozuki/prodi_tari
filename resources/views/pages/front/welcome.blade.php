@extends('pages.layouts.front')
@section('content')

<!-- banner part start-->
<section class="banner_part">
    <div class="container">
        <div class="row align-items-center">
            <div class="col-lg-6 col-xl-6">
                <div class="banner_text">
                    <div class="banner_text_iner">
                        <h5>Semua orang bisa Menari</h5>
                        <h1>Belajar Tari Disini Aja</h1>
                        <p>Dengan materi mudah dimengerti dan berbentuk video sehingga membantu proses pembelajaran anda
                        </p>
                        <a href="{{ route('kelasb') }}" class="btn_1">Belajar Sekarang</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- banner part start-->

<!-- feature_part start-->
<!-- upcoming_event part start-->

<!-- learning part start-->
<section class="learning_part">
    <div class="container">
        <div class="row align-items-sm-center align-items-lg-stretch">
            <div class="col-md-7 col-lg-7">
                <div class="learning_img">
                    <img src="{{ asset('assets/frontemplate') }}/img/learning_img.png" alt="">
                </div>
            </div>
            <div class="col-md-5 col-lg-5">
                <div class="learning_member_text">
                    <h5>Tentang Kami</h5>
                    <h2>Belajar Online Dimanapun Kapanpun</h2>
                    @php
                    $setting = \App\Models\Setting::first()
                    @endphp
                    {!! $setting->about !!}
                    <ul>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- learning part end-->


<!--::review_part start::-->
<section class="special_cource padding_top">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-xl-5">
                <div class="section_tittle text-center">
                    <h2>Kelas Popular</h2>
                </div>
            </div>
        </div>
        <div class="row">
            @foreach ($kelas as $item)
            <div class="col-sm-6 col-lg-4 mb-2">
                <a href="{{ route('kelasb.detail',Crypt::encrypt($item->id)) }}">
                    <div class="single_special_cource">
                        <img src="{{ asset('storage/' . $item->thumbnail) }}" class="special_img" alt="">
                        <div class="special_cource_text">
                            <div class="d-flex justify-content-between">
                                <div class="btn_4">
                                    @if ($item->type_kelas == 0)
                                    Gratis
                                    @elseif($item->type_kelas == 1)
                                    Regular
                                    @elseif($item->type_kelas == 2)
                                    Premium
                                    @endif
                                </div>
                                <a href="{{ route('kelasb.detail',Crypt::encrypt($item->id)) }}"
                                    class="btn btn-secondary">Lihat</a>
                            </div>
                            <a href="{{ route('kelasb.detail',Crypt::encrypt($item->id)) }}">
                                <h3>{{ $item->name_kelas }}</h3>
                            </a>
                            <div style="white-space: nowrap;
                        overflow: hidden;
                        text-overflow: ellipsis;">{!! $item->description_kelas !!}</div>
                        </div>

                    </div>
                </a>
            </div>
            @endforeach
        </div>
    </div>
</section>

@endsection