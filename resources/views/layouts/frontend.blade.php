<!doctype html>
<html lang="{{ str_replace('_', '-', session('locale')) }}" >
  <head>
      <!-- Global site tag (gtag.js) - Google Analytics -->
      <script async src="https://www.googletagmanager.com/gtag/js?id=UA-159855818-1"></script>
      <script>
          window.dataLayer = window.dataLayer || [];
          function gtag(){dataLayer.push(arguments);}
          gtag('js', new Date());

          gtag('config', 'UA-159855818-1');
      </script>

      <!-- Required meta tags -->
    <meta charset="utf-8">

    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <meta name="description" content="As a company specialized in the field of taxi and delivery services” within cities and towns up to now; and after comprehensively summing up and evaluating our experience in offering relevant services, we came up with MARASIEL application that covers most, if not all, the need to be delivered items between two addresses, to and from our current and potential customers. ">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">


    @if(session('locale')=='ar')
        <link rel="stylesheet" href="{{ asset('theme/css/rtl.css') }}" >
    @else
        <link rel="stylesheet" href="{{asset('theme/css/main.css')}}">
    @endif

    <link rel="icon" href="{{asset('theme/img/logo2.png')}}">

    <script src="{{asset('siteconfig.js')}}" ></script>

    <title>{{__('frontmaster.title')}} - @yield('page-title')</title>

  </head>
  <body>

    <nav class="navbar navbar-expand-lg navbar-light fixed-top bg-yellow">
        <div class="container">
            <a class="navbar-brand" href="{{route('start')}}">
                <img class="img-fluid" src="{{asset('theme/img/logo.png')}}" alt="Marasiel" title="Marasiel">
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav ml-auto navigation-bar-links">
                    <li class="nav-item active">
                        <a class="nav-link" href="{{route('start')}}/#home" title="Home">{{__('frontmaster.menu.home')}} <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="{{route('start')}}/#about-us" title="About us">{{__('frontmaster.menu.about')}}</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="{{route('start')}}/#competitiveness" title="Competitiveness">{{__('frontmaster.menu.competitiveness')}}</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="{{route('start')}}/#features" title="Why us ?">{{__('frontmaster.menu.whyus')}}</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="{{route('start')}}/#how-it-work" title="How it works ?">{{__('frontmaster.menu.howitworks')}}</a>
                    </li>
                    <li class="nav-item">
                        <a href="{{route('drivers.index')}}" class="nav-link btn btn-white" id="be_our_driver" title="Be our driver">{{__('frontmaster.menu.beourdriver')}}</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            {{__('frontmaster.menu.languages')}}
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            @foreach(Config::get('countries.language') as $key=>$lang)
                                <a class="dropdown-item drop-link {{(session('locale')==$key)?'disabled':''}}" href="{{url('/lang/'.$key)}}">{{$lang }}</a>
                            @endforeach
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    @yield('content')

    <!-- Footer -->
    <footer class="page-footer font-small indigo footer">

        <!-- Footer Links -->
        <div class="container text-center text-md-left">

            <!-- Grid row -->
            <div class="row">

                <!-- Grid column -->
                <div class="col-md-3 mx-auto footer-col-1">

                    <!-- Links -->
                    <img class="img-fluid" src="{{asset('theme/img/logo-footer.png')}}" alt="Marasiel" title="Marasiel">

                    <br> <br>

                    <a class="text-light mx-2" href="https://www.youtube.com/channel/UCNutojGf3HN-VWvqU1UYlyw" title="Marasiel" target="_blank"><i class="fab fa-youtube fa-2x" title="Marasiel"></i>

                    <a class="text-light mx-2" href="https://twitter.com/Marasiel1" title="Marasiel" target="_blank"><i class="fab fa-twitter fa-2x" title="Marasiel"></i></a>

                    <a class="text-light mx-2" href="https://www.facebook.com/marasilco/" title="Marasiel" target="_blank"><i class="fab fa-facebook-f fa-2x" title="Marasiel"></i></a>

                    <div class="mt-3"></div>

                    <a class="text-light" href="mailto:info@marasiel.com" title="Marasiel"><i class="far fa-envelope" title="Marasiel"></i> info@marasiel.com</a>

                </div>
                <!-- Grid column -->

                <hr class="clearfix w-100 d-md-none">

                <!-- Grid column -->
                <div class="col-md-3 mx-auto footer-col-2">

                    <!-- Links -->
                    <h5 class="mt-3 mb-4 text-white">Quick Links :</h5>

                    <ul class="list-unstyled">
                        <li>
                            <a href="{{route('start')}}/#carouselExampleControls" class="text-white" title="Marasiel">{{__('frontmaster.menu.home')}}</a>
                        </li>
                        <li>
                            <a href="{{route('start')}}/#about-us" class="text-white" title="Marasiel">{{__('frontmaster.menu.about')}}</a>
                        </li>
                        <li>
                            <a href="{{route('start')}}/#competitiveness" class="text-white" title="Marasiel">{{__('frontmaster.menu.competitiveness')}}</a>
                        </li>
                        <li>
                            <a href="{{route('start')}}/#features" class="text-white" title="Marasiel">{{__('frontmaster.menu.whyus')}}</a>
                        </li>
                        <li>
                            <a href="{{route('start')}}/#how-it-work" class="text-white" title="Marasiel">{{__('frontmaster.menu.howitworks')}}</a>
                        </li>
                    </ul>

                </div>
                <!-- Grid column -->

                <hr class="clearfix w-100 d-md-none">

                <!-- Grid column -->
                <div class="col-md-3 mx-auto footer-col-2">

                    <!-- Links -->
                    <h5 class="mt-3 mb-4 text-white">Quick Links :</h5>

                    <ul class="list-unstyled">
                        <li>
                            <a href="{{route('drivers.index')}}" class="text-white" title="Marasiel">{{__('frontmaster.menu.beourdriver')}}</a>
                        </li>
                        <li>
                            <a href="#!" class="text-white" title="Marasiel">{{__('frontmaster.menu.terms')}}</a>
                        </li>
                        <li>
                            <a href="#!" class="text-white" title="Marasiel">{{__('frontmaster.menu.privacypolicy')}}</a>
                        </li>
                    </ul>

                </div>
                <!-- Grid column -->

                <hr class="clearfix w-100 d-md-none">

                <!-- Grid column -->
                <div class="col-md-3 mx-auto footer-col-2">

                    <!-- Links -->
                    <ul class="list-unstyled">
                        <li>
                            <a href="#" class="text-light" title="Marasiel">
                                <img class="img-fluid" src="{{asset('theme/img/appstore.svg')}}" alt="Marasiel" title="Marasiel">
                            </a>
                        </li>
                        <li>
                            <a href="https://play.google.com/store/apps/details?id=com.marasiel.customer" class="text-light" title="Marasiel">
                                <img class="img-fluid" src="{{asset('theme/img/gplay.svg')}}" alt="Marasiel" title="Marasiel">
                            </a>
                        </li>
                    </ul>

                </div>
                <!-- Grid column -->

            </div>
            <!-- Grid row -->

        </div>
        <!-- Footer Links -->

        <!-- Copyright -->
        <div class="footer-copyright text-center py-3 text-white">© Copywrite 2020 Marasiel Team :
            <a href="http://www.marasiel.com" class="text-white" title="Marasiel"> Marasiel</a>
        </div>
        <!-- Copyright -->

    </footer>
    <!-- Footer -->

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="{{asset('theme/js/main.js')}}"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
  </body>
</html>
