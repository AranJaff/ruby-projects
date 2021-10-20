
require './lib/caesar_cipher'

describe CaesarCipher do
    describe "#caesar_cipher" do
        it "return a true string for TOP's example" do
            cc = CaesarCipher.new()
            expect(cc.caesar_cipher("What a string!", 5)).to eql("Bmfy f xywnsl!")
        end
        it "returning itself with 0 and 26 shift factor" do
            cc = CaesarCipher.new()
            expect(cc.caesar_cipher("What a string!", 0) || cc.caesar_cipher("What a string!", 26)).to eql("What a string!")
        end
        it "if inserting shift-factors out of range" do
            cc = CaesarCipher.new()
            expect(cc.caesar_cipher("What a string!", -10) || cc.caesar_cipher("What a string!", 30)).to eql("Only enter shift-factor from 0 to 26 !")
        end
        it "a rand shift factor like 12" do
            cc = CaesarCipher.new()
            expect(cc.caesar_cipher("What a string!", 12)).to eql("Itmf m efduzs!")
        end

    end
end

