// only print filenames
module.exports = function( results ) {
	return results
		.filter( result => 0 < result.messages.length )
		.map( result => result.filePath.replace( '/Users/dharris/_ctm/ctm-everpress/wp-content/themes/ctm/javascripts/', '' ) ).join( '\n' );
};