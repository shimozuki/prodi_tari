<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Models\Materi;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Crypt;

class WelcomeController extends Controller
{
    public function index()
    {
        $data = [
            'kelas' => Materi::all()
        ];

        return view('pages.front.welcome', $data);
    }

    public function about()
    {
        return view('front.about');
    }
}
