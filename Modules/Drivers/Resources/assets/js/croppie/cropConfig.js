var placeID = null;
$image_crop = $('#image_demo').croppie({
    //enableExif: true,
    viewport: {
        width: 200,
        height: 200,
        type: 'circle' //square
    },
    boundary: {
        width: 300,
        height: 300
    }
});

$('.crop_image').click(function(event) {
    $image_crop.croppie('result', {
        type: 'canvas',
        size: 'viewport'
    }).then(function(response) {
        var rand = $("#hash").val();

        $.ajax({
            url: "modules/drivers/js/croppie/upload-demo.php?title=" + rand,
            type: "POST",
            data: { "image": response },
            success: function(data) {
                $('#uploadimageModal').modal('hide');
                $(placeID).html(data);
            }
        });
    })
});

function canvasArea(areaID, placeHolder) {
    placeID = placeHolder;
    var reader = new FileReader();
    reader.onload = function(event) {
        $image_crop.croppie('bind', {
            url: event.target.result
        }).then(function() {
            console.log('jQuery bind complete');
        });
    }

    reader.readAsDataURL(areaID.files[0]);
    $('#uploadimageModal').modal('show');

}