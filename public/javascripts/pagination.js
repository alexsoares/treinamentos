    $(function (){
        $('.pagination a').click(function () {
        $.get(this.href, null, null, 'script');
        return false;
        });
    });  