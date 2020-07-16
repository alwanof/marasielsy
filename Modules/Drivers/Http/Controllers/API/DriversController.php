<?php

namespace Modules\Drivers\Http\Controllers\API;

use App\Setting;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Routing\Controller;
use Illuminate\Support\Facades\Storage;
use Modules\Drivers\Entities\Driver;
use Modules\Drivers\Notifications\SendAuth2Driver;

class DriversController extends Controller
{
    /**
     * Display a listing of the resource.
     * @return Response
     */
    public function index()
    {
        $drivers=Driver::where('active',0)->latest()->paginate(10);
        return $drivers;
    }

    public function search(Request $request)
    {
        $drivers= Driver::where('fname', 'LIKE', '%' . $request->keywords . '%')
            ->orWhere('lname', 'LIKE', '%' . $request->keywords . '%')
            ->orWhere('email', 'LIKE', '%' . $request->keywords . '%')
            ->orWhere('phone', 'LIKE', '%' . $request->keywords . '%')
            ->paginate(10);

        return $drivers;
    }

    public function setApproved(Driver $driver,$uid)
    {

        $driver->active = ($driver->active == 0) ? 1 : 0;
        $driver->save();
        $driver->notify(new SendAuth2Driver());

        return 1;
    }




    /**
     * Update the specified resource in storage.
     * @param Request $request
     * @param int $id
     * @return Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     * @param int $id
     * @return Response
     */

    public function destroy($id)
    {
        //
    }

    public function search4null(){
        $set=new Setting;
        $set->user_id=1;
        $set->name='foo';
        $set->value=99;
        $set->save();
    }
}
