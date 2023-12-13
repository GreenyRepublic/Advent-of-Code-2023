:: Solution runner for Advent of Code 2023
:: Written by GreenyRepublic
@echo off
set prefix=%1
for %%f in (%prefix%*.hs) do (
	runghc %%f "%%~nf_input.txt"
)