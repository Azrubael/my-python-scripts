// wait for ms milliseconds

function pWait(ms) {
  // console.time('run pWait')
  ms = parseFloat(ms)
  return new Promise((resolve, reject) => {
    if (!ms || ms < 1 || ms > 3000) {
      reject( new RangeError('Invalid ms value') )
    } else {
      setTimeout( resolve, ms, ms )
    }
  // console.timeEnd('run pWait')
  })
}

console.time('function pWait')
pWait(process.argv[2])
console.timeEnd('function pWait')
