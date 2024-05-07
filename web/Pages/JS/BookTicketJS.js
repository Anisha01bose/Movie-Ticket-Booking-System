function selectCity(city) {
	switch(city) {
		case 'Kolkata':
			window.location.href = 'new-york-movies.jsp';
			break;
		case 'Chennai':
			window.location.href = 'los-angeles-movies.jsp';
			break;
		case 'New Delhi':
			window.location.href = 'chicago-movies.jsp';
			break;
		case 'Hyderabad':
			window.location.href = 'san-francisco-movies.jsp';
			break;
		case 'Pune ':
			window.location.href = 'houston-movies.jsp';
			break;
		default:
			console.log('Invalid city selected');
			break;
	}
}
