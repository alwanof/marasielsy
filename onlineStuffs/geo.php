<?php

namespace App\Http\Middleware;

use App\Country;
use Closure;
use Illuminate\Support\Facades\App;
use Illuminate\Support\Facades\Config;
use Illuminate\Support\Facades\Session;

class LangSwit
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
        if (!Session::has('country')){
            $x=geoip('');

            if(isset($x['iso_code']) && $x['iso_code']){
                if(isset(Config::get('countries.'.strtolower($x['iso_code']))[0])){
                    $lang=Config::get('countries.'.strtolower($x['iso_code']))[0];
                }else{
                    $lang='en';
                }
                $phoneCode=Country::where('iso',strtoupper($x['iso_code']))->first()->phonecode;
                Session::put([
                    'flag'=>strtolower($x['iso_code']),
                    'country'=>strtolower($x['country']),
                    'city'=>strtolower($x['city']),
                    'phonecode'=>$phoneCode,
                    'lang'=>$lang
                ]);
            }else{
                Session::put([
                    'flag'=>'tr',
                    'country'=>'Turkey',
                    'city'=>'Istanbul',
                    'phonecode'=>'90',
                    'lang'=>'en'
                ]);
            }



            App::setLocale($lang);


        }else{
            App::setLocale(session('lang'));


        }
        return $next($request);
    }
}
