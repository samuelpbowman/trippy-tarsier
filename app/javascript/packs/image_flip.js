$('.party').on('click', () => {
    if ($(this).attr('flipped')) {
        $(this).removeAttr('flipped');
        $(this).removeClass('invi');
    } else {
        $(this).attr('flipped','flipped');
        $(this).addClass('invi');
    }
});
