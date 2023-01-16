<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Materi extends Model
{
    protected $table = 'materi';
    protected $fillable = ['name_kelas', 'type_kelas', 'description_video','thumbnail'];

    public function video()
    {
        return $this->hasMany('App\Models\Video');
    }
}
