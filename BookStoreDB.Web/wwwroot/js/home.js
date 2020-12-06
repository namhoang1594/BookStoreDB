var Bookstore = {} || Bookstore;

Bookstore.tbBookstore = function () {
    $.ajax({
        url: 'https://localhost:44378/api/book/gets',
        method: 'GET',
        contentType: 'JSON',
        success: function (data) {
            $.each(data, function (i, v) {
                $('#tbBookstore>tbody').append(`<tr>
                                            <td>${v.ID}</td>
                                            <td>${v.BookName}</td>
                                            <td>${v.Author}</td>
                                            <td>${v.PublishingHouse}</td>
                                            <td>${v.Category}</td>
                                            <td>${v.YearReleased}</td>
                                        </tr>`);
            })

        }
    });
}





Bookstore.init = function () {
    Bookstore.tbBookstore();
}

$(document).ready(function () {
    Bookstore.init();
});