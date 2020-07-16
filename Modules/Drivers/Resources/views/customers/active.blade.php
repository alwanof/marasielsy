@extends('layouts.master')
@section('title',__('customers.activecustomers'))

@section('nav')
    <div class="container-fluid">
        <div class="row mb-2">
            <div class="col-sm-6">
                <h1>{{__('customers.activecustomers')}}</h1>
            </div>

        </div>
    </div><!-- /.container-fluid -->
@endsection
@section('content')
    <!-- Default box -->
    <activecustomers-component :lang="{{ json_encode(app()->getLocale()) }}" :auth="{{ json_encode(Auth::user()) }}" :acl="{{json_encode($acl)}}" ></activecustomers-component>


@endsection

@section('css')
    <link rel="stylesheet" href="{{asset('assets/plugins/toastr/toastr.css')}}">
@endsection

@section('js')
    <script src="{{asset('assets/plugins/toastr/toastr.min.js')}}"></script>
@endsection
