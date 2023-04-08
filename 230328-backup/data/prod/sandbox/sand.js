function checkDigit(str) {
  	let hasNumber = /\d+/
	let check = hasNumber.test(str)
  	return check
}


let chk = checkDigit('qq')
console.log(chk)