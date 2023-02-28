getTime = () => {
	let date = new Date(),
		min = date.getMinutes(),
		sec = date.getSeconds(),
		hour = date.getHours()

	return (
		'' +
		(hour < 10 ? '0' + hour : hour) +
		':' +
		(min < 10 ? '0' + min : min) +
		':' +
		(sec < 10 ? '0' + sec : sec)
	)
}
document.getElementById('clock').innerHTML = getTime()
setInterval(() => {
	document.getElementById('clock').innerHTML = getTime()
}, 1000)
document.addEventListener('keydown', (event) => {
	// Focus search box on pressing i
	if (
		event.keyCode === 73 &&
		document.activeElement !== document.getElementById('search-field')
	) {
		event.preventDefault()
		document.getElementById('search-field').focus()
	} else if (event.keyCode === 27) {
		// Esc to unfocus from the search box
		document.getElementById('search-field').value = ''
		document.getElementById('search-field').blur()
	}
})
// Google search on Enter key event
document.getElementById('search-field').addEventListener('keydown', (event) => {
	if (event.keyCode === 13) {
		var val = document.getElementById('search-field').value
		window.open('https://google.com/search?q=' + val)
		document.getElementById('search-field').value = ''
	}
})
