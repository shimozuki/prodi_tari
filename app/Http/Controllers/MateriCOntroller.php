<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Materi;
use App\Models\Video;
use Illuminate\Support\Facades\Crypt;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;

class MateriCOntroller extends Controller
{
    public function index()
    {
        $data = [
            'title' => 'Data Master Kelas',
            'kelas' => Materi::all()
        ];

        return view('pages.materi.index', $data);
    }

    public function tambah()
    {
        $data = [
            'title' => 'Tambah Kelas',
        ];
        return view('pages.materi.tambah', $data);
    }

    public function simpan(Request $request)
    {

        $validator = Validator($request->all(), [
            'name_kelas' => 'required',
            'type_kelas' => 'required',
            'description_kelas' => 'required',
            'thumbnail' => 'required|mimes:png,jpg,jpeg'
        ]);

        if ($validator->fails()) {
            return redirect()->route('admin.kelas.tambah')->withErrors($validator)->withInput();
        } else {
            $file = $request->file('thumbnail')->store('thumbnail_kelas', 'public');
            $obj = [
                'name_kelas' => $request->name_kelas,
                'type_kelas' => 0,
                'description_kelas' => $request->description_kelas,
                'thumbnail' => $file,
            ];
            Materi::insert($obj);
            return redirect()->route('admin.kelas')->with('status', 'Berhasil Menambah Kelas Baru');
        }
    }

    public function detail($id)
    {
        $dec_id = Crypt::decrypt($id);
        $kelas = Materi::find($dec_id);
        $title = 'Detail Kelas';
        $video = Materi::join('video', 'materi.id', '=', 'video.kelas_id')->where('materi.id', $dec_id)->get();
        return view('pages.materi.detail', compact('kelas', 'video', 'title'));
    }

    public function hapus($id)
    {
        $dec_id = Crypt::decrypt($id);
        $kelas = Materi::find($dec_id);
        Storage::delete('public/'.$kelas->thumbnail);
        Video::where('kelas_id', '=', $dec_id)->delete();
        $kelas->delete();
        return redirect()->route('admin.kelas')->with('status', 'Berhasil Menghapus Kelas');
    }

    public function edit($id)
    {
        $dec_id = Crypt::decrypt($id);
        $data = [
            'title' => 'Edit Kelas',
            'kelas' => Materi::find($dec_id)
        ];
        return view('pages.materi.edit', $data);
    }

    public function update(Request $request, $id)
    {
        $dec_id = Crypt::decrypt($id);
        $validator = Validator($request->all(), [
            'name_kelas' => 'required',
            'type_kelas' => 'required',
            'description_kelas' => 'required',
            'thumbnail' => 'mimes:png,jpg,jpeg'
        ]);

        if ($validator->fails()) {
            return redirect()->route('admin.kelas.edit', $id)->withErrors($validator)->withInput();
        } else {

            $kelas = Materi::find($dec_id);
            if ($request->file('thumbnail')) {
                Storage::delete('public/'.'public/'.$kelas->thumbnail);
                $file = $request->file('thumbnail')->store('thumbnail_kelas', 'public');
                $kelas->name_kelas = $request->name_kelas;
                $kelas->type_kelas = Crypt::decrypt($request->type_kelas);
                $kelas->description_kelas = $request->description_kelas;
                $kelas->thumbnail = $file;
            } else {
                $kelas->name_kelas = $request->name_kelas;
                $kelas->type_kelas = Crypt::decrypt($request->type_kelas);
                $kelas->description_kelas = $request->description_kelas;
            }
            $kelas->save();
            return redirect()->route('admin.kelas.detail',$id)->with('status', 'Berhasil Memperbarui Kelas');
        }
    }

    public function tambahvideo($id)
    {
        $data = [
            'title' => 'Tambah Video Materi',
            'id' => $id
        ];

        return view('pages.materi.tambahvideo',$data);
    }

    public function simpanvideo(Request $request,$id)
    {

        $validator = Validator($request->all(), [
            'name_video' => 'required',
            'url_video' => 'required',
        ]);

        if ($validator->fails()) {
            return redirect()->route('admin.kelas.tambahvideo',$id)->withErrors($validator)->withInput();
        } else {
            $obj = [
                'name_video' => $request->name_video,
                'kelas_id' => Crypt::decrypt($id),
                'url_video' => $request->url_video,
            ];
            Video::insert($obj);
            return redirect()->route('admin.kelas.detail',$id)->with('status', 'Berhasil Menambah Materi Video');
        }
    }

    public function hapusvideo($id,$idkelas)
    {
        $dec_id = Crypt::decrypt($id);
        Video::where('id','=',$dec_id)->delete();
        return redirect()->route('admin.kelas.detail',$idkelas)->with('status', 'Berhasil Menghapus Video Materi');
    }
}
