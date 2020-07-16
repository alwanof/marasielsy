<?php

namespace Modules\Drivers\Listeners;

use App\Configuration;
use App\Notifications\WelcomeNewUser;
use App\User;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Support\Facades\Notification;
use Modules\Drivers\Notifications\SendWelcomeEmail2Driver;

class NotifyWelcomeEmail
{
    /**
     * Create the event listener.
     *
     * @return void
     */
    public function __construct()
    {
        //
    }

    /**
     * Handle the event.
     *
     * @param  object  $event
     * @return void
     */
    public function handle($event)
    {
        $domain=$event->user->country;
        if(Configuration::where([
                'name'=>'drivers_welcome_message',
                'domain'=>$domain
            ])->count()>0){
            $msg=Configuration::where([
                'name'=>'drivers_welcome_message',
                'domain'=>$domain
            ])->first()->value;
        }else{
            $msg=(Configuration::where('name','drivers_welcome_message')->count()>0)?Configuration::where('name','drivers_welcome_message')->first()->value:'Message is not set';
        }



        Notification::route('mail',$event->user->email)
            ->notify(new SendWelcomeEmail2Driver($msg,$event->user->name));
    }
}
