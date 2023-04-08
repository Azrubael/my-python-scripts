function MatchExpression(str) {
   const regExp = {
      contains_alphaNumeric: /^(?!-)(?!.*-)[A-Za-z0-9-]+(?<!-)$/,
      containsNumber: /\d+/,
      containsAlphabet: /[a-zA-Z]/,
      onlyLetters: /^[A-Za-z]+$/,
      onlyNumbers: /^[0-9]+$/,
      onlyMixAlphaNmeric: /^([0-9]+[a-zA-Z]+|[a-zA-Z]+[0-9]+)[0-9a-zA-Z]*$/,
      isEmail: /^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)/
   }

   let expMatch= {}
   expMatch.contains_alphaNumeric = regExp.contains_alphaNumeric.test(str)
   expMatch.containsNumber = regExp.containsNumber.test(str)
   expMatch.containsAlphabet = regExp.containsAlphabet.test(str)
   expMatch.onlyLetters = regExp.onlyLetters.test(str)
   expMatch.onlyNumbers = regExp.onlyNumbers.test(str)
   expMatch.onlyMixAlphaNmeric = regExp.onlyMixAlphaNmeric.test(str)
   expMatch.isEmail = regExp.isEmail.test(str)

   return expMatch
}

let result = MatchExpression('retwr,*8989wr0') 
console.log(result.contains_alphaNumeric)

let email = MatchExpression('is@mua') 
console.log('it contains email: ', email.isEmail)

