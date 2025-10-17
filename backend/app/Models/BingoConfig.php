<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class BingoConfig extends Model
{
    protected $fillable = ['board_size', 'lines_to_win', 'activities'];

    protected $casts = [
        'activities' => 'array',
    ];
}
