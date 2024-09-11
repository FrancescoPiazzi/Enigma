# The project
This is an implementation of an [Enigma machine](https://en.wikipedia.org/wiki/Enigma_machine) in Processing.

I wrote this when I was still a beginner, so many parts are poorly written, I have decided to keep them this way to remind myself of my progress.

# Running the project
1. Download the latest version of Processing from [here](https://processing.org/download/)
2. Clone the repo
3. Open the `Enigma.pde` file in Processing
4. Run the sketch

# Using the machine
## Setup
The symmetric cryptograpic key is given by the type, position, and rotation of each rotor, displayed on the top left as colored circles, the type of reflector, displayed as the leftmost colored circle, and the plugboard, which is empty at the start.

You may swap a rotor or reflector with an unused one by clicking on the colored circle, rotors can be rotated manually by using the buttons above or under each rotor.

You may connect two keys together using the plugboard: click on a key, it should become red, then click on another key, a wire will appear connecting the two, click anywhere else to cancel.

## Using the machine
Make sure you remember the rotation of each rotor, as they will change as you are typing

Type the message you want to encrypt (don't type too fast!). While holding down the key, the encrypted character will light up, the message encrypted so far will also be displayed on the top right for convenience.

Once you are done writing the message, reset the rotor positions to the initial state, and type the encrypted message to decrypt it.

Notice how getting any part of the key wrong will result in the decrypted message looking like gibberish. With the only exception being if you get only the plugboard slightly wrong, as that part is only a substitution cipher.
