using Test

include("say.jl")


# Tests adapted from `problem-specifications//canonical-data.json` @ v1.2.0


@testset "zero" begin
    @test say(0) == "zero"
end

@testset "one" begin
    @test say(1) == "one"
end

@testset "fourteen" begin
    @test say(14) == "fourteen"
end

@testset "twenty" begin
    @test say(20) == "twenty"
end

@testset "twenty-two" begin
    @test say(22) == "twenty-two"
end

@testset "one hundred" begin
    @test say(100) == "one hundred"
end

@testset "one hundred twenty three" begin
    @test say(123) == "one hundred and twenty-three"
end

@testset "one thousand" begin
    @test say(1_000) == "one thousand"
end

@testset "one thousand two hundred thirty-four" begin
    @test say(1_234) == "one thousand two hundred and thirty-four"
end

@testset "one million" begin
    @test say(1_000_000) == "one million"
end

@testset "1,002,345" begin
    @test say(1_002_345) ==
        "one million two thousand three hundred and forty-five"
end

@testset "one billion" begin
    @test say(1_000_000_000) == "one billion"
end

@testset "987,654,321,123" begin
    @test say(987_654_321_123) == "nine hundred and eighty-seven billion " *
                                   "six hundred and fifty-four million " *
                                   "three hundred and twenty-one thousand " *
                                   "one hundred and twenty-three"
end

@testset "423,728,987,654,321,123" begin
    @test say(423_728_987_654_321_123) ==
    "four hundred and twenty-three quadrillion " *
    "seven hundred and twenty-eight trillion " *
    "nine hundred and eighty-seven billion " *
    "six hundred and fifty-four million " *
    "three hundred and twenty-one thousand " *
    "one hundred and twenty-three"
end

@testset "number too large" begin
    @test_throws DomainError say(1_000_000_000_000_000_000)
end

@testset "number negative" begin
    @test say(-1_002_345) ==
        "negative one million two thousand three hundred and forty-five"
end
