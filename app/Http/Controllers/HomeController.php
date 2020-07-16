<?php

namespace App\Http\Controllers;

use App\Configuration;
use App\Setting;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\App;
use Illuminate\Support\Facades\Gate;
use Modules\Drivers\Entities\Driver;
use Spatie\Permission\Models\Role;

class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth',['except'=>['lang','formm','savee']]);
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index()
    {
        $limit=auth()->user()->getSetting('notifications-show-limit')->value;

        $data=[
            'allNoti'=>auth()->user()->notifications->take($limit),
            'newNoti'=>auth()->user()->unreadNotifications->take($limit),
            'oldNoti'=>auth()->user()->readNotifications->take($limit),
        ];




        $acl = [
            'showDriversStatics' => (Gate::allows('show-drivers-statics')) ? true : false,
            'showTopDrivers' => (Gate::allows('show-top-drivers')) ? true : false,
            'showOrdersStatics' => (Gate::allows('show-orders-statics')) ? true : false,
        ];
        $pendingDrivers=Driver::where('active',0)->count();

        auth()->user()->unreadNotifications->markAsRead();
        return view('home',compact(['data','acl','pendingDrivers']));
    }

    public function lang($locale)
    {
        app()->setLocale($locale);
        session()->put('locale', $locale);
        return redirect()->back();
    }

    public function formm(){
        return view('formm');
    }

    public function savee(Request $request){
        $set=new Configuration;
        $set->name='utf';
        $set->value=$request->body;
        $set->save();
    }
}
