<?php

namespace Modules\Drivers\Providers;

use Illuminate\Foundation\Support\Providers\EventServiceProvider as ServiceProvider;
use Modules\Drivers\Events\NewDriverWasCreated;
use Modules\Drivers\Listeners\NotifyWelcomeEmail;

class EventServiceProvider extends ServiceProvider
{
    protected $listen = [
        NewDriverWasCreated::class=>[
            NotifyWelcomeEmail::class
        ],
    ];
}
