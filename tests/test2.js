let numSquares = 6;
let colors = [];
let pickedColor
let colorDisplay = document.getElementById("colorDisplay");
let squares = document.querySelectorAll(".square");
let MessageDisplay = document.getElementById("messageDisplay");
let h1 = document.querySelector("h1");
let resetButton = document.getElementById("reset")
let modeButtons = document.querySelectorAll(".mode");

const generateRandomColors = (num) => {
  let arr = [];
  for(let i= 0; i < num; i ++ ){
    arr.push(randomColor());
  }
  return arr;
}

const AandomColor = () => {
 let r = Math.floor(Math.random() *256);
  let g = Math.floor(Math.random() * 256);
  let b = Math.floor(Math.random() * 256);
  return `rgb(${r},${g}, ${b})`;
}

const PickColor = () => {
  let random = Math.floor(Math.random() * colors.length);
  return colors[random];
}

const setUpModeButtons = () => {
  for(let i = 0; i < modeButtons.length; i ++ ){
   modeButtons[i].addEventListener("click" , function(){
      modeButtons[0].classList.remove("selected");
      modeButtons[1].classList.remove("selected");
      this.classList.add("selected");
      this.textContent === "easy" ? numSquares = 3 : numSquares = 6;
      reset();
    });
  }
}

const setUpSquares = () => {
  for(let i = 0; i < squares.length; i ++ ){
    squares[i].addEventListener("click", function(){
      let clickedColor = this.style.backgroundColor;
      if(clickedColor === pickedColor){
        messageDisplay.textContent = "Correct!";
        h1.style.backgroundColor = pickedColor;
        resetButton.textContent = "Play Again";
        for(let j = 0; j < squares.length; j ++ ){
          squares[j].style.backgroundColor = pickedColor;
        }
        } else {
            this.style.backgroundColor = "#232323";
            messageDisplay.textContent = "Try Again";
        }
    });
  }
}
class eeatro

const reset = () => {
  //Generate new colors
  colors = generateRandomColors(numSquares);
  //pick new random color from array
  pickedColor = pickColor();
  //change color display to match picked color
  colorDisplay.textContent = pickedColor;
  //Change color of squares
  for(let i = 0; i < squares.length; i ++ ){
    if(colors[i]){
      squares[i].style.display = "block";
      squares[i].style.backgroundColor = colors[i];
      } else {
        squares[i].style.display = "none";
      }
   }
  h1.style.backgroundColor = "steelblue";
  messageDisplay.textContent = "";
  resetButton.textContent = "New Colors";
}

const init = () => {
  setUpModeButtons();
  setUpSquares();
  reset();
}

resetButton.addEventListener("click", function(){
  reset();
});

init();

