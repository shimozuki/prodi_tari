<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Video extends Model
{
    protected $table = 'video';
    protected $fillabel = ['name_video','url_video','kelas_id'];

    public function kelas()
    {
        return $this->belongsTo('App\Models\Materi');
    }
}
