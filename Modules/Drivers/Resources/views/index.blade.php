@extends('drivers::layouts.master')
@section('page-title')
    {{__('leads.title')}}
@endsection
@section('body')

    <img class="img-fluid" src="{{asset('theme/img/slider2.jpg')}}" alt="Marasiel" title="Marasiel" style="margin: 82px auto;">

    <div class="container bg-light p-5 shadow mb-5 rounded mt-1">
        @include('alert')
        <div class="row">
            <div class="col-lg-6">
                <div class="h1 from-heading">
                    <h2>{{__('leads.title')}}</h2>
                    <i class="flag-icon flag-icon-{{session('flag')}}"></i>
                </div>
                <hr>

                <form action="{{route('drivers.store')}}" method="POST">
                    @csrf
                    <input type="hidden" id="hash" name="hash" value="{{$hash}}">
                    <div class="form-row">
                        <div class="form-group col-md-4">
                            <!-- image croppie -->
                            <div class="card  p-0 mb-3">
                                <div class="card-header text-center">
                                    {{__('leads.your_photo')}}
                                </div>

                                <div class="card-body py-4 text-center">
                                    <div class="cropU">
                                        <div id="placeholder">
                                            <img src="{{Module::asset('drivers:img/0.png')}}" class="img-thumbnail rounded-circle" />
                                        </div>
                                        <label class="btn btn-blue mt-2">
                                            {{__('leads.browse')}} <input type="file" class="custom-file-input upload_image" name="upload_image" id="upload_image" accept="image/*" hidden>
                                        </label>

                                    </div>

                                </div>
                            </div>

                        </div>
                        <div class="form-group col-md-8">
                            <label class="form-label-style" for="inputFName">{{__('leads.fname')}}</label>
                            <input type="text" name="fname" value="{{old('fname')}}" class="form-control" id="inputFName" required>
                            <label class="form-label-style" for="inputLName">{{__('leads.lname')}}</label>
                            <input type="text" name="lname" value="{{old('lname')}}" class="form-control" id="inputLName" required>
                            <label class="form-label-style" for="inputEmail4">{{__('leads.email')}}</label>
                            <input type="email" name="email" value="{{old('email')}}" class="form-control" id="inputEmail4" required>
                            <label class="form-label-style" for="inputPhone">{{__('leads.mobile')}}</label>
                            <div class="input-group">
                                <div class="input-group-prepend">
                                    <span class="input-group-text" id="inputGroupPrepend">+{{ Session('phonecode') }}</span>
                                </div>
                                <input type="text" name="phone" value=" {{ old('phone') }}"  class="form-control" id="inputPhone4" required>
                            </div>

                        </div>
                    </div>
                    <hr >
                    <div class="form-row">

                        <div class="form-group col-md-6">
                            <label class="form-label-style" for="inputCountry4">{{__('leads.country')}}</label>

                            <select name="country" id="inputCountry4" class="form-control" required>
                                <option value="SY" selected>Syria</option>
                            </select>
                        </div>
                        <div class="form-group col-md-6">

                            <label class="form-label-style" for="inputPCity4">{{__('leads.city')}}</label>
                            <input type="text" name="city" value="{{old('city')}}" class="form-control" id="inputPCity4" required>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-4">
                            <label class="form-label-style" for="inputVType4">{{__('leads.vtype')}}</label>
                            <select name="vtype" id="inputVType4" class="form-control" required>
                                <option value="" selected="" disabled="">{{__('leads.vtype')}}</option>
                                <option value="1" {{(old('vtype') == '1' ? 'selected':'')}}>{{__('leads.vtypelist')[0]}}</option>
                                <option value="0" {{(old('vtype') == '0' ? 'selected':'')}}>{{__('leads.vtypelist')[1]}}</option>


                            </select>
                        </div>
                        <div class="form-group col-md-4">

                            <label class="form-label-style" for="inputCarmodel4">{{__('leads.carmodel')}}</label>
                            <input type="text" name="carmodel" value="{{old('carmodel')}}" class="form-control" id="inputCarmodel4" required>
                        </div>
                        <div class="form-group col-md-4">

                            <label class="form-label-style" for="inputPlateno4">{{__('leads.plateno')}}</label>
                            <input type="text" name="plateno" value="{{old('plateno')}}" class="form-control" id="inputPlateno4" required>
                        </div>
                    </div>
                    <hr >

                    <button type="submit" class="btn btn-lg btn-yellow text-white">{{__('leads.apply')}}</button>
                </form>
            </div>
            <div class="col-lg-6">
                <div class="text-center text-yellow">
                    <i class="fas fa-clipboard-check fa-3x mt-5"></i>
                    <div class="h2">{{__('leads.requirments.title')}}</div>
                    <hr class="border-yellow" width="50%">
                </div>

                <ul style="list-style: none;margin:0 37px; {{ session('locale') == 'ar' ? 'direction: rtl;text-align: right;' : '' }}"  class="mt-2">
                    <li class="mb-2">
                        <i class="fas fa-check"></i>
                        {{__('leads.requirments.content')[0]}}
                    </li>
                    <li class="mb-2">
                        <i class="fas fa-check"></i>
                        {{__('leads.requirments.content')[1]}}
                    </li>
                    <li class="mb-2">
                        <i class="fas fa-check"></i>
                        {{__('leads.requirments.content')[2]}}
                    </li>
                    <li class="mb-2">
                        <i class="fas fa-check"></i>
                        {{__('leads.requirments.content')[3]}}
                    </li>
                    <li class="mb-2">
                        <i class="fas fa-check"></i>
                        {{__('leads.requirments.content')[4]}}
                    </li>
                    <li class="mb-2">
                        <i class="fas fa-check"></i>
                        {{__('leads.requirments.content')[5]}}
                    </li>

                </ul>
                <p class="leads text-center text-yellow">
                    {{__('leads.support.text')}}<br>
                    {{__('leads.support.email')}}
                </p>
            </div>
        </div>
    </div>

    <!-- The Modal -->
    <div id="uploadimageModal" class="modal" role="dialog">
        <div class="modal-dialog" style="max-width: 400px !important;">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">Upload & Crop Image</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>

                </div>
                <div class="modal-body">

                    <div class="text-center" style="">
                        <div id="image_demo" style="width:320px; margin: 24px auto !important;"></div>
                    </div>


                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-success crop_image" data-dismiss="modal">Crop & Upload Image</button>
                    <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
@stop


@section('css')
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/croppie/2.6.4/croppie.min.css">
    <style>
        .cover{
            background-image:url("{{Module::asset('drivers:img/bg-drivers.jpg')}}") ;
            background-position:center ;
            background-size:cover ;
            background-attachment: fixed;
            height: 450px;
        }
    </style>
@stop

@section('js')
<script src="https://cdnjs.cloudflare.com/ajax/libs/exif-js/2.3.0/exif.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/croppie/2.6.4/croppie.min.js"></script>

    <script src="{{Module::asset('drivers:js/croppie/cropConfig.js')}}"></script>
    <script>
        $(document).ready(function(){

            $('#upload_image').on('change', function(){
                canvasArea(this,'#placeholder');
            });

        });
    </script>
    @stop
