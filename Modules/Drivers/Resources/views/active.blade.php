@extends('layouts.master')
@section('title',__('master.active-drivers'))

@section('nav')
    <div class="container-fluid">
        <div class="row mb-2">
            <div class="col-sm-6">
                <h1>{{__('master.active-drivers')}}</h1>
            </div>

        </div>
    </div><!-- /.container-fluid -->
@endsection
@section('content')
    <!-- Default box -->
    <active-component :lang="{{ json_encode(app()->getLocale()) }}" :auth="{{ json_encode(Auth::user()) }}" :acl="{{json_encode($acl)}}" ></active-component>


@endsection

@section('css')
    <link rel="stylesheet" href="{{asset('assets/plugins/toastr/toastr.css')}}">
@endsection

@section('js')
    <script src="{{asset('assets/plugins/toastr/toastr.min.js')}}"></script>
@endsection
