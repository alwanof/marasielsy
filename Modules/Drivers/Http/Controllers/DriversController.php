<?php

namespace Modules\Drivers\Http\Controllers;

use App\Configuration;
use App\Country;
use App\User;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Routing\Controller;
use Illuminate\Support\Facades\Gate;
use Illuminate\Support\Facades\Notification;
use Modules\Drivers\Entities\Driver;
use Modules\Drivers\Events\NewDriverWasCreated;
use Modules\Drivers\Notifications\SendWelcomeEmail2Driver;
use phpDocumentor\Reflection\Types\Object_;
use Spatie\Permission\Models\Role;


class DriversController extends Controller
{
    /**
     * Display a listing of the resource.
     * @return Response
     */
    public function index($country = 'sy')
    {

        $countries = Country::all();

        $hash = str_random();

        return view('drivers::index', compact(['countries', 'hash']));
    }

    public function attach($email)
    {

        $feed=Driver::where('email',$email)->first();

        $isAccountExixst=($feed->count())?true:false;
        if(!$isAccountExixst){
            return redirect(url('/'));
        }
        $driver=Driver::where('email',$email)->first();


        return view('drivers::attach', compact(['email','driver']));
    }

    public function store(Request $request)
    {
        $isAccountExixst=(Driver::where('email',$request->email)->get()->count())?true:false;
        if($isAccountExixst){
            return redirect('/drivers/upload/attach/'.$request->email.'#attach');
        }


        $this->validate($request, [
            'fname' => 'required|min:2',
            'lname' => 'required|min:2',
            'email' => 'required|email|unique:drivers',
            'phone' => 'required|min:9',
            'city' => 'required|min:2',
            'country' => 'required',
            'upload_image' => 'required',
            'vtype' => 'required',
            'carmodel' => 'required|min:2|max:50',
            'plateno' => 'required|min:3|max:25',

        ]);

        try {
            Driver::create([
                'fname' => $request->fname,
                'lname' => $request->lname,
                'hash' => $request->hash,
                'email' => $request->email,
                'phone' => $request->phone,
                'city' => $request->city,
                'country' => $request->country,
                'vtype' => $request->vtype,
                'vmodel' => $request->carmodel,
                'plateno' => $request->plateno,
            ]);

            $data = new Object_();
            $data->name = $request->fname . ' ' . $request->lname;
            $data->email = $request->email;
            $data->country = $request->country;
            event(new NewDriverWasCreated($data));

            return redirect('/drivers/upload/attach/'.$request->email.'#attach')->with([
                'alert' => __('leads.lead_created')
            ]);
        } catch (Exception $e) {
            return back()->with([
                'danger' => $e->getMessage()
            ]);
        }
    }

    public function sheet($active = 0)
    {



        $acl = [
            'showDriversStatics' => (Gate::allows('show-drivers-statics')) ? true : false,
            'makeDriversApproved' => (Gate::allows('make_drivers_approved')) ? true : false,
        ];
        $pendingDrivers=Driver::where('active',0)->count();


        return view('drivers::sheet', compact(['acl','pendingDrivers']));
    }

    public function active()
    {


        $acl = [
            'addCredit2user' => (Gate::allows('add_credit2user')) ? true : false,

        ];



        return view('drivers::active', compact(['acl']));
    }

    public function customers(){
        $acl = [
            'addCredit2user' => (Gate::allows('add_credit2user')) ? true : false,

        ];



        return view('drivers::customers.active', compact(['acl']));
    }
    public function orders($filter){
        $acl = [
            'manageOrders' => (Gate::allows('manage_orders')) ? true : false,
            'ordersDone' => (Gate::allows('orders_done')) ? true : false,

        ];

        switch ($filter){
            case 'done':
                return view('drivers::orders.done', compact(['acl']));
                break;
            case 'progress':
                return view('drivers::orders.progress', compact(['acl']));
                break;
            default:
                return abort(404);

        }




    }


}
