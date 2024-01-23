""" Morse Reader """

MORSE_CODE = {
    'A': '.-', 'B': '-...', 'C': '-.-.', 'D': '-..',
    'E': '.', 'F': '..-.', 'G': '--.', 'H': '....',
    'I': '..', 'J': '.---', 'K': '-.-', 'L': '.-..',
    'M': '--', 'N': '-.', 'O': '---', 'P': '.--.',
    'Q': '--.-', 'R': '.-.', 'S': '...', 'T': '-',
    'U': '..-', 'V': '...-', 'W': '.--', 'X': '-..-',
    'Y': '-.--', 'Z': '--..', '1': '.----', '2': '..---',
    '3': '...--', '4': '....-', '5': '.....', '6': '-....',
    '7': '--...', '8': '---..', '9': '----.', '0': '-----',
    '$': '...-..-'
}
rMORSE_CODE = {
    '.-':'A', '-...':'B', '-.-.':'C', '-..':'D',
    '.':'E', '..-.':'F' , '--.':'G', '....':'H',
    '..':'I', '.---':'J', '-.-':'K', '.-..':'L',
    '--':'M', '-.':'N', '---':'O', '.--.':'P',
    '--.-':'Q', '.-.':'R', '...':'S', '-':'T',
    '..-':'U', '...-':'V', '.--':'W', '-..-':'X',
    '-.--':'Y', '--..':'Z', '.----':'1', '..---':'2',
    '...--':'3', '....-':'4', '.....':'5', '-....':'6',
    '--...':'7', '---..':'8', '----.':'9', '-----':'0',
    '...-..-':'$'
}


def decode_morse(morse_code):
    morse_code = morse_code.strip()
    morse_words = morse_code.split('   ')
    morse_words_by_letters = []
    result = ''
    for morse_word in morse_words:
        morse_words_by_letters.append( morse_word.split(' ') )

    for mw in morse_words_by_letters:
        for ml in mw:
            result += rMORSE_CODE[ml]
        result += ' '

    return result.strip()


def decodeMorse(morse_sequence):
    words = []
    for morse_word in morse_sequence.split('   '):
        word = ''.join(rMORSE_CODE.get(morse_char, '') for morse_char in morse_word.split(' '))
        if word:
            words.append(word)

    return ' '.join(words)


print(decode_morse('.... . -.--   .--- ..- -.. .'))
print(decodeMorse('----- .---- ..--- ---.. ----.'))