@extends('layouts.frontend')

@section('body')
    <section class="row cover align-items-center">

    </section>
    <div class="container bg-light p-5 shadow mb-5 rounded" style="margin-top: -128px;">
        <div class="row">
            <div class="col-lg-6">
                <div class="h1">
                    <i class="flag-icon flag-icon-{{session('flag')}}"></i> {{__('leads.title')}}
                </div>
                <hr>
                <form>
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="inputFName">{{__('leads.fname')}}</label>
                            <input type="text" name="fname" class="form-control" id="inputFName" required>
                        </div>
                        <div class="form-group col-md-6">
                            <label for="inputLName">{{__('leads.lname')}}</label>
                            <input type="text" name="lname" class="form-control" id="inputLName" required>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="inputEmail4">{{__('leads.email')}}</label>
                            <input type="email" name="email" class="form-control" id="inputEmail4">
                        </div>
                        <div class="form-group col-md-6">

                            <label for="inputPhone">{{__('leads.mobile')}}</label>
                            <input type="text" name="phone" class="form-control" id="inputPhone4">
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="inputCountry4">{{__('leads.country')}}</label>
                            <select name="country" id="inputCountry4" class="form-control">
                                <option value="">++++</option>
                                <option value="">++++</option>
                            </select>
                        </div>
                        <div class="form-group col-md-6">

                            <label for="inputPhone">{{__('leads.city')}}</label>
                            <input type="text" name="phone" class="form-control" id="inputPhone4">
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-4">
                            <label for="inputVType4">{{__('leads.vtype')}}</label>
                            <select name="vtype" id="inputVType4" class="form-control">
                                <option value="">++++</option>
                                <option value="">++++</option>
                            </select>
                        </div>
                        <div class="form-group col-md-4">

                            <label for="inputCarmodel4">{{__('leads.carmodel')}}</label>
                            <input type="text" name="carmodel" class="form-control" id="inputCarmodel4">
                        </div>
                        <div class="form-group col-md-4">

                            <label for="inputPlateno4">{{__('leads.plateno')}}</label>
                            <input type="text" name="plateno" class="form-control" id="inputPlateno4">
                        </div>
                    </div>


                    <button type="submit" class="btn btn-lg btn-primary text-white">{{__('leads.apply')}}</button>
                </form>
            </div>
            <div class="col-lg-6">
                <div class="text-center text-primary">
                    <i class="fas fa-clipboard-check fa-3x mt-5"></i>
                    <div class="h2">{{__('leads.requirments.title')}}</div>
                    <hr class="border-primary" width="50%">
                </div>


                <ul style="list-style: none;"  class="mt-2">
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
            </div>
        </div>
    </div>
    @stop


@section('css')
    <style>
        .cover{
            background-image:url("{{asset('front/img/bg-drivers.jpg')}}") ;
            background-position:center ;
            background-size:cover ;
            background-attachment: fixed;
            height: 450px;
        }
    </style>
@stop
