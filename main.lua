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

----------------------------------------------------------------------------
--LOCAL FUNCTIONS
----------------------------------------------------------------------------

local function AskQuestion()
	-- generate 2 random numbers between a max. and a min. number
	randomNumber1 = math.random(0,25)
	randomNumber2 = math.random(0,21)

	correctAnswer = randomNumber1 + randomNumber2

	--create question in text object
	questionObject.text = randomNumber1 .. " + " .. randomNumber2 .. " = "

end

local function HideCorrect()
	correctObject.isVisible = false
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
				timer.performWithDelay(2000,HideCorrect)
			end
		end
	end

	 -----------------------------------------------------------------
	 -- OBJECT CREATION
	 -----------------------------------------------------------------

	 -- displays a question and sets the colour	
	 questionObject = display.newText("", display.contentWidth/3, display.contentHeight/2, nil, 50)
	 questionObject:setTextColor(155/255, 42/255, 100/255)

	 --create the correct text object and make it invisible
	 correctObject = display.newText( "Correct!", display.contentWidth/2, display.contentHeight*2/3,nil,50)
	 correctObject.isVisible = false

	 -- Create Numeric field
	 numericField = native.newTextField( display.contentWidth/2, display.contentHeight/2, 150, 80)
	 numericField.inputType = "number"

	 -- add the event listener for the numeric field
	 numericField:addEventListener( "userInput", NumericFieldListener )

	 ---------------------------------------------------------------------
	 --FUNCTION CALLS
	 ---------------------------------------------------------------------

	 -- call the function to ask the question
	 AskQuestion()