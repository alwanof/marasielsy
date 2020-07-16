@extends('layouts.frontend')

@section('page-title')
    Home
@endsection

@section('content')
    <div id="home" class="carousel slide hero" data-ride="carousel">
        <div class="carousel-inner">
            <div class="carousel-item ">
                <img src="{{asset('theme/img/slider1.jpg')}}" class="d-block w-100" alt="...">
                <div class="carousel-caption d-none d-md-block" style="left: -52%;top: 55%;">

                </div>
            </div>
            <div class="carousel-item active">
                <img src="{{asset('theme/img/slider2.jpg')}}" class="d-block w-100" alt="...">
                <div class="carousel-caption d-none d-md-block" style="left: -52%;top: 55%;">

                </div>
            </div>
        </div>
        <a class="carousel-control-prev" href="#home" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#home" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>

    <div class="container text-center about-us" id="about-us">
        <div class="row">
            <div class="col-lg-12">
                <h2 align="center">{{__('home.about.title')}}</h2>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-6 about-us-section">

                <img class="img-fluid" src="{{asset('theme/img/about1.jpg')}}" alt="Marasiel" title="Who are we ?" id="about-img-1">

                <h3>
                {{__('home.about.section')[0]}}
                </h3>

                <p>
                {{__('home.about.content')[0]}}
                </p>

            </div>
            <div class="col-lg-6 about-us-section">
                <img class="img-fluid" src="{{asset('theme/img/about2.jpg')}}" alt="Marasiel" title="What we do?" id="about-img-2">
                <h3>
                {{__('home.about.section')[1]}}
                </h3>

                <p>
                {{__('home.about.content')[0]}}
                </p>
            </div>
        </div>
    </div>

    <div class="container-fluid  bg-yellow competitiveness" id="competitiveness">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 competitiveness-description">
                    <h2>{{__('home.competitiveness.title')}}</h2>
                    <p>
                    {{__('home.competitiveness.content')}}
                    </p>
                </div>

                <div class="col-lg-6 text-right">
                    <img class="img-fluid" src="{{asset('theme/img/place.png')}}" alt="Marasiel" title="Competitiveness" id="competitiveness-img">
                </div>
            </div>
        </div>
    </div>

    <div class="container features" id="features">

        <div class="row">
            <div class="col-lg-12">
                <h2 align="center">{{__('home.whyus.title')}}</h2>
            </div>
        </div>

        <div class="row items">
            <div class="col-lg-4 item">
                <img class="img-fluid" src="{{asset('theme/img/nomore.png')}}" alt="Marasiel" title="No more unavailable cars or motors.">
                <p>
                {{__('home.whyus.content')[0]}}
                </p>
            </div>
            <div class="col-lg-4 item">
                <img class="img-fluid" src="{{asset('theme/img/getoffer.png')}}" alt="Marasiel" title="Get offer from your taxi driver and choose your best offer and car.">
                <p>
                {{__('home.whyus.content')[1]}}
                </p>
            </div>
            <div class="col-lg-4 item">
                <img class="img-fluid" src="{{asset('theme/img/shoppingas.png')}}" alt="Marasiel" title="Shopping assistant and motor available 24/7. ">
                <p>
                    {{__('home.whyus.content')[2]}}
                </p>
            </div>
        </div>

        <div class="row items2">
            <div class="col-lg-4 item">
                <img class="img-fluid" src="{{asset('theme/img/takeyourtaxi.png')}}" alt="Marasiel" title="Take your taxi from your location 24/7 ">
                <p>
                {{__('home.whyus.content')[3]}}
                </p>
            </div>
            <div class="col-lg-4 item">
                <img class="img-fluid" src="{{asset('theme/img/ourshopping.png')}}" alt="Marasiel" title="Our shopping assistant will pay for your order and deliver it to you on time.">
                <p>
                {{__('home.whyus.content')[4]}}
                </p>
            </div>
            <div class="col-lg-4 item">
                <img class="img-fluid" src="{{asset('theme/img/multilang.png')}}" alt="Marasiel" title="Marasiel app supports multi languages.">
                <p>
                {{__('home.whyus.content')[5]}}
                </p>
            </div>
        </div>
    </div>

    <div class="container how-it-work" id="how-it-work">
        <div class="row">
            <div class="col-lg-12">
                <h2 align="center">
                {{__('home.howitworks.title')}}
                </h2>

            </div>
        </div>
        <div class="row">
            <div class="col-lg-4">
                <img class="img-fluid" src="{{asset('theme/img/screen1.jpg')}}" alt="Marasiel" title="Browse" id="how-it-work-1">
                <h3 class="text-secondary">{{__('home.howitworks.section')[0]}}</h3>
                <p class="lead mb-5">
                {{__('home.howitworks.content')[0]}}
                </p>
            </div>
            <div class="col-lg-4">
                <img class="img-fluid" src="{{asset('theme/img/screen3.jpg')}}" alt="Marasiel" title="Order" id="how-it-work-2">
                <h3 class="text-secondary">{{__('home.howitworks.section')[1]}}</h3>
                <p class="lead mb-5">
                {{__('home.howitworks.content')[1]}}
                </p>
            </div>
            <div class="col-lg-4">
                <img class="img-fluid" src="{{asset('theme/img/screen2.jpg')}}" alt="Marasiel" title="Tracking" id="how-it-work-3">
                <h3 class="text-secondary">{{__('home.howitworks.section')[2]}}</h3>
                <p class="lead mb-5">
                {{__('home.howitworks.content')[2]}}
                </p>
            </div>
        </div>
    </div>
@endsection
