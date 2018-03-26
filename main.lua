-- Title: NumericTextFields
-- Name: Tristan Royer
-- Course: ICS2O/3C
-- This program asks the user mathematical questions.

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

--sets the background colour
display.setDefault("background",124/255, 15/255,110/255)

-------------------------------------------------------------------------------
-- LOCAL VARIABLES
-------------------------------------------------------------------------------

-- create local variables
local questionObject
local correctObject
local numericField
local randomNumber1
local randomNumber2
local userAnswer
local correctAnswer
local incorrectObject
local randomOperation

----------------------------------------------------------------------------
--LOCAL FUNCTIONS
----------------------------------------------------------------------------

local function AskQuestion()

	-- program chooses a random number betweer 1-4
      randomOperation = math.random(1,4)
	-- generate 2 random numbers between a max. and a min. number
	randomNumber1 = math.random(0,25)
	randomNumber2 = math.random(0,21)
	
	if ( randomOperation == 1)then correctAnswer = randomNumber1 + randomNumber2

	--create question in text object
	questionObject.text = randomNumber1 .. " + " .. randomNumber2 .. " = "
    end

    if (randomOperation == 2) then correctAnswer = randomNumber1 - randomNumber2
    --create question in text object
    questionObject.text = randomNumber1 .. " - " .. randomNumber2.. " = "
end

if (randomOperation == 3) then correctAnswer = randomNumber1 * randomNumber2
	--create question in text object
	questionObject.text = randomNumber1 .. " * " .. randomNumber2 .. " = "
end

if (randomOperation == 4) then correctAnswer = randomNumber1 / randomNumber2
	--create question in text object
	questionObject.text = randomNumber1 .. " / " .. randomNumber2 .. " = "
end

end

local function HideCorrect()
	correctObject.isVisible = false
	AskQuestion()
end

local function HideIncorrect()
	incorrectObject.isVisible = false
	AskQuestion()
end


local function NumericFieldListener( event )

	--User begins editing "numericField"
	if ( event.phase == "began" ) then

		--clear text field
		event.target.text = ""

		elseif event.phase == "submitted" then 
			--when the answer is submitted (enter key is pressed) set user input to user's answer
			userAnswer = tonumber(event.target.text)

			--if the users answer and the correct answer are the same:
			if (userAnswer == correctAnswer) then
				correctObject.isVisible = true
				timer.performWithDelay(1000,HideCorrect)
				else 
				incorrectObject.isVisible = true
                timer.performWithDelay(1000,HideIncorrect)
			end
		end
	end

	 -----------------------------------------------------------------
	 -- OBJECT CREATION
	 -----------------------------------------------------------------

	 -- displays a question and sets the colour	
	 questionObject = display.newText("", display.contentWidth/3, display.contentHeight/2, nil, 40)
	 questionObject:setTextColor(155/255, 150/255, 100/255)

	 --create the correct text object and make it invisible
	 correctObject = display.newText( "Correct!", display.contentWidth/2, display.contentHeight*2/3,nil,50)
	 correctObject.isVisible = false
	 correctObject:setTextColor(180/255,120/255,100/255)

	 -- create the incorrect text object and make it invisible
	 incorrectObject = display.newText( "Incorrect", display.contentWidth/2, display.contentHeight*2/3,nil,50)
	 incorrectObject.isVisible = false
	 incorrectObject:setTextColor(100/255, 180/255, 19/255)
	 -- Create Numeric field
	 numericField = native.newTextField( 500, 350, 150, 30)
	 numericField.inputType = "number"


	 -- add the event listener for the numeric field
	 numericField:addEventListener( "userInput", NumericFieldListener )

	 ---------------------------------------------------------------------
	 --FUNCTION CALLS
	 ---------------------------------------------------------------------

	 -- call the function to ask the question
	 AskQuestion()