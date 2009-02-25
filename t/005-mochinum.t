#!/usr/bin/env escript
%% -*- erlang -*-
%%! -pa ./ebin errlog_type error -boot start_sasl

main(_) ->
    etap:plan(26),
    etap:is(1, mochinum:int_ceil(0.0001), "int_ceil/1"),
    etap:is(0, mochinum:int_ceil(0.0), "int_ceil/1"),
    etap:is(1, mochinum:int_ceil(0.99), "int_ceil/1"),
    etap:is(1, mochinum:int_ceil(1.0), "int_ceil/1"),
    etap:is(-1, mochinum:int_ceil(-1.5), "int_ceil/1"),
    etap:is(-2, mochinum:int_ceil(-2.0), "int_ceil/1"),
    etap:is(1, mochinum:int_pow(1, 1), "int_pow/2"),
    etap:is(1, mochinum:int_pow(1, 0), "int_pow/2"),
    etap:is(1, mochinum:int_pow(10, 0), "int_pow/2"),
    etap:is(10, mochinum:int_pow(10, 1), "int_pow/2"),
    etap:is(100, mochinum:int_pow(10, 2), "int_pow/2"),
    etap:is(1000, mochinum:int_pow(10, 3), "int_pow/2"),
    etap:is("0", mochinum:digits(0), "digits/1"),
    etap:is("0.0", mochinum:digits(0.0), "digits/1"),
    etap:is("1.0", mochinum:digits(1.0), "digits/1"),
    etap:is("-1.0", mochinum:digits(-1.0), "digits/1"),
    etap:is("0.1", mochinum:digits(0.1), "digits/1"),
    etap:is("0.01", mochinum:digits(0.01), "digits/1"),
    etap:is("0.001", mochinum:digits(0.001), "digits/1"),
    etap:is({0.0, 0}, mochinum:frexp(0.0), "frexp/1"),
    etap:is({0.5, 1}, mochinum:frexp(1.0), "frexp/1"),
    etap:is({-0.5, 1}, mochinum:frexp(-1.0), "frexp/1"),
    <<SmallDenorm/float>> = <<0,0,0,0,0,0,0,1>>,
    etap:is({0.5, -1073}, mochinum:frexp(SmallDenorm), "frexp/1"),
    <<BigDenorm/float>> = <<0,15,255,255,255,255,255,255>>,
    etap:is({0.99999999999999978, -1022}, mochinum:frexp(BigDenorm), "frexp/1"),
    <<SmallNorm/float>> = <<0,16,0,0,0,0,0,0>>,
    etap:is({0.5, -1021}, mochinum:frexp(SmallNorm), "frexp/1"),
    <<LargeNorm/float>> = <<127,239,255,255,255,255,255,255>>,
    etap:is({0.99999999999999989, 1024}, mochinum:frexp(LargeNorm), "frexp/1"),
    etap:end_tests().