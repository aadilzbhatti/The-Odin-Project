require "caesar"

describe "the caesar cipher" do
	it "encodes strings without a shift" do
		caesar_cipher("Hello world").should == "Hello world"
	end
	it "encodes strings with a shift" do
		caesar_cipher("Hello world", 1).should == "Ifmmp xpsme"
		caesar_cipher("What a string!", 5).should == "Bmfy f xywnsl!"
	end	
	it "wraps strings around when shift > 'z'" do
		caesar_cipher("wxyz", 1).should == "xyza"
	end
	it "wraps strings around when shift > 'Z'" do
		caesar_cipher("WXYZ", 1).should == "XYZA"
	end
	it "encodes strings with punctuation" do
		caesar_cipher("You! Over there! Wh@t i$ y0ur n@m3?", 1).should == "Zpv! Pwfs uifsf! Xi@u j$ z0vs o@n3?"
	end
	it "encodes strings with gigantic shifts" do
		caesar_cipher("Hello world", 365).should == "Ifmmp xpsme"
	end
end