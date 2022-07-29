# Coding challenge
## Group by range
The input consists of an array of objects, which have different ids and amounts.
The objective is to generate an output with the following fields:

- ranges: objects with the key of the string of the corresponding range from 10 to 10 (0-9, 10-19 etc.) 
         and the value with the average (average of the values on the range rounded up) and the array of ids that correspond to that range
- top: array of ids that correspond to the ids with the largest amount (not range)
- calculations: two-dimensional array with the average of each range.

Example:
- Input "[{\"id\":1,\"amount\":10},{\"id\":2,\"amount\":32},{\"id\":3,\"amount\":55},{\"id\":4,\"amount\":30},{\"id\":5,\"amount\":32},{\"id\":6,\"amount\":32}]"
- Output
```sh
{"ranges":{"10-19":{"average":10,"ids":[1]},"30-39":{"average":32,"ids":[2,4,5,6]},"50-59":{"average":55,"ids":[3]}},"top":[3],"calculations":[]}
```