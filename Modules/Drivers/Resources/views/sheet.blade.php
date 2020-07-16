@extends('layouts.master')
@section('title',__('master.pending-drivers'))

@section('nav')
    <div class="container-fluid">
        <div class="row mb-2">
            <div class="col-sm-6">
                <h1>{{ __('master.pending-drivers')}}</h1>
            </div>

        </div>
    </div><!-- /.container-fluid -->
@endsection
@section('content')
    <!-- Default box -->
    <driversinfohor-component :acl="{{json_encode($acl)}}" :pencount="{{$pendingDrivers}}" :lang="{{ json_encode(app()->getLocale()) }}" :auth="{{ json_encode(Auth::user()) }}" ></driversinfohor-component>
    <hr>

    <sheet-component :lang="{{ json_encode(app()->getLocale()) }}" :auth="{{ json_encode(Auth::user()) }}" :acl="{{json_encode($acl)}}"  ></sheet-component>


@endsection

@section('css')
    <link rel="stylesheet" href="{{asset('assets/plugins/toastr/toastr.css')}}">
@endsection

@section('js')
    <script src="{{asset('assets/plugins/toastr/toastr.min.js')}}"></script>
@endsection
