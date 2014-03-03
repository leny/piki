( function( $ ) {
    $( function() {
        $( "form" ).on( "submit", function( e ) {
            e.preventDefault();
            $( "#tiki" ).tiki( $( "#text" ).val(), +$( "select#speed" ).val() );
        } );
    } );
} ).call( this, jQuery );
