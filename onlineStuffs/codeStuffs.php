<?php
@foreach($countries as $country)
    <option value="{{$country->iso}}" {{(Session('iso') == $country->iso ? 'selected':'')}}>{{$country->name}}</option>
@endforeach

