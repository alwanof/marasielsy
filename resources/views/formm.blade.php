<form action="{{route('savee')}}" method="post">
    @csrf
    <h1>hiiii</h1>

    <textarea name="body" id="body" cols="100" rows="30">

    </textarea>
    <button type="submit">send</button>
</form>
