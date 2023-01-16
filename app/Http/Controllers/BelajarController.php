<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Models\Materi;
use App\Models\Video;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Crypt;

class BeljarController extends Controller
{

    public function index()
    {
        $data = [
            'Materi' => Materi::paginate(9)
        ];

        return view('front.Materi.index',$data);
    }

    public function detail($id)
    {
        $dec_id = Crypt::decrypt($id);
        $data = [
            'Materi' => Materi::find($dec_id)
        ];

        return view('front.Materi.detail',$data);
    }

    public function belajar($id,$idvideo)
    {
        $dec_id = Crypt::decrypt($id);
        $dec_idvideo = Crypt::decrypt($idvideo);
        $data = [
            'Materi' => Materi::find($dec_id),
            'video' => Video::find($dec_idvideo)
        ];

        return view('front.Materi.belajar',$data);
    }
}
