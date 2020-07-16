@extends('layouts.master')
@section('title','Dashboard')

@section('nav')
<div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>{{__('noticenter.title')}}</h1>
          </div>

        </div>
      </div><!-- /.container-fluid -->
@endsection
@section('content')
  <!-- Default box -->
  <div class="container">
      <div class="row">
          <div class="col-lg-4">
              <driversinfo-component :acl="{{json_encode($acl)}}" :pencount="{{$pendingDrivers}}" :lang="{{ json_encode(app()->getLocale()) }}" :auth="{{ json_encode(Auth::user()) }}" ></driversinfo-component>

          </div>
          <div class="col-lg-4">
              <ordersinfo-component :acl="{{json_encode($acl)}}" :lang="{{ json_encode(app()->getLocale()) }}" :auth="{{ json_encode(Auth::user()) }}"></ordersinfo-component>

          </div>
          <div class="col-lg-4">
              <div class="card">
                  <div class="card-header">

                      <button type="button" class="btn btn-danger btn-sm">
                          {{__('noticenter.new')}} <span class="badge badge-light">{{$data['newNoti']->count()}}</span>
                      </button>
                      <div class="card-tools">
                          <button type="button" class="btn btn-tool" data-card-widget="collapse" data-toggle="tooltip" title="Collapse">
                              <i class="fas fa-minus"></i></button>
                          <button type="button" class="btn btn-tool" data-card-widget="remove" data-toggle="tooltip" title="Remove">
                              <i class="fas fa-times"></i></button>
                      </div>
                  </div>
                  <div class="card-body p-0">
                      @foreach($data['newNoti'] as $item)
                          <div class="p-2 mb-1 bg-light">
                              <img src="{{$item->data['user']['avatar']}}" width="48px" class="img-thumbnail img-circle" /> {{$item->data['data']}}
                          </div>
                      @endforeach
                  </div>
                  <!-- /.card-body -->

              </div>

              <div class="card">
                  <div class="card-header">

                      <button type="button" class="btn btn-info btn-sm">
                          {{__('noticenter.streams')}} <span class="badge badge-light">{{$data['allNoti']->count()}}</span>
                      </button>
                      <div class="card-tools">
                          <button type="button" class="btn btn-tool" data-card-widget="collapse" data-toggle="tooltip" title="Collapse">
                              <i class="fas fa-minus"></i></button>
                          <button type="button" class="btn btn-tool" data-card-widget="remove" data-toggle="tooltip" title="Remove">
                              <i class="fas fa-times"></i></button>
                      </div>
                  </div>
                  <div class="card-body p-0">
                      @foreach($data['oldNoti'] as $item)
                          <div class="p-2 mb-1 bg-light">
                              <img src="{{$item->data['user']['avatar']}}" width="48px" class="img-thumbnail img-circle" /> {{$item->data['data']}}
                          </div>
                      @endforeach
                  </div>
                  <!-- /.card-body -->
              </div>


          </div>
      </div>




  </div>

      <!-- /.card -->
@endsection

@section('css')
          <style>
              .dropdown-item{
                  white-space: normal !important;
              }
          </style>
    @endsection
