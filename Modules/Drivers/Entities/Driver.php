<?php

namespace Modules\Drivers\Entities;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Notifications\Notifiable;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Storage;

class Driver extends Model
{
    use Notifiable;
    protected $guarded = [];
    protected $appends = ['avatar','attachs'];

    public function getAvatarAttribute()
    {
        $path = file_exists(public_path().'/modules/drivers/uploads/drivers/' . $this->hash . '.jpg');
        $avatar = ($path) ? asset('modules/drivers/uploads/drivers/' . $this->hash . '.jpg') : asset('modules/drivers/uploads/drivers/0.jpg');
        return $avatar;
    }
    public function getAttachsAttribute()
    {
        $files=[];

        $path = file_exists(public_path().'/modules/drivers/uploads/attach/'.$this->email);
        if(!$path){
            return $files;
        }

        $filesInFolder =File::files(public_path().'/modules/drivers/uploads/attach/'.$this->email);

        foreach($filesInFolder as $path) {
            $file = pathinfo($path);
            $files[]= $file['basename'];
        }
        return $files;
    }

}
