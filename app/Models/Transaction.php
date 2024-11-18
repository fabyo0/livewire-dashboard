<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class Transaction extends Model
{
    use HasFactory;

    protected $guarded = [];

    public function subOrder(): BelongsTo
    {
        return $this->belongsTo(related: SubOrder::class, foreignKey: 'sub_order_id');
    }
}
