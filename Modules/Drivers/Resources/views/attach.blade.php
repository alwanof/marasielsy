@extends('drivers::layouts.master')
@section('page-title')
    {{__('leads.title')}}
@endsection
@section('body')

    <img class="img-fluid" src="{{asset('theme/img/slider2.jpg')}}" alt="Marasiel" title="Marasiel" style="margin: 82px auto;">

    <div id="attach" class="container bg-light p-5 shadow mb-5 rounded mt-1">
        @include('alert')
        <div class="row">
            <div class="col-lg-6">
                <div class="h1 from-heading">
                    <h2>{{__('leads.attch_page_title')}}</h2>
                    <i class="flag-icon flag-icon-{{session('flag')}}"></i>
                </div>
                <hr>

                <div >

                    <form id="idlic" action="{{Module::asset('drivers:upload.php')}}?folder={{$email}}" method="post"> <!-- 1-id -->
                        <label class="mt-3">{{__('leads.id_lic')}}</label>
                        <div class="custom-file ">
                            <input type="file" class="custom-file-input control" name="control"  accept="image/*"><!-- 2-control -->
                            <label class="custom-file-label target" for="customFile" ><!-- 3-target -->
                                <img  src="{{Module::asset('drivers:loader.gif')}}" class="icon" height="32px" style="display: none;"><!-- 4-icon -->
                            </label>
                        </div>
                        <div class="progress" style="height: 3px;display: none;"><!-- 5-progress -->
                            <div class="progress-bar bg-success" role="progressbar"  aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div><!-- 6-progresso -->
                        </div>
                    </form>
                    <form id="driverlic" action="{{Module::asset('drivers:upload.php')}}?folder={{$email}}" method="post"> <!-- 1-id -->
                        <label class="mt-3">{{__('leads.driver_lic')}}</label>
                        <div class="custom-file ">
                            <input type="file" class="custom-file-input control" name="control"  accept="image/*"><!-- 2-control -->
                            <label class="custom-file-label target" for="customFile" ><!-- 3-target -->
                                <img  src="{{Module::asset('drivers:loader.gif')}}" class="icon" height="32px" style="display: none;"><!-- 4-icon -->
                            </label>
                        </div>
                        <div class="progress" style="height: 3px;display: none;"><!-- 5-progress -->
                            <div class="progress-bar bg-success" role="progressbar"  aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div><!-- 6-progresso -->
                        </div>
                    </form>
                    <form id="carlic" action="{{Module::asset('drivers:upload.php')}}?folder={{$email}}" method="post"> <!-- 1-id -->
                        <label class="mt-3">{{__('leads.car_lic')}}</label>
                        <div class="custom-file ">
                            <input type="file" class="custom-file-input control" name="control"  accept="image/*"><!-- 2-control -->
                            <label class="custom-file-label target" for="customFile" ><!-- 3-target -->
                                <img  src="{{Module::asset('drivers:loader.gif')}}" class="icon" height="32px" style="display: none;"><!-- 4-icon -->
                            </label>
                        </div>
                        <div class="progress" style="height: 3px;display: none;"><!-- 5-progress -->
                            <div class="progress-bar bg-success" role="progressbar"  aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div><!-- 6-progresso -->
                        </div>
                    </form>
                    <form id="crimlic" action="{{Module::asset('drivers:upload.php')}}?folder={{$email}}" method="post"> <!-- 1-id -->
                        <label class="mt-3">{{__('leads.criminal_lic')}}</label>
                        <div class="custom-file ">
                            <input type="file" class="custom-file-input control" name="control"  accept="image/*"><!-- 2-control -->
                            <label class="custom-file-label target" for="customFile" ><!-- 3-target -->
                                <img  src="{{Module::asset('drivers:loader.gif')}}" class="icon" height="32px" style="display: none;"><!-- 4-icon -->
                            </label>
                        </div>
                        <div class="progress" style="height: 3px;display: none;"><!-- 5-progress -->
                            <div class="progress-bar bg-success" role="progressbar"  aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div><!-- 6-progresso -->
                        </div>
                    </form>

                    <hr >

                    <a type="button" href="{{url('/')}}" class="btn btn-lg btn-yellow text-white">{{__('leads.apply2')}}</a>
                </div>
            </div>
            <div class="col-lg-6">
                <h3 class="text-center">{{$driver->fname}} {{$driver->lname}}</h3>
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

                </ul>
                <p class="leads text-center text-yellow">
                    {{__('leads.support.text')}}<br>
                    {{__('leads.support.email')}}
                </p>
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

    <script src="{{Module::asset('drivers:js/jquery.form.js')}}"></script>
    <script>

        var doFunc=function(event){
            if($('#'+event.data.idKey+' .control').val())
            {
                event.preventDefault();
                $('#'+event.data.idKey+' .icon').show();
                $('#'+event.data.idKey+' .progress').show();
                $("#"+event.data.idKey).ajaxSubmit({
                    target: '#'+event.data.idKey+' .target',
                    beforeSubmit:function(){
                        $('#'+event.data.idKey+' .progress-bar').width('0%');
                    },
                    uploadProgress: function(percentageComplete)
                    {
                        $('#'+event.data.idKey+' .progress-bar').animate({
                            width: percentageComplete + '%'
                        }, {
                            duration: 1000
                        });
                    },
                    success:function(){
                        $('#'+event.data.idKey+' .icon').hide();
                        $('#'+event.data.idKey+' .progress-bar').width('100%');
                    },
                    resetForm: true
                });
            }
            return false;
        }

        $(document).ready(function(){

            $('#idlic').change({idKey: "idlic"},doFunc);
            $('#driverlic').change({idKey: "driverlic"},doFunc);
            $('#carlic').change({idKey: "carlic"},doFunc);
            $('#crimlic').change({idKey: "crimlic"},doFunc);



        });


    </script>
@stop

