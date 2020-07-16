@extends('layouts.master')
@section('title',__('orders.completedorders'))

@section('nav')
    <div class="container-fluid">
        <div class="row mb-2">
            <div class="col-sm-6">
                <h1>{{__('orders.completedorders')}}</h1>
            </div>

        </div>
    </div><!-- /.container-fluid -->
@endsection
@section('content')
    <!-- Default box -->
    <orderdone-component :lang="{{ json_encode(app()->getLocale()) }}" :auth="{{ json_encode(Auth::user()) }}" :acl="{{json_encode($acl)}}" ></orderdone-component>

@endsection

@section('css')
    <link rel="stylesheet" href="{{asset('assets/plugins/toastr/toastr.css')}}">
@endsection

@section('js')
    <script src="{{asset('assets/plugins/toastr/toastr.min.js')}}"></script>
@endsection

