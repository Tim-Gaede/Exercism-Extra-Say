function say(n)

    if n == 0;    return "zero";    end


    output = ""
    chunks_1000s = []
    if n < 0
        output *= "negative "
        n *= -1
    end

    if n > 999_999_999_999_999_999  ||  n < -999_999_999_999_999_999
        throw(DomainError("Number cannot have more than eighteen digits."))
    end

    base1000 = []

    # Good for any 64 bit integer:
    words_base1000 = ["thousand", "million", "billion",
                      "trillion", "quadrillion"]

    rem = n # remainder
    while rem > 0
        push!(base1000, rem % 1000)
        rem ÷= 1000
    end

    reverse!(base1000)

    for i = 1 : length(base1000) # superdigits in base 1000 with range 0 to 999
        chunk_1000s = ""

        hundreds = base1000[i] ÷ 100
        tens = (base1000[i] ÷ 10) % 10
        ones = base1000[i] % 10
        last_two = base1000[i] % 100



        word_u20 = ["one", "two", "three", "four", "five", "six",
                    "seven", "eight", "nine", "ten", "eleven", "twelve",
                    "thirteen", "fourteen", "fifteen", "sixteen",
                    "seventeen", "eighteen", "nineteen"]


        word_tens = ["ERROR DO NOT USE",
                     "twenty", "thirty", "forty", "fifty",
                     "sixty", "seventy", "eighty", "ninety"]



        if hundreds > 0
            chunk_1000s *= word_u20[hundreds] * " hundred"

            if tens ≥ 2

                chunk_1000s *= " and " * word_tens[tens]  # "... and fifty ..."

                if ones > 0;    chunk_1000s *= "-" * word_u20[ones];    end


            elseif last_two ≥ 1
                chunk_1000s *= " " * word_u20[last_two]  # "... and thirteen"
            end

        else
            if tens ≥ 2
                chunk_1000s *= word_tens[tens]  # "fifty ..."

                if ones > 0;    chunk_1000s *= "-" * word_u20[ones];    end


            elseif last_two ≥ 1
                chunk_1000s *= word_u20[last_two]  # "... thirteen"
            end
        end

        push!(chunks_1000s, chunk_1000s)
    end

    for c = 1 : length(chunks_1000s)-1
        #p = length(chunks_1000s) - c#<----------CHANGE!!!!!!!!?????
        if chunks_1000s[c] != ""
            output *= chunks_1000s[c] * " " *
                      words_base1000[length(chunks_1000s) - c]
        end
        if chunks_1000s[c+1] != "";    output *= " ";    end
    end

    output *= chunks_1000s[length(chunks_1000s)]


    output # returned
end
